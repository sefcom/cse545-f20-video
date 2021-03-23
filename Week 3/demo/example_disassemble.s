
example.out:     file format elf64-x86-64


Disassembly of section .init:

00000000004004e8 <_init>:
  4004e8:	48 83 ec 08          	sub    rsp,0x8
  4004ec:	48 8b 05 f5 0a 20 00 	mov    rax,QWORD PTR [rip+0x200af5]        # 600fe8 <__gmon_start__>
  4004f3:	48 85 c0             	test   rax,rax
  4004f6:	74 02                	je     4004fa <_init+0x12>
  4004f8:	ff d0                	call   rax
  4004fa:	48 83 c4 08          	add    rsp,0x8
  4004fe:	c3                   	ret

Disassembly of section .plt:

0000000000400500 <.plt>:
  400500:	ff 35 02 0b 20 00    	push   QWORD PTR [rip+0x200b02]        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400506:	ff 25 04 0b 20 00    	jmp    QWORD PTR [rip+0x200b04]        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40050c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400510 <__stack_chk_fail@plt>:
  400510:	ff 25 02 0b 20 00    	jmp    QWORD PTR [rip+0x200b02]        # 601018 <__stack_chk_fail@GLIBC_2.4>
  400516:	68 00 00 00 00       	push   0x0
  40051b:	e9 e0 ff ff ff       	jmp    400500 <.plt>

0000000000400520 <printf@plt>:
  400520:	ff 25 fa 0a 20 00    	jmp    QWORD PTR [rip+0x200afa]        # 601020 <printf@GLIBC_2.2.5>
  400526:	68 01 00 00 00       	push   0x1
  40052b:	e9 d0 ff ff ff       	jmp    400500 <.plt>

Disassembly of section .plt.got:

0000000000400530 <__cxa_finalize@plt>:
  400530:	ff 25 c2 0a 20 00    	jmp    QWORD PTR [rip+0x200ac2]        # 600ff8 <__cxa_finalize@GLIBC_2.2.5>
  400536:	66 90                	xchg   ax,ax

Disassembly of section .text:

0000000000400540 <_start>:
  400540:	31 ed                	xor    ebp,ebp
  400542:	49 89 d1             	mov    r9,rdx
  400545:	5e                   	pop    rsi
  400546:	48 89 e2             	mov    rdx,rsp
  400549:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  40054d:	50                   	push   rax
  40054e:	54                   	push   rsp
  40054f:	49 c7 c0 a0 07 40 00 	mov    r8,0x4007a0
  400556:	48 c7 c1 30 07 40 00 	mov    rcx,0x400730
  40055d:	48 c7 c7 b4 06 40 00 	mov    rdi,0x4006b4
  400564:	ff 15 76 0a 20 00    	call   QWORD PTR [rip+0x200a76]        # 600fe0 <__libc_start_main@GLIBC_2.2.5>
  40056a:	f4                   	hlt
  40056b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400570 <deregister_tm_clones>:
  400570:	48 8d 3d c1 0a 20 00 	lea    rdi,[rip+0x200ac1]        # 601038 <__TMC_END__>
  400577:	55                   	push   rbp
  400578:	48 8d 05 b9 0a 20 00 	lea    rax,[rip+0x200ab9]        # 601038 <__TMC_END__>
  40057f:	48 39 f8             	cmp    rax,rdi
  400582:	48 89 e5             	mov    rbp,rsp
  400585:	74 19                	je     4005a0 <deregister_tm_clones+0x30>
  400587:	48 8b 05 4a 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a4a]        # 600fd8 <_ITM_deregisterTMCloneTable>
  40058e:	48 85 c0             	test   rax,rax
  400591:	74 0d                	je     4005a0 <deregister_tm_clones+0x30>
  400593:	5d                   	pop    rbp
  400594:	ff e0                	jmp    rax
  400596:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40059d:	00 00 00
  4005a0:	5d                   	pop    rbp
  4005a1:	c3                   	ret
  4005a2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4005a6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4005ad:	00 00 00

