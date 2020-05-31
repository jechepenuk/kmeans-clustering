# hardcoded 10 points, x coordinates and corresponding y coordinates in aX and aY respectively inside .data
# user inputs inital centroids

.data
    aX: .word 1, 2, 4, 8, 6, 3, 4, 4, 1, 6
    aY: .word 5, 4, 7, 8, 6, 6, 5, 2, 3, 7

    c1x: .asciiz "centroid 1 X coordinate: "
    c1y: .asciiz "centroid 1 Y coordinate: "
    c2x: .asciiz "centroid 2 X coordinate: "
    c2y: .asciiz "centroid 2 Y coordinate: "
  
    cluster1x: .space 40
    cluster1y: .space 40
    cluster2x: .space 40
    cluster2y: .space 40

    result1: .asciiz "\nCluster 1 has points: "
    result2: .asciiz "\nCluster 2 has points: "
    comma: .asciiz ","
    leftp: .asciiz "("
    rightp: .asciiz ")"

.text
    main:
     li $v0,4    
   	 la $a0,c1x    
   	 syscall   	  
   	 li $v0,5    
   	 syscall     
   	 move $s3,$v0        # s3=c1x
	   li $v0,4    
   	 la $a0,c1y    
   	 syscall   	 
   	 li $v0,5    
   	 syscall   	 
   	 move $s4,$v0        # s4=c1y
   	 li $v0,4    
   	 la $a0,c2x    
   	 syscall   	 
   	 li $v0,5    
   	 syscall   	 
   	 move $s5,$v0        # s5=c2x
   	 li $v0,4    
   	 la $a0,c2y    
   	 syscall   		 
   	 li $v0,5    
   	 syscall   	 
   	 move $s6,$v0        # s6=c2y

     li $s0, 0           # i=0
     li $s7, 10          # break when i=10
     la $s1, aX          # ax in s1
     la $s2, aY          # ay in 
     addiu $sp, $sp, -8
     li $t0, 0
     li $t1, 0
     sw $t0, 0($sp) # num points in cluster1
     sw $t1, 4($sp) # num points in cluster2

    while:
     bge $s0, $s7, load
     lw $t0, ($s1)      # sp=ax[0]
     lw $t1, ($s2)      # 4sp=ay[0]
     sub $t3,$t0,$s3 	 # t3=cx-ax1
   	 sub $t4,$t1,$s4    # t4=cy-ay1
   	 mul $t3,$t3,$t3	 # x1-x2 SQUARED
   	 mul $t4,$t4,$t4   	 # y1-y2 SQUARED
   	 add $t3,$t3,$t4     # t3=euclidean of first points
     sub $t4,$t0,$s5 	 # t3=cx-ax2
   	 sub $t5,$t1,$s6    # t4=cy-ay2
   	 mul $t4,$t4,$t4	 # x1-x2 SQUARED
   	 mul $t5,$t5,$t5   	 # y1-y2 SQUARED
   	 add $t4,$t4,$t5     # t4=euclidean of second points  
     addi $s0, $s0, 1  # i++
     ble $t3, $t4, addCluster1
     b addCluster2

    addCluster1:
     lw $t3, ($sp) 
     la $t0, cluster1x
     la $t1, cluster1y
     add $t5, $t3, $t3
     add $t5, $t5, $t5 # mult x 4
     add $t0, $t0, $t5
     add $t1, $t1, $t5
     lw $t2, ($s1)      
     lw $t4, ($s2)
     sw $t2, ($t0)
     sw $t4, ($t1)
     addi $s1, $s1, 4
     addi $s2, $s2, 4
     addi $t3, $t3, 1
     sw $t3, ($sp)
     j while
     
    addCluster2:
     lw $t3, 4($sp)
     la $t0, cluster2x
     la $t1, cluster2y
     add $t5, $t3, $t3
     add $t5, $t5, $t5
     add $t0, $t0, $t5
     add $t1, $t1, $t5
     lw $t2, ($s1)      
     lw $t4, ($s2)
     sw $t2, ($t0)
     sw $t4, ($t1)
     addi $s1, $s1, 4
     addi $s2, $s2, 4
     addi $t3, $t3, 1
     sw $t3, 4($sp)
     j while

    load:
     la $s3, cluster1x
     la $s4, cluster1y
     la $s5, cluster2x
     la $s6, cluster2y
     li $s0, 0 # i=0
     li $s7, 0
     lw $s1, ($sp) # elements in c1
     lw $s2, 4($sp) # elements in c2
     li $v0,4     
   	 la $a0,result1
   	 syscall   	 # print centoid 1....
     b print1

   	print1:
     bge $s0, $s1, l2 		 
     li $v0,4     
   	 la $a0, leftp
   	 syscall 
     lw $t0, ($s3)
     li $v0, 1
     move $a0, $t0
     syscall
     li $v0,4     
   	 la $a0, comma
   	 syscall 
     lw $t0, ($s4)
     li $v0, 1
     move $a0, $t0
     syscall  
     li $v0,4     
   	 la $a0, rightp
   	 syscall 
     addi $s3, $s3, 4
     addi $s4, $s4, 4
     addi $s0, $s0, 1
     j print1

    l2:
     li $v0,4     
   	 la $a0,result2
   	 syscall   
     j print2

    print2:   		 
   	 bge $s7, $s2, exit 		 
     li $v0,4     
   	 la $a0, leftp
   	 syscall 
     lw $t0, ($s5)
     li $v0, 1
     move $a0, $t0
     syscall
     li $v0,4     
   	 la $a0, comma
   	 syscall 
     lw $t0, ($s6)
     li $v0, 1
     move $a0, $t0
     syscall  
     li $v0,4     
   	 la $a0, rightp
   	 syscall 
     addi $s5, $s5, 4
     addi $s6, $s6, 4
     addi $s7, $s7, 1
     j print2
    
    exit:
     addi $sp, $sp, 8 
   	 li $v0,10
   	 syscall     # end
