###########################################################
# Assignment #: 4
#  Name: Majed Ghasib
#  ASU email: mghasib@asu.edu
#  Course: CSE/EEE230, my lecture MW 3:00pm
#  Description: This program checks if the customer is member or not and if they were customers how much discount do they get
###########################################################
#data declarations: declare variable names used in program, storage allocated in RAM
                            .data  
msg0:              .asciiz "\nAre you a store member? Enter 1 for a member, 0 for a non-member"
msg1:             .asciiz "\nEnter your purchase amount in cents:"

msg3:             .asciiz "\nYour total payment is "
msg4:             .asciiz "\nInvalid Answer "






#program code is contained below under .text
                        .text
                        .globl    main    #define a global function main

# the program begins execution at main()
main:
        #prints the 1st msg
        li $v0, 4
        la $a0, msg0
        syscall
        #gets user input
        li $v0, 5
        syscall
        move $t0, $v0
        #if userinput <=3 num4 runs
        addi $t3, $zero, 3
        slt  $s0, $t0, $t3
        beq $s0, $zero, num4
        #if userinput 1 num1 runs
        addi $t1, $zero, 1
        slt  $s0, $t0, $t1
        beq $s0, $zero, num1
        #if userinput 0 num3 runs
        addi $t2, $zero, 0
        slt  $s0, $t0, $t2
        beq $s0, $zero, num3

        
        
        
        


        li $v0, 10
        syscall


    jr   $ra    

num1:
#prints the 2nd msg
    li $v0, 4
        la $a0, msg1
        syscall
    #gets user input
    li $v0, 5
        syscall
    #moves userinput to $t0
    move $t0, $v0
    #if user input => 9001 it goes to num2
        addi $t2, $zero, 9001
        slt  $s0, $t0, $t2
        beq $s0, $zero, num2
    #if not this gets run
    addi $t1, $zero, 10
    div $t2, $t0, $t1
    addi $t3, $zero, 9
    mul $t4, $t3, $t2

    #prints the msg3
    li $v0, 4
        la $a0, msg3
        syscall
    move $a0, $t4
    li $v0, 1
    syscall
    
    li $v0, 10
    syscall
num2:
    #userinput * 0.9 = $t6
    addi $t1, $zero, 10
    div $t2, $t0, $t1
    addi $t3, $zero, 9
    mul $t4, $t3, $t2
    addi $t5, $zero, 200
    sub  $t6, $t4, $t5


    li $v0, 4
        la $a0, msg3
        syscall
    move $a0, $t6
    li $v0, 1
    syscall

        li $v0, 10
    syscall

num3:
#if user wan not a mamber this runs
    li $v0, 4
        la $a0, msg1
        syscall
    li $v0, 5
        syscall
    move $t0, $v0
    li $v0, 4
        la $a0, msg3
        syscall
    move $a0, $t0
    li $v0, 1
    syscall





        li $v0, 10
    syscall


num4:
    #if user wan not a mamber this runs
    li $v0, 4
        la $a0, msg4
        syscall





        li $v0, 10
    syscall


        