00000000004005b0 <register_tm_clones>:
  4005b0:	48 8d 3d 81 0a 20 00 	lea    rdi,[rip+0x200a81]        # 601038 <__TMC_END__>
  4005b7:	48 8d 35 7a 0a 20 00 	lea    rsi,[rip+0x200a7a]        # 601038 <__TMC_END__>
  4005be:	55                   	push   rbp
  4005bf:	48 29 fe             	sub    rsi,rdi
  4005c2:	48 89 e5             	mov    rbp,rsp
  4005c5:	48 c1 fe 03          	sar    rsi,0x3
  4005c9:	48 89 f0             	mov    rax,rsi
  4005cc:	48 c1 e8 3f          	shr    rax,0x3f
  4005d0:	48 01 c6             	add    rsi,rax
  4005d3:	48 d1 fe             	sar    rsi,1
  4005d6:	74 18                	je     4005f0 <register_tm_clones+0x40>
  4005d8:	48 8b 05 11 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a11]        # 600ff0 <_ITM_registerTMCloneTable>
  4005df:	48 85 c0             	test   rax,rax
  4005e2:	74 0c                	je     4005f0 <register_tm_clones+0x40>
  4005e4:	5d                   	pop    rbp
  4005e5:	ff e0                	jmp    rax
  4005e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4005ee:	00 00
  4005f0:	5d                   	pop    rbp
  4005f1:	c3                   	ret
  4005f2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4005f6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4005fd:	00 00 00

0000000000400600 <__do_global_dtors_aux>:
  400600:	80 3d 31 0a 20 00 00 	cmp    BYTE PTR [rip+0x200a31],0x0        # 601038 <__TMC_END__>
  400607:	75 2f                	jne    400638 <__do_global_dtors_aux+0x38>
  400609:	48 83 3d e7 09 20 00 	cmp    QWORD PTR [rip+0x2009e7],0x0        # 600ff8 <__cxa_finalize@GLIBC_2.2.5>
  400610:	00
  400611:	55                   	push   rbp
  400612:	48 89 e5             	mov    rbp,rsp
  400615:	74 0c                	je     400623 <__do_global_dtors_aux+0x23>
  400617:	48 8b 3d 12 0a 20 00 	mov    rdi,QWORD PTR [rip+0x200a12]        # 601030 <__dso_handle>
  40061e:	e8 0d ff ff ff       	call   400530 <__cxa_finalize@plt>
  400623:	e8 48 ff ff ff       	call   400570 <deregister_tm_clones>
  400628:	c6 05 09 0a 20 00 01 	mov    BYTE PTR [rip+0x200a09],0x1        # 601038 <__TMC_END__>
  40062f:	5d                   	pop    rbp
  400630:	c3                   	ret
  400631:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400638:	f3 c3                	repz ret
  40063a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400640 <frame_dummy>:
  400640:	55                   	push   rbp
  400641:	48 89 e5             	mov    rbp,rsp
  400644:	5d                   	pop    rbp
  400645:	e9 66 ff ff ff       	jmp    4005b0 <register_tm_clones>

000000000040064a <initI>:
  40064a:	55                   	push   rbp
  40064b:	48 89 e5             	mov    rbp,rsp
  40064e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  400652:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400656:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  40065c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  400660:	48 83 c0 04          	add    rax,0x4
  400664:	48 ba 50 68 69 6c 6f 	movabs rdx,0x706f736f6c696850
  40066b:	73 6f 70
  40066e:	48 b9 68 65 72 27 73 	movabs rcx,0x7453207327726568
  400675:	20 53 74
  400678:	48 89 10             	mov    QWORD PTR [rax],rdx
  40067b:	48 89 48 08          	mov    QWORD PTR [rax+0x8],rcx
  40067f:	c7 40 10 6f 6e 65 00 	mov    DWORD PTR [rax+0x10],0x656e6f
  400686:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  40068a:	48 83 c0 36          	add    rax,0x36
  40068e:	48 be 4a 2e 4b 2e 20 	movabs rsi,0x776f52202e4b2e4a
  400695:	52 6f 77
  400698:	48 89 30             	mov    QWORD PTR [rax],rsi
  40069b:	c7 40 08 6c 69 6e 67 	mov    DWORD PTR [rax+0x8],0x676e696c
  4006a2:	c6 40 0c 00          	mov    BYTE PTR [rax+0xc],0x0
  4006a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  4006aa:	c7 40 68 df 00 00 00 	mov    DWORD PTR [rax+0x68],0xdf
  4006b1:	90                   	nop
  4006b2:	5d                   	pop    rbp
  4006b3:	c3                   	ret

