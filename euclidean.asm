# hardcoded 10 points, x coordinates and corresponding y coordinates in aX and aY respectively inside .data
# user inputs inital centroids

.data
    x1: .asciiz "x1: "
    y1: .asciiz "y1: "
    x2: .asciiz "x2: "
    y2: .asciiz "y2: "
    result: .asciiz "Euclidean distance is: "
.text
    main:
   	 li $v0,4    
   	 la $a0,x1    
   	 syscall  	    
   	 li $v0,5    
   	 syscall     
   	 move $t1,$v0    # t1=x1
	 li $v0,4    
   	 la $a0,y1    
   	 syscall   	 
   	 li $v0,5    
   	 syscall   	 
   	 move $t2,$v0    # t2=y1
   	 li $v0,4    
   	 la $a0,x2    
   	 syscall   	 
   	 li $v0,5    
   	 syscall   	 
   	 move $t3,$v0    # t3=x2
  	 li $v0,4    
   	 la $a0,y2    
   	 syscall   	 
   	 li $v0,5    
   	 syscall   	 
   	 move $t4,$v0    # t4=y2
   	 sub $s0,$t1,$t3
   	 sub $s1,$t2,$t4
   	 mul $s0,$s0,$s0
   	 mul $s1,$s1,$s1
   	 add $s2,$s1,$s0

  	exit:
   	 li $v0,4     
   	 la $a0,result
   	 syscall   	 
   	 li $v0,1
	 move $a0, $s2
   	 syscall    
   	 li $v0,10
   	 syscall     