00000000004006b4 <main>:
  4006b4:	55                   	push   rbp
  4006b5:	48 89 e5             	mov    rbp,rsp
  4006b8:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4006bc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4006c3:	00 00
  4006c5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4006c9:	31 c0                	xor    eax,eax
  4006cb:	48 8d 55 80          	lea    rdx,[rbp-0x80]
  4006cf:	b8 00 00 00 00       	mov    eax,0x0
  4006d4:	b9 0d 00 00 00       	mov    ecx,0xd
  4006d9:	48 89 d7             	mov    rdi,rdx
  4006dc:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  4006df:	48 89 fa             	mov    rdx,rdi
  4006e2:	89 02                	mov    DWORD PTR [rdx],eax
  4006e4:	48 83 c2 04          	add    rdx,0x4
  4006e8:	48 8d 45 80          	lea    rax,[rbp-0x80]
  4006ec:	48 89 c7             	mov    rdi,rax
  4006ef:	e8 56 ff ff ff       	call   40064a <initI>
  4006f4:	48 8d 45 80          	lea    rax,[rbp-0x80]
  4006f8:	48 83 c0 04          	add    rax,0x4
  4006fc:	48 89 c6             	mov    rsi,rax
  4006ff:	48 8d 3d b2 00 00 00 	lea    rdi,[rip+0xb2]        # 4007b8 <_IO_stdin_used+0x8>
  400706:	b8 00 00 00 00       	mov    eax,0x0
  40070b:	e8 10 fe ff ff       	call   400520 <printf@plt>
  400710:	b8 00 00 00 00       	mov    eax,0x0
  400715:	48 8b 75 f8          	mov    rsi,QWORD PTR [rbp-0x8]
  400719:	64 48 33 34 25 28 00 	xor    rsi,QWORD PTR fs:0x28
  400720:	00 00
  400722:	74 05                	je     400729 <main+0x75>
  400724:	e8 e7 fd ff ff       	call   400510 <__stack_chk_fail@plt>
  400729:	c9                   	leave
  40072a:	c3                   	ret
  40072b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400730 <__libc_csu_init>:
  400730:	41 57                	push   r15
  400732:	41 56                	push   r14
  400734:	49 89 d7             	mov    r15,rdx
  400737:	41 55                	push   r13
  400739:	41 54                	push   r12
  40073b:	4c 8d 25 a6 06 20 00 	lea    r12,[rip+0x2006a6]        # 600de8 <__frame_dummy_init_array_entry>
  400742:	55                   	push   rbp
  400743:	48 8d 2d a6 06 20 00 	lea    rbp,[rip+0x2006a6]        # 600df0 <__init_array_end>
  40074a:	53                   	push   rbx
  40074b:	41 89 fd             	mov    r13d,edi
  40074e:	49 89 f6             	mov    r14,rsi
  400751:	4c 29 e5             	sub    rbp,r12
  400754:	48 83 ec 08          	sub    rsp,0x8
  400758:	48 c1 fd 03          	sar    rbp,0x3
  40075c:	e8 87 fd ff ff       	call   4004e8 <_init>
  400761:	48 85 ed             	test   rbp,rbp
  400764:	74 20                	je     400786 <__libc_csu_init+0x56>
  400766:	31 db                	xor    ebx,ebx
  400768:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40076f:	00
  400770:	4c 89 fa             	mov    rdx,r15
  400773:	4c 89 f6             	mov    rsi,r14
  400776:	44 89 ef             	mov    edi,r13d
  400779:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40077d:	48 83 c3 01          	add    rbx,0x1
  400781:	48 39 dd             	cmp    rbp,rbx
  400784:	75 ea                	jne    400770 <__libc_csu_init+0x40>
  400786:	48 83 c4 08          	add    rsp,0x8
  40078a:	5b                   	pop    rbx
  40078b:	5d                   	pop    rbp
  40078c:	41 5c                	pop    r12
  40078e:	41 5d                	pop    r13
  400790:	41 5e                	pop    r14
  400792:	41 5f                	pop    r15
  400794:	c3                   	ret
  400795:	90                   	nop
  400796:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40079d:	00 00 00

00000000004007a0 <__libc_csu_fini>:
  4007a0:	f3 c3                	repz ret

Disassembly of section .fini:

00000000004007a4 <_fini>:
  4007a4:	48 83 ec 08          	sub    rsp,0x8
  4007a8:	48 83 c4 08          	add    rsp,0x8
  4007ac:	c3                   	ret
