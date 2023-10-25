
_schdtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif

int
main(int argc, char *argv[])
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
    test_case_1();
       6:	e8 e5 01 00 00       	call   1f0 <test_case_1>
    test_case_2();
       b:	e8 40 03 00 00       	call   350 <test_case_2>
    test_case_3();
      10:	e8 bb 04 00 00       	call   4d0 <test_case_3>
    test_case_4();
      15:	e8 26 07 00 00       	call   740 <test_case_4>
    test_case_5();
      1a:	e8 91 08 00 00       	call   8b0 <test_case_5>
    //test_case_6();
    
    exit(); // main process terminates
      1f:	e8 2f 0c 00 00       	call   c53 <exit>
      24:	66 90                	xchg   %ax,%ax
      26:	66 90                	xchg   %ax,%ax
      28:	66 90                	xchg   %ax,%ax
      2a:	66 90                	xchg   %ax,%ax
      2c:	66 90                	xchg   %ax,%ax
      2e:	66 90                	xchg   %ax,%ax

00000030 <do_child>:
    unsigned int tmp = 0;
      30:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
      32:	31 c0                	xor    %eax,%eax
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        tmp += cnt;
      38:	01 c2                	add    %eax,%edx
        cnt ++;
      3a:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
      3d:	3d 00 00 00 10       	cmp    $0x10000000,%eax
      42:	75 f4                	jne    38 <do_child+0x8>
    avoid_optm = tmp;
      44:	89 15 d4 18 00 00    	mov    %edx,0x18d4
}
      4a:	c3                   	ret
      4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      4f:	90                   	nop

00000050 <do_parent>:
void do_parent(void)
      50:	31 d2                	xor    %edx,%edx
      52:	31 c0                	xor    %eax,%eax
      54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      58:	01 c2                	add    %eax,%edx
      5a:	83 c0 01             	add    $0x1,%eax
      5d:	3d 00 00 00 10       	cmp    $0x10000000,%eax
      62:	75 f4                	jne    58 <do_parent+0x8>
      64:	89 15 d4 18 00 00    	mov    %edx,0x18d4
      6a:	c3                   	ret
      6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      6f:	90                   	nop

00000070 <do_parent_partial>:
    unsigned int tmp = 0;
      70:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
      72:	31 c0                	xor    %eax,%eax
      74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        tmp += cnt;
      78:	01 c2                	add    %eax,%edx
        cnt ++;
      7a:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT/2)
      7d:	3d 00 00 00 08       	cmp    $0x8000000,%eax
      82:	75 f4                	jne    78 <do_parent_partial+0x8>
    avoid_optm = tmp;
      84:	89 15 d4 18 00 00    	mov    %edx,0x18d4
}
      8a:	c3                   	ret
      8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      8f:	90                   	nop

00000090 <create_child_process>:
{
      90:	55                   	push   %ebp
      91:	89 e5                	mov    %esp,%ebp
      93:	56                   	push   %esi
      94:	53                   	push   %ebx
      95:	8b 45 08             	mov    0x8(%ebp),%eax
    int child_cnt = cnt > MAX_CHILD_COUNT ? MAX_CHILD_COUNT : cnt;
      98:	bb 06 00 00 00       	mov    $0x6,%ebx
      9d:	39 d8                	cmp    %ebx,%eax
      9f:	0f 4e d8             	cmovle %eax,%ebx
    for (i = 0; i < child_cnt; i++)
      a2:	85 c0                	test   %eax,%eax
      a4:	7e 23                	jle    c9 <create_child_process+0x39>
      a6:	31 f6                	xor    %esi,%esi
      a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      af:	90                   	nop
        child[i].pid = fork();
      b0:	e8 96 0b 00 00       	call   c4b <fork>
      b5:	89 04 b5 d8 18 00 00 	mov    %eax,0x18d8(,%esi,4)
        if (child[i].pid < 0)
      bc:	85 c0                	test   %eax,%eax
      be:	78 10                	js     d0 <create_child_process+0x40>
        else if (child[i].pid == 0) // child
      c0:	74 22                	je     e4 <create_child_process+0x54>
    for (i = 0; i < child_cnt; i++)
      c2:	83 c6 01             	add    $0x1,%esi
      c5:	39 f3                	cmp    %esi,%ebx
      c7:	7f e7                	jg     b0 <create_child_process+0x20>
}
      c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
      cc:	5b                   	pop    %ebx
      cd:	5e                   	pop    %esi
      ce:	5d                   	pop    %ebp
      cf:	c3                   	ret
            printf(1, "fork() failed!\n");
      d0:	83 ec 08             	sub    $0x8,%esp
      d3:	68 f8 10 00 00       	push   $0x10f8
      d8:	6a 01                	push   $0x1
      da:	e8 f1 0c 00 00       	call   dd0 <printf>
            exit();
      df:	e8 6f 0b 00 00       	call   c53 <exit>
    unsigned int tmp = 0;
      e4:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
      e6:	31 c0                	xor    %eax,%eax
      e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      ef:	90                   	nop
        tmp += cnt;
      f0:	01 c2                	add    %eax,%edx
        cnt ++;
      f2:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
      f5:	3d 00 00 00 10       	cmp    $0x10000000,%eax
      fa:	75 f4                	jne    f0 <create_child_process+0x60>
    avoid_optm = tmp;
      fc:	89 15 d4 18 00 00    	mov    %edx,0x18d4
            exit();
     102:	e8 4c 0b 00 00       	call   c53 <exit>
     107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     10e:	66 90                	xchg   %ax,%ax

00000110 <print_proc_tickets>:
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	57                   	push   %edi
     114:	56                   	push   %esi
    int child_cnt = cnt > MAX_CHILD_COUNT ? MAX_CHILD_COUNT : cnt;
     115:	be 06 00 00 00       	mov    $0x6,%esi
{
     11a:	53                   	push   %ebx
     11b:	83 ec 0c             	sub    $0xc,%esp
     11e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int child_cnt = cnt > MAX_CHILD_COUNT ? MAX_CHILD_COUNT : cnt;
     121:	39 f3                	cmp    %esi,%ebx
     123:	0f 4e f3             	cmovle %ebx,%esi
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     126:	e8 a8 0b 00 00       	call   cd3 <getpid>
     12b:	83 ec 0c             	sub    $0xc,%esp
     12e:	50                   	push   %eax
     12f:	e8 df 0b 00 00       	call   d13 <tickets_owned>
     134:	89 c7                	mov    %eax,%edi
     136:	e8 98 0b 00 00       	call   cd3 <getpid>
     13b:	57                   	push   %edi
     13c:	50                   	push   %eax
     13d:	68 28 11 00 00       	push   $0x1128
     142:	6a 01                	push   $0x1
     144:	e8 87 0c 00 00       	call   dd0 <printf>
    for (i = 0; i < child_cnt; i++)
     149:	83 c4 20             	add    $0x20,%esp
     14c:	85 db                	test   %ebx,%ebx
     14e:	7e 35                	jle    185 <print_proc_tickets+0x75>
     150:	31 db                	xor    %ebx,%ebx
     152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     158:	83 ec 0c             	sub    $0xc,%esp
     15b:	ff 34 9d d8 18 00 00 	push   0x18d8(,%ebx,4)
     162:	e8 ac 0b 00 00       	call   d13 <tickets_owned>
     167:	50                   	push   %eax
     168:	ff 34 9d d8 18 00 00 	push   0x18d8(,%ebx,4)
    for (i = 0; i < child_cnt; i++)
     16f:	83 c3 01             	add    $0x1,%ebx
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     172:	68 4c 11 00 00       	push   $0x114c
     177:	6a 01                	push   $0x1
     179:	e8 52 0c 00 00       	call   dd0 <printf>
    for (i = 0; i < child_cnt; i++)
     17e:	83 c4 20             	add    $0x20,%esp
     181:	39 de                	cmp    %ebx,%esi
     183:	7f d3                	jg     158 <print_proc_tickets+0x48>
}
     185:	8d 65 f4             	lea    -0xc(%ebp),%esp
     188:	5b                   	pop    %ebx
     189:	5e                   	pop    %esi
     18a:	5f                   	pop    %edi
     18b:	5d                   	pop    %ebp
     18c:	c3                   	ret
     18d:	8d 76 00             	lea    0x0(%esi),%esi

00000190 <wait_on_child_processes>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	56                   	push   %esi
    int child_cnt = cnt > MAX_CHILD_COUNT ? MAX_CHILD_COUNT : cnt;
     194:	be 06 00 00 00       	mov    $0x6,%esi
{
     199:	53                   	push   %ebx
     19a:	8b 45 08             	mov    0x8(%ebp),%eax
    int child_cnt = cnt > MAX_CHILD_COUNT ? MAX_CHILD_COUNT : cnt;
     19d:	39 f0                	cmp    %esi,%eax
     19f:	0f 4e f0             	cmovle %eax,%esi
    for (i = 0; i < child_cnt; i++)
     1a2:	85 c0                	test   %eax,%eax
     1a4:	7e 34                	jle    1da <wait_on_child_processes+0x4a>
     1a6:	31 db                	xor    %ebx,%ebx
     1a8:	eb 0d                	jmp    1b7 <wait_on_child_processes+0x27>
     1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1b0:	83 c3 01             	add    $0x1,%ebx
     1b3:	39 de                	cmp    %ebx,%esi
     1b5:	7e 23                	jle    1da <wait_on_child_processes+0x4a>
       if (wait() < 0)
     1b7:	e8 9f 0a 00 00       	call   c5b <wait>
     1bc:	85 c0                	test   %eax,%eax
     1be:	79 f0                	jns    1b0 <wait_on_child_processes+0x20>
            printf(1, "\nwait() on child-%d failed!\n", i);
     1c0:	83 ec 04             	sub    $0x4,%esp
     1c3:	53                   	push   %ebx
    for (i = 0; i < child_cnt; i++)
     1c4:	83 c3 01             	add    $0x1,%ebx
            printf(1, "\nwait() on child-%d failed!\n", i);
     1c7:	68 08 11 00 00       	push   $0x1108
     1cc:	6a 01                	push   $0x1
     1ce:	e8 fd 0b 00 00       	call   dd0 <printf>
     1d3:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < child_cnt; i++)
     1d6:	39 de                	cmp    %ebx,%esi
     1d8:	7f dd                	jg     1b7 <wait_on_child_processes+0x27>
}
     1da:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1dd:	5b                   	pop    %ebx
     1de:	5e                   	pop    %esi
     1df:	5d                   	pop    %ebp
     1e0:	c3                   	ret
     1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ef:	90                   	nop

000001f0 <test_case_1>:
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	53                   	push   %ebx
    for (i = 0; i < child_cnt; i++)
     1f4:	31 db                	xor    %ebx,%ebx
{
     1f6:	83 ec 08             	sub    $0x8,%esp
    printf(1, "===== Test case 1: default (RR) scheduler, %d child processes =====\n", child_cnt);
     1f9:	6a 03                	push   $0x3
     1fb:	68 6c 11 00 00       	push   $0x116c
     200:	6a 01                	push   $0x1
     202:	e8 c9 0b 00 00       	call   dd0 <printf>
    set_sched(scheduler);
     207:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     20e:	e8 f8 0a 00 00       	call   d0b <set_sched>
     213:	83 c4 10             	add    $0x10,%esp
     216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     21d:	8d 76 00             	lea    0x0(%esi),%esi
        child[i].pid = fork();
     220:	e8 26 0a 00 00       	call   c4b <fork>
     225:	89 04 9d d8 18 00 00 	mov    %eax,0x18d8(,%ebx,4)
        if (child[i].pid < 0)
     22c:	85 c0                	test   %eax,%eax
     22e:	0f 88 e8 00 00 00    	js     31c <test_case_1+0x12c>
        else if (child[i].pid == 0) // child
     234:	0f 84 f6 00 00 00    	je     330 <test_case_1+0x140>
    for (i = 0; i < child_cnt; i++)
     23a:	83 c3 01             	add    $0x1,%ebx
     23d:	83 fb 03             	cmp    $0x3,%ebx
     240:	75 de                	jne    220 <test_case_1+0x30>
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     242:	e8 8c 0a 00 00       	call   cd3 <getpid>
     247:	83 ec 0c             	sub    $0xc,%esp
     24a:	50                   	push   %eax
     24b:	e8 c3 0a 00 00       	call   d13 <tickets_owned>
     250:	89 c3                	mov    %eax,%ebx
     252:	e8 7c 0a 00 00       	call   cd3 <getpid>
     257:	53                   	push   %ebx
    for (i = 0; i < child_cnt; i++)
     258:	31 db                	xor    %ebx,%ebx
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     25a:	50                   	push   %eax
     25b:	68 28 11 00 00       	push   $0x1128
     260:	6a 01                	push   $0x1
     262:	e8 69 0b 00 00       	call   dd0 <printf>
     267:	83 c4 20             	add    $0x20,%esp
     26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     270:	83 ec 0c             	sub    $0xc,%esp
     273:	ff 34 9d d8 18 00 00 	push   0x18d8(,%ebx,4)
     27a:	e8 94 0a 00 00       	call   d13 <tickets_owned>
     27f:	50                   	push   %eax
     280:	ff 34 9d d8 18 00 00 	push   0x18d8(,%ebx,4)
    for (i = 0; i < child_cnt; i++)
     287:	83 c3 01             	add    $0x1,%ebx
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     28a:	68 4c 11 00 00       	push   $0x114c
     28f:	6a 01                	push   $0x1
     291:	e8 3a 0b 00 00       	call   dd0 <printf>
    for (i = 0; i < child_cnt; i++)
     296:	83 c4 20             	add    $0x20,%esp
     299:	83 fb 03             	cmp    $0x3,%ebx
     29c:	75 d2                	jne    270 <test_case_1+0x80>
    enable_sched_trace(1);
     29e:	83 ec 0c             	sub    $0xc,%esp
     2a1:	6a 01                	push   $0x1
     2a3:	e8 5b 0a 00 00       	call   d03 <enable_sched_trace>
     2a8:	83 c4 10             	add    $0x10,%esp
    unsigned int tmp = 0;
     2ab:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     2ad:	31 c0                	xor    %eax,%eax
     2af:	90                   	nop
        tmp += cnt;
     2b0:	01 c2                	add    %eax,%edx
        cnt ++;
     2b2:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     2b5:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     2ba:	75 f4                	jne    2b0 <test_case_1+0xc0>
    avoid_optm = tmp;
     2bc:	89 15 d4 18 00 00    	mov    %edx,0x18d4
    for (i = 0; i < child_cnt; i++)
     2c2:	31 db                	xor    %ebx,%ebx
     2c4:	eb 12                	jmp    2d8 <test_case_1+0xe8>
     2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     2cd:	8d 76 00             	lea    0x0(%esi),%esi
     2d0:	83 c3 01             	add    $0x1,%ebx
     2d3:	83 fb 03             	cmp    $0x3,%ebx
     2d6:	74 24                	je     2fc <test_case_1+0x10c>
       if (wait() < 0)
     2d8:	e8 7e 09 00 00       	call   c5b <wait>
     2dd:	85 c0                	test   %eax,%eax
     2df:	79 ef                	jns    2d0 <test_case_1+0xe0>
            printf(1, "\nwait() on child-%d failed!\n", i);
     2e1:	83 ec 04             	sub    $0x4,%esp
     2e4:	53                   	push   %ebx
    for (i = 0; i < child_cnt; i++)
     2e5:	83 c3 01             	add    $0x1,%ebx
            printf(1, "\nwait() on child-%d failed!\n", i);
     2e8:	68 08 11 00 00       	push   $0x1108
     2ed:	6a 01                	push   $0x1
     2ef:	e8 dc 0a 00 00       	call   dd0 <printf>
     2f4:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < child_cnt; i++)
     2f7:	83 fb 03             	cmp    $0x3,%ebx
     2fa:	75 dc                	jne    2d8 <test_case_1+0xe8>
    enable_sched_trace(0);
     2fc:	83 ec 0c             	sub    $0xc,%esp
     2ff:	6a 00                	push   $0x0
     301:	e8 fd 09 00 00       	call   d03 <enable_sched_trace>
    printf(1, "\n\n");      
     306:	58                   	pop    %eax
     307:	5a                   	pop    %edx
     308:	68 25 11 00 00       	push   $0x1125
     30d:	6a 01                	push   $0x1
     30f:	e8 bc 0a 00 00       	call   dd0 <printf>
}
     314:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     317:	83 c4 10             	add    $0x10,%esp
     31a:	c9                   	leave
     31b:	c3                   	ret
            printf(1, "fork() failed!\n");
     31c:	83 ec 08             	sub    $0x8,%esp
     31f:	68 f8 10 00 00       	push   $0x10f8
     324:	6a 01                	push   $0x1
     326:	e8 a5 0a 00 00       	call   dd0 <printf>
            exit();
     32b:	e8 23 09 00 00       	call   c53 <exit>
    unsigned int tmp = 0;
     330:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     332:	31 c0                	xor    %eax,%eax
     334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        tmp += cnt;
     338:	01 c2                	add    %eax,%edx
        cnt ++;
     33a:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     33d:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     342:	75 f4                	jne    338 <test_case_1+0x148>
    avoid_optm = tmp;
     344:	89 15 d4 18 00 00    	mov    %edx,0x18d4
            exit();
     34a:	e8 04 09 00 00       	call   c53 <exit>
     34f:	90                   	nop

00000350 <test_case_2>:
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "===== Test case 2: stride scheduler, %d child processes, no ticket trasfer =====\n");
     357:	68 b4 11 00 00       	push   $0x11b4
     35c:	6a 01                	push   $0x1
     35e:	e8 6d 0a 00 00       	call   dd0 <printf>
    set_sched(scheduler);
     363:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     36a:	e8 9c 09 00 00       	call   d0b <set_sched>
        child[i].pid = fork();
     36f:	e8 d7 08 00 00       	call   c4b <fork>
        if (child[i].pid < 0)
     374:	83 c4 10             	add    $0x10,%esp
        child[i].pid = fork();
     377:	a3 d8 18 00 00       	mov    %eax,0x18d8
        if (child[i].pid < 0)
     37c:	85 c0                	test   %eax,%eax
     37e:	0f 88 13 01 00 00    	js     497 <test_case_2+0x147>
        else if (child[i].pid == 0) // child
     384:	0f 84 21 01 00 00    	je     4ab <test_case_2+0x15b>
        child[i].pid = fork();
     38a:	e8 bc 08 00 00       	call   c4b <fork>
     38f:	a3 dc 18 00 00       	mov    %eax,0x18dc
        if (child[i].pid < 0)
     394:	85 c0                	test   %eax,%eax
     396:	0f 88 fb 00 00 00    	js     497 <test_case_2+0x147>
        else if (child[i].pid == 0) // child
     39c:	0f 84 09 01 00 00    	je     4ab <test_case_2+0x15b>
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     3a2:	e8 2c 09 00 00       	call   cd3 <getpid>
     3a7:	83 ec 0c             	sub    $0xc,%esp
     3aa:	50                   	push   %eax
     3ab:	e8 63 09 00 00       	call   d13 <tickets_owned>
     3b0:	89 c3                	mov    %eax,%ebx
     3b2:	e8 1c 09 00 00       	call   cd3 <getpid>
     3b7:	53                   	push   %ebx
     3b8:	50                   	push   %eax
     3b9:	68 28 11 00 00       	push   $0x1128
     3be:	6a 01                	push   $0x1
     3c0:	e8 0b 0a 00 00       	call   dd0 <printf>
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     3c5:	83 c4 14             	add    $0x14,%esp
     3c8:	ff 35 d8 18 00 00    	push   0x18d8
     3ce:	e8 40 09 00 00       	call   d13 <tickets_owned>
     3d3:	50                   	push   %eax
     3d4:	ff 35 d8 18 00 00    	push   0x18d8
     3da:	68 4c 11 00 00       	push   $0x114c
     3df:	6a 01                	push   $0x1
     3e1:	e8 ea 09 00 00       	call   dd0 <printf>
     3e6:	83 c4 14             	add    $0x14,%esp
     3e9:	ff 35 dc 18 00 00    	push   0x18dc
     3ef:	e8 1f 09 00 00       	call   d13 <tickets_owned>
     3f4:	50                   	push   %eax
     3f5:	ff 35 dc 18 00 00    	push   0x18dc
     3fb:	68 4c 11 00 00       	push   $0x114c
     400:	6a 01                	push   $0x1
     402:	e8 c9 09 00 00       	call   dd0 <printf>
    enable_sched_trace(1);
     407:	83 c4 14             	add    $0x14,%esp
     40a:	6a 01                	push   $0x1
     40c:	e8 f2 08 00 00       	call   d03 <enable_sched_trace>
     411:	83 c4 10             	add    $0x10,%esp
    unsigned int tmp = 0;
     414:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     416:	31 c0                	xor    %eax,%eax
     418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     41f:	90                   	nop
        tmp += cnt;
     420:	01 c2                	add    %eax,%edx
        cnt ++;
     422:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     425:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     42a:	75 f4                	jne    420 <test_case_2+0xd0>
    avoid_optm = tmp;
     42c:	89 15 d4 18 00 00    	mov    %edx,0x18d4
       if (wait() < 0)
     432:	e8 24 08 00 00       	call   c5b <wait>
     437:	85 c0                	test   %eax,%eax
     439:	78 29                	js     464 <test_case_2+0x114>
     43b:	e8 1b 08 00 00       	call   c5b <wait>
     440:	85 c0                	test   %eax,%eax
     442:	78 3d                	js     481 <test_case_2+0x131>
    enable_sched_trace(0);
     444:	83 ec 0c             	sub    $0xc,%esp
     447:	6a 00                	push   $0x0
     449:	e8 b5 08 00 00       	call   d03 <enable_sched_trace>
    printf(1, "\n\n");
     44e:	58                   	pop    %eax
     44f:	5a                   	pop    %edx
     450:	68 25 11 00 00       	push   $0x1125
     455:	6a 01                	push   $0x1
     457:	e8 74 09 00 00       	call   dd0 <printf>
}
     45c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     45f:	83 c4 10             	add    $0x10,%esp
     462:	c9                   	leave
     463:	c3                   	ret
            printf(1, "\nwait() on child-%d failed!\n", i);
     464:	83 ec 04             	sub    $0x4,%esp
     467:	6a 00                	push   $0x0
     469:	68 08 11 00 00       	push   $0x1108
     46e:	6a 01                	push   $0x1
     470:	e8 5b 09 00 00       	call   dd0 <printf>
     475:	83 c4 10             	add    $0x10,%esp
       if (wait() < 0)
     478:	e8 de 07 00 00       	call   c5b <wait>
     47d:	85 c0                	test   %eax,%eax
     47f:	79 c3                	jns    444 <test_case_2+0xf4>
            printf(1, "\nwait() on child-%d failed!\n", i);
     481:	83 ec 04             	sub    $0x4,%esp
     484:	6a 01                	push   $0x1
     486:	68 08 11 00 00       	push   $0x1108
     48b:	6a 01                	push   $0x1
     48d:	e8 3e 09 00 00       	call   dd0 <printf>
     492:	83 c4 10             	add    $0x10,%esp
     495:	eb ad                	jmp    444 <test_case_2+0xf4>
            printf(1, "fork() failed!\n");
     497:	83 ec 08             	sub    $0x8,%esp
     49a:	68 f8 10 00 00       	push   $0x10f8
     49f:	6a 01                	push   $0x1
     4a1:	e8 2a 09 00 00       	call   dd0 <printf>
            exit();
     4a6:	e8 a8 07 00 00       	call   c53 <exit>
    unsigned int tmp = 0;
     4ab:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     4ad:	31 c0                	xor    %eax,%eax
     4af:	90                   	nop
        tmp += cnt;
     4b0:	01 c2                	add    %eax,%edx
        cnt ++;
     4b2:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     4b5:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     4ba:	75 f4                	jne    4b0 <test_case_2+0x160>
    avoid_optm = tmp;
     4bc:	89 15 d4 18 00 00    	mov    %edx,0x18d4
            exit();
     4c2:	e8 8c 07 00 00       	call   c53 <exit>
     4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4ce:	66 90                	xchg   %ax,%ax

000004d0 <test_case_3>:
{
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	57                   	push   %edi
     4d4:	56                   	push   %esi
     4d5:	53                   	push   %ebx
     4d6:	83 ec 14             	sub    $0x14,%esp
    printf(1, "===== Test case 3: stride scheduler, testing return values of transfer_tickets() ... \n");
     4d9:	68 08 12 00 00       	push   $0x1208
     4de:	6a 01                	push   $0x1
     4e0:	e8 eb 08 00 00       	call   dd0 <printf>
    set_sched(scheduler);
     4e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4ec:	e8 1a 08 00 00       	call   d0b <set_sched>
        child[i].pid = fork();
     4f1:	e8 55 07 00 00       	call   c4b <fork>
        if (child[i].pid < 0)
     4f6:	83 c4 10             	add    $0x10,%esp
        child[i].pid = fork();
     4f9:	a3 d8 18 00 00       	mov    %eax,0x18d8
        if (child[i].pid < 0)
     4fe:	85 c0                	test   %eax,%eax
     500:	0f 88 fd 01 00 00    	js     703 <test_case_3+0x233>
        else if (child[i].pid == 0) // child
     506:	0f 84 0b 02 00 00    	je     717 <test_case_3+0x247>
    printf(1, "parent (pid: %d) tranferred %d tickets to child (pid: %d), transfer_tickets() returned %d. \n", 
     50c:	83 ec 08             	sub    $0x8,%esp
     50f:	6a 14                	push   $0x14
     511:	50                   	push   %eax
     512:	e8 04 08 00 00       	call   d1b <transfer_tickets>
     517:	8b 35 d8 18 00 00    	mov    0x18d8,%esi
     51d:	89 c3                	mov    %eax,%ebx
     51f:	e8 af 07 00 00       	call   cd3 <getpid>
     524:	5a                   	pop    %edx
     525:	59                   	pop    %ecx
     526:	53                   	push   %ebx
     527:	56                   	push   %esi
     528:	6a 14                	push   $0x14
     52a:	50                   	push   %eax
     52b:	68 60 12 00 00       	push   $0x1260
     530:	6a 01                	push   $0x1
     532:	e8 99 08 00 00       	call   dd0 <printf>
    printf(1, "parent (pid: %d) now has %d tickets.\n", getpid(), tickets_owned(getpid()));
     537:	83 c4 20             	add    $0x20,%esp
     53a:	e8 94 07 00 00       	call   cd3 <getpid>
     53f:	83 ec 0c             	sub    $0xc,%esp
     542:	50                   	push   %eax
     543:	e8 cb 07 00 00       	call   d13 <tickets_owned>
     548:	89 c3                	mov    %eax,%ebx
     54a:	e8 84 07 00 00       	call   cd3 <getpid>
     54f:	53                   	push   %ebx
     550:	50                   	push   %eax
     551:	68 c0 12 00 00       	push   $0x12c0
     556:	6a 01                	push   $0x1
     558:	e8 73 08 00 00       	call   dd0 <printf>
    printf(1, "parent (pid: %d) tranferred %d tickets to child (pid: %d), transfer_tickets() returned %d. \n", 
     55d:	83 c4 18             	add    $0x18,%esp
     560:	6a fe                	push   $0xfffffffe
     562:	ff 35 d8 18 00 00    	push   0x18d8
     568:	e8 ae 07 00 00       	call   d1b <transfer_tickets>
     56d:	8b 35 d8 18 00 00    	mov    0x18d8,%esi
     573:	89 c3                	mov    %eax,%ebx
     575:	e8 59 07 00 00       	call   cd3 <getpid>
     57a:	5f                   	pop    %edi
     57b:	5a                   	pop    %edx
     57c:	53                   	push   %ebx
     57d:	56                   	push   %esi
     57e:	6a fe                	push   $0xfffffffe
     580:	50                   	push   %eax
     581:	68 60 12 00 00       	push   $0x1260
     586:	6a 01                	push   $0x1
     588:	e8 43 08 00 00       	call   dd0 <printf>
    printf(1, "parent (pid: %d) now has %d tickets.\n", getpid(), tickets_owned(getpid()));
     58d:	83 c4 20             	add    $0x20,%esp
     590:	e8 3e 07 00 00       	call   cd3 <getpid>
     595:	83 ec 0c             	sub    $0xc,%esp
     598:	50                   	push   %eax
     599:	e8 75 07 00 00       	call   d13 <tickets_owned>
     59e:	89 c3                	mov    %eax,%ebx
     5a0:	e8 2e 07 00 00       	call   cd3 <getpid>
     5a5:	53                   	push   %ebx
     5a6:	50                   	push   %eax
     5a7:	68 c0 12 00 00       	push   $0x12c0
     5ac:	6a 01                	push   $0x1
     5ae:	e8 1d 08 00 00       	call   dd0 <printf>
    tickets_transferred = tickets_owned(getpid());
     5b3:	83 c4 20             	add    $0x20,%esp
     5b6:	e8 18 07 00 00       	call   cd3 <getpid>
     5bb:	83 ec 0c             	sub    $0xc,%esp
     5be:	50                   	push   %eax
     5bf:	e8 4f 07 00 00       	call   d13 <tickets_owned>
    printf(1, "parent (pid: %d) tranferred %d tickets to child (pid: %d), transfer_tickets() returned %d. \n", 
     5c4:	59                   	pop    %ecx
     5c5:	5e                   	pop    %esi
     5c6:	50                   	push   %eax
    tickets_transferred = tickets_owned(getpid());
     5c7:	89 c3                	mov    %eax,%ebx
    printf(1, "parent (pid: %d) tranferred %d tickets to child (pid: %d), transfer_tickets() returned %d. \n", 
     5c9:	ff 35 d8 18 00 00    	push   0x18d8
     5cf:	e8 47 07 00 00       	call   d1b <transfer_tickets>
     5d4:	8b 3d d8 18 00 00    	mov    0x18d8,%edi
     5da:	89 c6                	mov    %eax,%esi
     5dc:	e8 f2 06 00 00       	call   cd3 <getpid>
     5e1:	5a                   	pop    %edx
     5e2:	59                   	pop    %ecx
     5e3:	56                   	push   %esi
     5e4:	57                   	push   %edi
     5e5:	53                   	push   %ebx
     5e6:	50                   	push   %eax
     5e7:	68 60 12 00 00       	push   $0x1260
     5ec:	6a 01                	push   $0x1
     5ee:	e8 dd 07 00 00       	call   dd0 <printf>
    printf(1, "parent (pid: %d) now has %d tickets.\n", getpid(), tickets_owned(getpid()));
     5f3:	83 c4 20             	add    $0x20,%esp
     5f6:	e8 d8 06 00 00       	call   cd3 <getpid>
     5fb:	83 ec 0c             	sub    $0xc,%esp
     5fe:	50                   	push   %eax
     5ff:	e8 0f 07 00 00       	call   d13 <tickets_owned>
     604:	89 c3                	mov    %eax,%ebx
     606:	e8 c8 06 00 00       	call   cd3 <getpid>
     60b:	53                   	push   %ebx
     60c:	50                   	push   %eax
     60d:	68 c0 12 00 00       	push   $0x12c0
     612:	6a 01                	push   $0x1
     614:	e8 b7 07 00 00       	call   dd0 <printf>
    printf(1, "parent (pid: %d) tranferred %d tickets to child (pid: 9999), transfer_tickets() returned %d. \n", 
     619:	83 c4 18             	add    $0x18,%esp
     61c:	6a 14                	push   $0x14
     61e:	68 0f 27 00 00       	push   $0x270f
     623:	e8 f3 06 00 00       	call   d1b <transfer_tickets>
     628:	89 c3                	mov    %eax,%ebx
     62a:	e8 a4 06 00 00       	call   cd3 <getpid>
     62f:	89 1c 24             	mov    %ebx,(%esp)
     632:	6a 14                	push   $0x14
     634:	50                   	push   %eax
     635:	68 e8 12 00 00       	push   $0x12e8
     63a:	6a 01                	push   $0x1
     63c:	e8 8f 07 00 00       	call   dd0 <printf>
    printf(1, "parent (pid: %d) now has %d tickets.\n", getpid(), tickets_owned(getpid()));
     641:	83 c4 20             	add    $0x20,%esp
     644:	e8 8a 06 00 00       	call   cd3 <getpid>
     649:	83 ec 0c             	sub    $0xc,%esp
     64c:	50                   	push   %eax
     64d:	e8 c1 06 00 00       	call   d13 <tickets_owned>
     652:	89 c3                	mov    %eax,%ebx
     654:	e8 7a 06 00 00       	call   cd3 <getpid>
     659:	53                   	push   %ebx
     65a:	50                   	push   %eax
     65b:	68 c0 12 00 00       	push   $0x12c0
     660:	6a 01                	push   $0x1
     662:	e8 69 07 00 00       	call   dd0 <printf>
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     667:	83 c4 20             	add    $0x20,%esp
     66a:	e8 64 06 00 00       	call   cd3 <getpid>
     66f:	83 ec 0c             	sub    $0xc,%esp
     672:	50                   	push   %eax
     673:	e8 9b 06 00 00       	call   d13 <tickets_owned>
     678:	89 c3                	mov    %eax,%ebx
     67a:	e8 54 06 00 00       	call   cd3 <getpid>
     67f:	53                   	push   %ebx
     680:	50                   	push   %eax
     681:	68 28 11 00 00       	push   $0x1128
     686:	6a 01                	push   $0x1
     688:	e8 43 07 00 00       	call   dd0 <printf>
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     68d:	83 c4 14             	add    $0x14,%esp
     690:	ff 35 d8 18 00 00    	push   0x18d8
     696:	e8 78 06 00 00       	call   d13 <tickets_owned>
     69b:	50                   	push   %eax
     69c:	ff 35 d8 18 00 00    	push   0x18d8
     6a2:	68 4c 11 00 00       	push   $0x114c
     6a7:	6a 01                	push   $0x1
     6a9:	e8 22 07 00 00       	call   dd0 <printf>
     6ae:	83 c4 20             	add    $0x20,%esp
    unsigned int tmp = 0;
     6b1:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     6b3:	31 c0                	xor    %eax,%eax
     6b5:	8d 76 00             	lea    0x0(%esi),%esi
        tmp += cnt;
     6b8:	01 c2                	add    %eax,%edx
        cnt ++;
     6ba:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     6bd:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     6c2:	75 f4                	jne    6b8 <test_case_3+0x1e8>
    avoid_optm = tmp;
     6c4:	89 15 d4 18 00 00    	mov    %edx,0x18d4
       if (wait() < 0)
     6ca:	e8 8c 05 00 00       	call   c5b <wait>
     6cf:	85 c0                	test   %eax,%eax
     6d1:	78 1a                	js     6ed <test_case_3+0x21d>
    printf(1, "\n\n");     
     6d3:	83 ec 08             	sub    $0x8,%esp
     6d6:	68 25 11 00 00       	push   $0x1125
     6db:	6a 01                	push   $0x1
     6dd:	e8 ee 06 00 00       	call   dd0 <printf>
}
     6e2:	83 c4 10             	add    $0x10,%esp
     6e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6e8:	5b                   	pop    %ebx
     6e9:	5e                   	pop    %esi
     6ea:	5f                   	pop    %edi
     6eb:	5d                   	pop    %ebp
     6ec:	c3                   	ret
            printf(1, "\nwait() on child-%d failed!\n", i);
     6ed:	83 ec 04             	sub    $0x4,%esp
     6f0:	6a 00                	push   $0x0
     6f2:	68 08 11 00 00       	push   $0x1108
     6f7:	6a 01                	push   $0x1
     6f9:	e8 d2 06 00 00       	call   dd0 <printf>
     6fe:	83 c4 10             	add    $0x10,%esp
     701:	eb d0                	jmp    6d3 <test_case_3+0x203>
            printf(1, "fork() failed!\n");
     703:	83 ec 08             	sub    $0x8,%esp
     706:	68 f8 10 00 00       	push   $0x10f8
     70b:	6a 01                	push   $0x1
     70d:	e8 be 06 00 00       	call   dd0 <printf>
            exit();
     712:	e8 3c 05 00 00       	call   c53 <exit>
    unsigned int tmp = 0;
     717:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     719:	31 c0                	xor    %eax,%eax
     71b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     71f:	90                   	nop
        tmp += cnt;
     720:	01 c2                	add    %eax,%edx
        cnt ++;
     722:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     725:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     72a:	75 f4                	jne    720 <test_case_3+0x250>
    avoid_optm = tmp;
     72c:	89 15 d4 18 00 00    	mov    %edx,0x18d4
            exit();
     732:	e8 1c 05 00 00       	call   c53 <exit>
     737:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     73e:	66 90                	xchg   %ax,%ax

00000740 <test_case_4>:
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	56                   	push   %esi
     744:	53                   	push   %ebx
    printf(1, "===== Test case 4: stride scheduler, %d child, with ticket trasfer at the beginning ... =====\n", child_cnt);
     745:	83 ec 04             	sub    $0x4,%esp
     748:	6a 01                	push   $0x1
     74a:	68 48 13 00 00       	push   $0x1348
     74f:	6a 01                	push   $0x1
     751:	e8 7a 06 00 00       	call   dd0 <printf>
    set_sched(scheduler);
     756:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     75d:	e8 a9 05 00 00       	call   d0b <set_sched>
        child[i].pid = fork();
     762:	e8 e4 04 00 00       	call   c4b <fork>
        if (child[i].pid < 0)
     767:	83 c4 10             	add    $0x10,%esp
        child[i].pid = fork();
     76a:	a3 d8 18 00 00       	mov    %eax,0x18d8
        if (child[i].pid < 0)
     76f:	85 c0                	test   %eax,%eax
     771:	0f 88 fc 00 00 00    	js     873 <test_case_4+0x133>
        else if (child[i].pid == 0) // child
     777:	0f 84 0a 01 00 00    	je     887 <test_case_4+0x147>
    tickets_transferred = tickets_owned(getpid())/2;
     77d:	e8 51 05 00 00       	call   cd3 <getpid>
     782:	83 ec 0c             	sub    $0xc,%esp
     785:	50                   	push   %eax
     786:	e8 88 05 00 00       	call   d13 <tickets_owned>
    transfer_tickets(child[0].pid, tickets_transferred);
     78b:	59                   	pop    %ecx
     78c:	5e                   	pop    %esi
    tickets_transferred = tickets_owned(getpid())/2;
     78d:	89 c2                	mov    %eax,%edx
     78f:	c1 ea 1f             	shr    $0x1f,%edx
     792:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     795:	d1 fb                	sar    %ebx
    transfer_tickets(child[0].pid, tickets_transferred);
     797:	53                   	push   %ebx
     798:	ff 35 d8 18 00 00    	push   0x18d8
     79e:	e8 78 05 00 00       	call   d1b <transfer_tickets>
    printf(1, "parent (pid: %d) transferred %d tickets to child (pid: %d)\n", getpid(), tickets_transferred, child[0].pid);
     7a3:	8b 35 d8 18 00 00    	mov    0x18d8,%esi
     7a9:	e8 25 05 00 00       	call   cd3 <getpid>
     7ae:	89 34 24             	mov    %esi,(%esp)
     7b1:	53                   	push   %ebx
     7b2:	50                   	push   %eax
     7b3:	68 a8 13 00 00       	push   $0x13a8
     7b8:	6a 01                	push   $0x1
     7ba:	e8 11 06 00 00       	call   dd0 <printf>
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     7bf:	83 c4 20             	add    $0x20,%esp
     7c2:	e8 0c 05 00 00       	call   cd3 <getpid>
     7c7:	83 ec 0c             	sub    $0xc,%esp
     7ca:	50                   	push   %eax
     7cb:	e8 43 05 00 00       	call   d13 <tickets_owned>
     7d0:	89 c3                	mov    %eax,%ebx
     7d2:	e8 fc 04 00 00       	call   cd3 <getpid>
     7d7:	53                   	push   %ebx
     7d8:	50                   	push   %eax
     7d9:	68 28 11 00 00       	push   $0x1128
     7de:	6a 01                	push   $0x1
     7e0:	e8 eb 05 00 00       	call   dd0 <printf>
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     7e5:	83 c4 14             	add    $0x14,%esp
     7e8:	ff 35 d8 18 00 00    	push   0x18d8
     7ee:	e8 20 05 00 00       	call   d13 <tickets_owned>
     7f3:	50                   	push   %eax
     7f4:	ff 35 d8 18 00 00    	push   0x18d8
     7fa:	68 4c 11 00 00       	push   $0x114c
     7ff:	6a 01                	push   $0x1
     801:	e8 ca 05 00 00       	call   dd0 <printf>
    enable_sched_trace(1);
     806:	83 c4 14             	add    $0x14,%esp
     809:	6a 01                	push   $0x1
     80b:	e8 f3 04 00 00       	call   d03 <enable_sched_trace>
     810:	83 c4 10             	add    $0x10,%esp
    unsigned int tmp = 0;
     813:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     815:	31 c0                	xor    %eax,%eax
     817:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     81e:	66 90                	xchg   %ax,%ax
        tmp += cnt;
     820:	01 c2                	add    %eax,%edx
        cnt ++;
     822:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     825:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     82a:	75 f4                	jne    820 <test_case_4+0xe0>
    avoid_optm = tmp;
     82c:	89 15 d4 18 00 00    	mov    %edx,0x18d4
       if (wait() < 0)
     832:	e8 24 04 00 00       	call   c5b <wait>
     837:	85 c0                	test   %eax,%eax
     839:	78 22                	js     85d <test_case_4+0x11d>
    enable_sched_trace(0);
     83b:	83 ec 0c             	sub    $0xc,%esp
     83e:	6a 00                	push   $0x0
     840:	e8 be 04 00 00       	call   d03 <enable_sched_trace>
    printf(1, "\n\n");
     845:	58                   	pop    %eax
     846:	5a                   	pop    %edx
     847:	68 25 11 00 00       	push   $0x1125
     84c:	6a 01                	push   $0x1
     84e:	e8 7d 05 00 00       	call   dd0 <printf>
}
     853:	83 c4 10             	add    $0x10,%esp
     856:	8d 65 f8             	lea    -0x8(%ebp),%esp
     859:	5b                   	pop    %ebx
     85a:	5e                   	pop    %esi
     85b:	5d                   	pop    %ebp
     85c:	c3                   	ret
            printf(1, "\nwait() on child-%d failed!\n", i);
     85d:	83 ec 04             	sub    $0x4,%esp
     860:	6a 00                	push   $0x0
     862:	68 08 11 00 00       	push   $0x1108
     867:	6a 01                	push   $0x1
     869:	e8 62 05 00 00       	call   dd0 <printf>
     86e:	83 c4 10             	add    $0x10,%esp
     871:	eb c8                	jmp    83b <test_case_4+0xfb>
            printf(1, "fork() failed!\n");
     873:	83 ec 08             	sub    $0x8,%esp
     876:	68 f8 10 00 00       	push   $0x10f8
     87b:	6a 01                	push   $0x1
     87d:	e8 4e 05 00 00       	call   dd0 <printf>
            exit();
     882:	e8 cc 03 00 00       	call   c53 <exit>
    unsigned int tmp = 0;
     887:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     889:	31 c0                	xor    %eax,%eax
     88b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     88f:	90                   	nop
        tmp += cnt;
     890:	01 c2                	add    %eax,%edx
        cnt ++;
     892:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     895:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     89a:	75 f4                	jne    890 <test_case_4+0x150>
    avoid_optm = tmp;
     89c:	89 15 d4 18 00 00    	mov    %edx,0x18d4
            exit();
     8a2:	e8 ac 03 00 00       	call   c53 <exit>
     8a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ae:	66 90                	xchg   %ax,%ax

000008b0 <test_case_5>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	56                   	push   %esi
     8b4:	53                   	push   %ebx
    printf(1, "===== Test case 5: stride scheduler, %d child, with ticket trasfer at the beginning ... =====\n", child_cnt);
     8b5:	83 ec 04             	sub    $0x4,%esp
     8b8:	6a 01                	push   $0x1
     8ba:	68 e4 13 00 00       	push   $0x13e4
     8bf:	6a 01                	push   $0x1
     8c1:	e8 0a 05 00 00       	call   dd0 <printf>
    set_sched(scheduler);
     8c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8cd:	e8 39 04 00 00       	call   d0b <set_sched>
        child[i].pid = fork();
     8d2:	e8 74 03 00 00       	call   c4b <fork>
        if (child[i].pid < 0)
     8d7:	83 c4 10             	add    $0x10,%esp
        child[i].pid = fork();
     8da:	a3 d8 18 00 00       	mov    %eax,0x18d8
        if (child[i].pid < 0)
     8df:	85 c0                	test   %eax,%eax
     8e1:	0f 88 ec 00 00 00    	js     9d3 <test_case_5+0x123>
        else if (child[i].pid == 0) // child
     8e7:	0f 84 fa 00 00 00    	je     9e7 <test_case_5+0x137>
    tickets_transferred = tickets_owned(getpid()) - 1;
     8ed:	e8 e1 03 00 00       	call   cd3 <getpid>
     8f2:	83 ec 0c             	sub    $0xc,%esp
     8f5:	50                   	push   %eax
     8f6:	e8 18 04 00 00       	call   d13 <tickets_owned>
    transfer_tickets(child[0].pid, tickets_transferred);
     8fb:	59                   	pop    %ecx
     8fc:	5e                   	pop    %esi
    tickets_transferred = tickets_owned(getpid()) - 1;
     8fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
    transfer_tickets(child[0].pid, tickets_transferred);
     900:	53                   	push   %ebx
     901:	ff 35 d8 18 00 00    	push   0x18d8
     907:	e8 0f 04 00 00       	call   d1b <transfer_tickets>
    printf(1, "parent (pid: %d) transferred %d tickets to child (pid: %d)\n", getpid(), tickets_transferred, child[0].pid);
     90c:	8b 35 d8 18 00 00    	mov    0x18d8,%esi
     912:	e8 bc 03 00 00       	call   cd3 <getpid>
     917:	89 34 24             	mov    %esi,(%esp)
     91a:	53                   	push   %ebx
     91b:	50                   	push   %eax
     91c:	68 a8 13 00 00       	push   $0x13a8
     921:	6a 01                	push   $0x1
     923:	e8 a8 04 00 00       	call   dd0 <printf>
    printf(1, "parent (pid %d) has %d tickets.\n", getpid(), tickets_owned(getpid()));
     928:	83 c4 20             	add    $0x20,%esp
     92b:	e8 a3 03 00 00       	call   cd3 <getpid>
     930:	83 ec 0c             	sub    $0xc,%esp
     933:	50                   	push   %eax
     934:	e8 da 03 00 00       	call   d13 <tickets_owned>
     939:	89 c3                	mov    %eax,%ebx
     93b:	e8 93 03 00 00       	call   cd3 <getpid>
     940:	53                   	push   %ebx
     941:	50                   	push   %eax
     942:	68 28 11 00 00       	push   $0x1128
     947:	6a 01                	push   $0x1
     949:	e8 82 04 00 00       	call   dd0 <printf>
        printf(1, "child (pid %d) has %d tickets.\n", child[i].pid, tickets_owned(child[i].pid));     
     94e:	83 c4 14             	add    $0x14,%esp
     951:	ff 35 d8 18 00 00    	push   0x18d8
     957:	e8 b7 03 00 00       	call   d13 <tickets_owned>
     95c:	50                   	push   %eax
     95d:	ff 35 d8 18 00 00    	push   0x18d8
     963:	68 4c 11 00 00       	push   $0x114c
     968:	6a 01                	push   $0x1
     96a:	e8 61 04 00 00       	call   dd0 <printf>
    enable_sched_trace(1);
     96f:	83 c4 14             	add    $0x14,%esp
     972:	6a 01                	push   $0x1
     974:	e8 8a 03 00 00       	call   d03 <enable_sched_trace>
     979:	83 c4 10             	add    $0x10,%esp
    unsigned int tmp = 0;
     97c:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     97e:	31 c0                	xor    %eax,%eax
        tmp += cnt;
     980:	01 c2                	add    %eax,%edx
        cnt ++;
     982:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     985:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     98a:	75 f4                	jne    980 <test_case_5+0xd0>
    avoid_optm = tmp;
     98c:	89 15 d4 18 00 00    	mov    %edx,0x18d4
       if (wait() < 0)
     992:	e8 c4 02 00 00       	call   c5b <wait>
     997:	85 c0                	test   %eax,%eax
     999:	78 22                	js     9bd <test_case_5+0x10d>
    enable_sched_trace(0);
     99b:	83 ec 0c             	sub    $0xc,%esp
     99e:	6a 00                	push   $0x0
     9a0:	e8 5e 03 00 00       	call   d03 <enable_sched_trace>
    printf(1, "\n\n");
     9a5:	58                   	pop    %eax
     9a6:	5a                   	pop    %edx
     9a7:	68 25 11 00 00       	push   $0x1125
     9ac:	6a 01                	push   $0x1
     9ae:	e8 1d 04 00 00       	call   dd0 <printf>
}
     9b3:	83 c4 10             	add    $0x10,%esp
     9b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     9b9:	5b                   	pop    %ebx
     9ba:	5e                   	pop    %esi
     9bb:	5d                   	pop    %ebp
     9bc:	c3                   	ret
            printf(1, "\nwait() on child-%d failed!\n", i);
     9bd:	83 ec 04             	sub    $0x4,%esp
     9c0:	6a 00                	push   $0x0
     9c2:	68 08 11 00 00       	push   $0x1108
     9c7:	6a 01                	push   $0x1
     9c9:	e8 02 04 00 00       	call   dd0 <printf>
     9ce:	83 c4 10             	add    $0x10,%esp
     9d1:	eb c8                	jmp    99b <test_case_5+0xeb>
            printf(1, "fork() failed!\n");
     9d3:	83 ec 08             	sub    $0x8,%esp
     9d6:	68 f8 10 00 00       	push   $0x10f8
     9db:	6a 01                	push   $0x1
     9dd:	e8 ee 03 00 00       	call   dd0 <printf>
            exit();
     9e2:	e8 6c 02 00 00       	call   c53 <exit>
    unsigned int tmp = 0;
     9e7:	31 d2                	xor    %edx,%edx
    unsigned int cnt = 0;
     9e9:	31 c0                	xor    %eax,%eax
     9eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9ef:	90                   	nop
        tmp += cnt;
     9f0:	01 c2                	add    %eax,%edx
        cnt ++;
     9f2:	83 c0 01             	add    $0x1,%eax
    while(cnt < LOOP_CNT)
     9f5:	3d 00 00 00 10       	cmp    $0x10000000,%eax
     9fa:	75 f4                	jne    9f0 <test_case_5+0x140>
    avoid_optm = tmp;
     9fc:	89 15 d4 18 00 00    	mov    %edx,0x18d4
            exit();
     a02:	e8 4c 02 00 00       	call   c53 <exit>
     a07:	66 90                	xchg   %ax,%ax
     a09:	66 90                	xchg   %ax,%ax
     a0b:	66 90                	xchg   %ax,%ax
     a0d:	66 90                	xchg   %ax,%ax
     a0f:	90                   	nop

00000a10 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     a10:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a11:	31 c0                	xor    %eax,%eax
{
     a13:	89 e5                	mov    %esp,%ebp
     a15:	53                   	push   %ebx
     a16:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a19:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     a20:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     a24:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     a27:	83 c0 01             	add    $0x1,%eax
     a2a:	84 d2                	test   %dl,%dl
     a2c:	75 f2                	jne    a20 <strcpy+0x10>
    ;
  return os;
}
     a2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a31:	89 c8                	mov    %ecx,%eax
     a33:	c9                   	leave
     a34:	c3                   	ret
     a35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a40 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	53                   	push   %ebx
     a44:	8b 55 08             	mov    0x8(%ebp),%edx
     a47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     a4a:	0f b6 02             	movzbl (%edx),%eax
     a4d:	84 c0                	test   %al,%al
     a4f:	75 17                	jne    a68 <strcmp+0x28>
     a51:	eb 3a                	jmp    a8d <strcmp+0x4d>
     a53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a57:	90                   	nop
     a58:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     a5c:	83 c2 01             	add    $0x1,%edx
     a5f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     a62:	84 c0                	test   %al,%al
     a64:	74 1a                	je     a80 <strcmp+0x40>
    p++, q++;
     a66:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     a68:	0f b6 19             	movzbl (%ecx),%ebx
     a6b:	38 c3                	cmp    %al,%bl
     a6d:	74 e9                	je     a58 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     a6f:	29 d8                	sub    %ebx,%eax
}
     a71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a74:	c9                   	leave
     a75:	c3                   	ret
     a76:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a7d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     a80:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     a84:	31 c0                	xor    %eax,%eax
     a86:	29 d8                	sub    %ebx,%eax
}
     a88:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a8b:	c9                   	leave
     a8c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     a8d:	0f b6 19             	movzbl (%ecx),%ebx
     a90:	31 c0                	xor    %eax,%eax
     a92:	eb db                	jmp    a6f <strcmp+0x2f>
     a94:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a9f:	90                   	nop

00000aa0 <strlen>:

uint
strlen(char *s)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     aa6:	80 3a 00             	cmpb   $0x0,(%edx)
     aa9:	74 15                	je     ac0 <strlen+0x20>
     aab:	31 c0                	xor    %eax,%eax
     aad:	8d 76 00             	lea    0x0(%esi),%esi
     ab0:	83 c0 01             	add    $0x1,%eax
     ab3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     ab7:	89 c1                	mov    %eax,%ecx
     ab9:	75 f5                	jne    ab0 <strlen+0x10>
    ;
  return n;
}
     abb:	89 c8                	mov    %ecx,%eax
     abd:	5d                   	pop    %ebp
     abe:	c3                   	ret
     abf:	90                   	nop
  for(n = 0; s[n]; n++)
     ac0:	31 c9                	xor    %ecx,%ecx
}
     ac2:	5d                   	pop    %ebp
     ac3:	89 c8                	mov    %ecx,%eax
     ac5:	c3                   	ret
     ac6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     acd:	8d 76 00             	lea    0x0(%esi),%esi

00000ad0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	57                   	push   %edi
     ad4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     ad7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ada:	8b 45 0c             	mov    0xc(%ebp),%eax
     add:	89 d7                	mov    %edx,%edi
     adf:	fc                   	cld
     ae0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ae2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ae5:	89 d0                	mov    %edx,%eax
     ae7:	c9                   	leave
     ae8:	c3                   	ret
     ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <strchr>:

char*
strchr(const char *s, char c)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	8b 45 08             	mov    0x8(%ebp),%eax
     af6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     afa:	0f b6 10             	movzbl (%eax),%edx
     afd:	84 d2                	test   %dl,%dl
     aff:	75 12                	jne    b13 <strchr+0x23>
     b01:	eb 1d                	jmp    b20 <strchr+0x30>
     b03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b07:	90                   	nop
     b08:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     b0c:	83 c0 01             	add    $0x1,%eax
     b0f:	84 d2                	test   %dl,%dl
     b11:	74 0d                	je     b20 <strchr+0x30>
    if(*s == c)
     b13:	38 d1                	cmp    %dl,%cl
     b15:	75 f1                	jne    b08 <strchr+0x18>
      return (char*)s;
  return 0;
}
     b17:	5d                   	pop    %ebp
     b18:	c3                   	ret
     b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     b20:	31 c0                	xor    %eax,%eax
}
     b22:	5d                   	pop    %ebp
     b23:	c3                   	ret
     b24:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b2f:	90                   	nop

00000b30 <gets>:

char*
gets(char *buf, int max)
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     b35:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     b38:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     b39:	31 db                	xor    %ebx,%ebx
{
     b3b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     b3e:	eb 27                	jmp    b67 <gets+0x37>
    cc = read(0, &c, 1);
     b40:	83 ec 04             	sub    $0x4,%esp
     b43:	6a 01                	push   $0x1
     b45:	56                   	push   %esi
     b46:	6a 00                	push   $0x0
     b48:	e8 1e 01 00 00       	call   c6b <read>
    if(cc < 1)
     b4d:	83 c4 10             	add    $0x10,%esp
     b50:	85 c0                	test   %eax,%eax
     b52:	7e 1d                	jle    b71 <gets+0x41>
      break;
    buf[i++] = c;
     b54:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b58:	8b 55 08             	mov    0x8(%ebp),%edx
     b5b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     b5f:	3c 0a                	cmp    $0xa,%al
     b61:	74 10                	je     b73 <gets+0x43>
     b63:	3c 0d                	cmp    $0xd,%al
     b65:	74 0c                	je     b73 <gets+0x43>
  for(i=0; i+1 < max; ){
     b67:	89 df                	mov    %ebx,%edi
     b69:	83 c3 01             	add    $0x1,%ebx
     b6c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b6f:	7c cf                	jl     b40 <gets+0x10>
     b71:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     b73:	8b 45 08             	mov    0x8(%ebp),%eax
     b76:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     b7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b7d:	5b                   	pop    %ebx
     b7e:	5e                   	pop    %esi
     b7f:	5f                   	pop    %edi
     b80:	5d                   	pop    %ebp
     b81:	c3                   	ret
     b82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b90 <stat>:

int
stat(char *n, struct stat *st)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	56                   	push   %esi
     b94:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b95:	83 ec 08             	sub    $0x8,%esp
     b98:	6a 00                	push   $0x0
     b9a:	ff 75 08             	push   0x8(%ebp)
     b9d:	e8 f1 00 00 00       	call   c93 <open>
  if(fd < 0)
     ba2:	83 c4 10             	add    $0x10,%esp
     ba5:	85 c0                	test   %eax,%eax
     ba7:	78 27                	js     bd0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     ba9:	83 ec 08             	sub    $0x8,%esp
     bac:	ff 75 0c             	push   0xc(%ebp)
     baf:	89 c3                	mov    %eax,%ebx
     bb1:	50                   	push   %eax
     bb2:	e8 f4 00 00 00       	call   cab <fstat>
  close(fd);
     bb7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     bba:	89 c6                	mov    %eax,%esi
  close(fd);
     bbc:	e8 ba 00 00 00       	call   c7b <close>
  return r;
     bc1:	83 c4 10             	add    $0x10,%esp
}
     bc4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bc7:	89 f0                	mov    %esi,%eax
     bc9:	5b                   	pop    %ebx
     bca:	5e                   	pop    %esi
     bcb:	5d                   	pop    %ebp
     bcc:	c3                   	ret
     bcd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     bd0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     bd5:	eb ed                	jmp    bc4 <stat+0x34>
     bd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bde:	66 90                	xchg   %ax,%ax

00000be0 <atoi>:

int
atoi(const char *s)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	53                   	push   %ebx
     be4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     be7:	0f be 02             	movsbl (%edx),%eax
     bea:	8d 48 d0             	lea    -0x30(%eax),%ecx
     bed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     bf0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     bf5:	77 1e                	ja     c15 <atoi+0x35>
     bf7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     c00:	83 c2 01             	add    $0x1,%edx
     c03:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     c06:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     c0a:	0f be 02             	movsbl (%edx),%eax
     c0d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     c10:	80 fb 09             	cmp    $0x9,%bl
     c13:	76 eb                	jbe    c00 <atoi+0x20>
  return n;
}
     c15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c18:	89 c8                	mov    %ecx,%eax
     c1a:	c9                   	leave
     c1b:	c3                   	ret
     c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c20 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	57                   	push   %edi
     c24:	56                   	push   %esi
     c25:	8b 45 10             	mov    0x10(%ebp),%eax
     c28:	8b 55 08             	mov    0x8(%ebp),%edx
     c2b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c2e:	85 c0                	test   %eax,%eax
     c30:	7e 13                	jle    c45 <memmove+0x25>
     c32:	01 d0                	add    %edx,%eax
  dst = vdst;
     c34:	89 d7                	mov    %edx,%edi
     c36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     c40:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     c41:	39 f8                	cmp    %edi,%eax
     c43:	75 fb                	jne    c40 <memmove+0x20>
  return vdst;
}
     c45:	5e                   	pop    %esi
     c46:	89 d0                	mov    %edx,%eax
     c48:	5f                   	pop    %edi
     c49:	5d                   	pop    %ebp
     c4a:	c3                   	ret

00000c4b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     c4b:	b8 01 00 00 00       	mov    $0x1,%eax
     c50:	cd 40                	int    $0x40
     c52:	c3                   	ret

00000c53 <exit>:
SYSCALL(exit)
     c53:	b8 02 00 00 00       	mov    $0x2,%eax
     c58:	cd 40                	int    $0x40
     c5a:	c3                   	ret

00000c5b <wait>:
SYSCALL(wait)
     c5b:	b8 03 00 00 00       	mov    $0x3,%eax
     c60:	cd 40                	int    $0x40
     c62:	c3                   	ret

00000c63 <pipe>:
SYSCALL(pipe)
     c63:	b8 04 00 00 00       	mov    $0x4,%eax
     c68:	cd 40                	int    $0x40
     c6a:	c3                   	ret

00000c6b <read>:
SYSCALL(read)
     c6b:	b8 05 00 00 00       	mov    $0x5,%eax
     c70:	cd 40                	int    $0x40
     c72:	c3                   	ret

00000c73 <write>:
SYSCALL(write)
     c73:	b8 10 00 00 00       	mov    $0x10,%eax
     c78:	cd 40                	int    $0x40
     c7a:	c3                   	ret

00000c7b <close>:
SYSCALL(close)
     c7b:	b8 15 00 00 00       	mov    $0x15,%eax
     c80:	cd 40                	int    $0x40
     c82:	c3                   	ret

00000c83 <kill>:
SYSCALL(kill)
     c83:	b8 06 00 00 00       	mov    $0x6,%eax
     c88:	cd 40                	int    $0x40
     c8a:	c3                   	ret

00000c8b <exec>:
SYSCALL(exec)
     c8b:	b8 07 00 00 00       	mov    $0x7,%eax
     c90:	cd 40                	int    $0x40
     c92:	c3                   	ret

00000c93 <open>:
SYSCALL(open)
     c93:	b8 0f 00 00 00       	mov    $0xf,%eax
     c98:	cd 40                	int    $0x40
     c9a:	c3                   	ret

00000c9b <mknod>:
SYSCALL(mknod)
     c9b:	b8 11 00 00 00       	mov    $0x11,%eax
     ca0:	cd 40                	int    $0x40
     ca2:	c3                   	ret

00000ca3 <unlink>:
SYSCALL(unlink)
     ca3:	b8 12 00 00 00       	mov    $0x12,%eax
     ca8:	cd 40                	int    $0x40
     caa:	c3                   	ret

00000cab <fstat>:
SYSCALL(fstat)
     cab:	b8 08 00 00 00       	mov    $0x8,%eax
     cb0:	cd 40                	int    $0x40
     cb2:	c3                   	ret

00000cb3 <link>:
SYSCALL(link)
     cb3:	b8 13 00 00 00       	mov    $0x13,%eax
     cb8:	cd 40                	int    $0x40
     cba:	c3                   	ret

00000cbb <mkdir>:
SYSCALL(mkdir)
     cbb:	b8 14 00 00 00       	mov    $0x14,%eax
     cc0:	cd 40                	int    $0x40
     cc2:	c3                   	ret

00000cc3 <chdir>:
SYSCALL(chdir)
     cc3:	b8 09 00 00 00       	mov    $0x9,%eax
     cc8:	cd 40                	int    $0x40
     cca:	c3                   	ret

00000ccb <dup>:
SYSCALL(dup)
     ccb:	b8 0a 00 00 00       	mov    $0xa,%eax
     cd0:	cd 40                	int    $0x40
     cd2:	c3                   	ret

00000cd3 <getpid>:
SYSCALL(getpid)
     cd3:	b8 0b 00 00 00       	mov    $0xb,%eax
     cd8:	cd 40                	int    $0x40
     cda:	c3                   	ret

00000cdb <sbrk>:
SYSCALL(sbrk)
     cdb:	b8 0c 00 00 00       	mov    $0xc,%eax
     ce0:	cd 40                	int    $0x40
     ce2:	c3                   	ret

00000ce3 <sleep>:
SYSCALL(sleep)
     ce3:	b8 0d 00 00 00       	mov    $0xd,%eax
     ce8:	cd 40                	int    $0x40
     cea:	c3                   	ret

00000ceb <uptime>:
SYSCALL(uptime)
     ceb:	b8 0e 00 00 00       	mov    $0xe,%eax
     cf0:	cd 40                	int    $0x40
     cf2:	c3                   	ret

00000cf3 <shutdown>:
SYSCALL(shutdown)
     cf3:	b8 16 00 00 00       	mov    $0x16,%eax
     cf8:	cd 40                	int    $0x40
     cfa:	c3                   	ret

00000cfb <fork_winner>:
SYSCALL(fork_winner)
     cfb:	b8 18 00 00 00       	mov    $0x18,%eax
     d00:	cd 40                	int    $0x40
     d02:	c3                   	ret

00000d03 <enable_sched_trace>:
SYSCALL(enable_sched_trace)
     d03:	b8 17 00 00 00       	mov    $0x17,%eax
     d08:	cd 40                	int    $0x40
     d0a:	c3                   	ret

00000d0b <set_sched>:
SYSCALL(set_sched)
     d0b:	b8 19 00 00 00       	mov    $0x19,%eax
     d10:	cd 40                	int    $0x40
     d12:	c3                   	ret

00000d13 <tickets_owned>:
SYSCALL(tickets_owned)
     d13:	b8 1a 00 00 00       	mov    $0x1a,%eax
     d18:	cd 40                	int    $0x40
     d1a:	c3                   	ret

00000d1b <transfer_tickets>:
     d1b:	b8 1b 00 00 00       	mov    $0x1b,%eax
     d20:	cd 40                	int    $0x40
     d22:	c3                   	ret
     d23:	66 90                	xchg   %ax,%ax
     d25:	66 90                	xchg   %ax,%ax
     d27:	66 90                	xchg   %ax,%ax
     d29:	66 90                	xchg   %ax,%ax
     d2b:	66 90                	xchg   %ax,%ax
     d2d:	66 90                	xchg   %ax,%ax
     d2f:	90                   	nop

00000d30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	57                   	push   %edi
     d34:	56                   	push   %esi
     d35:	53                   	push   %ebx
     d36:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     d38:	89 d1                	mov    %edx,%ecx
{
     d3a:	83 ec 3c             	sub    $0x3c,%esp
     d3d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     d40:	85 d2                	test   %edx,%edx
     d42:	0f 89 80 00 00 00    	jns    dc8 <printint+0x98>
     d48:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     d4c:	74 7a                	je     dc8 <printint+0x98>
    x = -xx;
     d4e:	f7 d9                	neg    %ecx
    neg = 1;
     d50:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     d55:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     d58:	31 f6                	xor    %esi,%esi
     d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     d60:	89 c8                	mov    %ecx,%eax
     d62:	31 d2                	xor    %edx,%edx
     d64:	89 f7                	mov    %esi,%edi
     d66:	f7 f3                	div    %ebx
     d68:	8d 76 01             	lea    0x1(%esi),%esi
     d6b:	0f b6 92 a4 14 00 00 	movzbl 0x14a4(%edx),%edx
     d72:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     d76:	89 ca                	mov    %ecx,%edx
     d78:	89 c1                	mov    %eax,%ecx
     d7a:	39 da                	cmp    %ebx,%edx
     d7c:	73 e2                	jae    d60 <printint+0x30>
  if(neg)
     d7e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     d81:	85 c0                	test   %eax,%eax
     d83:	74 07                	je     d8c <printint+0x5c>
    buf[i++] = '-';
     d85:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
     d8a:	89 f7                	mov    %esi,%edi
     d8c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     d8f:	8b 75 c0             	mov    -0x40(%ebp),%esi
     d92:	01 df                	add    %ebx,%edi
     d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
     d98:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     d9b:	83 ec 04             	sub    $0x4,%esp
     d9e:	88 45 d7             	mov    %al,-0x29(%ebp)
     da1:	8d 45 d7             	lea    -0x29(%ebp),%eax
     da4:	6a 01                	push   $0x1
     da6:	50                   	push   %eax
     da7:	56                   	push   %esi
     da8:	e8 c6 fe ff ff       	call   c73 <write>
  while(--i >= 0)
     dad:	89 f8                	mov    %edi,%eax
     daf:	83 c4 10             	add    $0x10,%esp
     db2:	83 ef 01             	sub    $0x1,%edi
     db5:	39 d8                	cmp    %ebx,%eax
     db7:	75 df                	jne    d98 <printint+0x68>
}
     db9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dbc:	5b                   	pop    %ebx
     dbd:	5e                   	pop    %esi
     dbe:	5f                   	pop    %edi
     dbf:	5d                   	pop    %ebp
     dc0:	c3                   	ret
     dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     dc8:	31 c0                	xor    %eax,%eax
     dca:	eb 89                	jmp    d55 <printint+0x25>
     dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000dd0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	57                   	push   %edi
     dd4:	56                   	push   %esi
     dd5:	53                   	push   %ebx
     dd6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     dd9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     ddc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     ddf:	0f b6 1e             	movzbl (%esi),%ebx
     de2:	83 c6 01             	add    $0x1,%esi
     de5:	84 db                	test   %bl,%bl
     de7:	74 67                	je     e50 <printf+0x80>
     de9:	8d 4d 10             	lea    0x10(%ebp),%ecx
     dec:	31 d2                	xor    %edx,%edx
     dee:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     df1:	eb 34                	jmp    e27 <printf+0x57>
     df3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     df7:	90                   	nop
     df8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     dfb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     e00:	83 f8 25             	cmp    $0x25,%eax
     e03:	74 18                	je     e1d <printf+0x4d>
  write(fd, &c, 1);
     e05:	83 ec 04             	sub    $0x4,%esp
     e08:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e0b:	88 5d e7             	mov    %bl,-0x19(%ebp)
     e0e:	6a 01                	push   $0x1
     e10:	50                   	push   %eax
     e11:	57                   	push   %edi
     e12:	e8 5c fe ff ff       	call   c73 <write>
     e17:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     e1a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     e1d:	0f b6 1e             	movzbl (%esi),%ebx
     e20:	83 c6 01             	add    $0x1,%esi
     e23:	84 db                	test   %bl,%bl
     e25:	74 29                	je     e50 <printf+0x80>
    c = fmt[i] & 0xff;
     e27:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     e2a:	85 d2                	test   %edx,%edx
     e2c:	74 ca                	je     df8 <printf+0x28>
      }
    } else if(state == '%'){
     e2e:	83 fa 25             	cmp    $0x25,%edx
     e31:	75 ea                	jne    e1d <printf+0x4d>
      if(c == 'd'){
     e33:	83 f8 25             	cmp    $0x25,%eax
     e36:	0f 84 24 01 00 00    	je     f60 <printf+0x190>
     e3c:	83 e8 63             	sub    $0x63,%eax
     e3f:	83 f8 15             	cmp    $0x15,%eax
     e42:	77 1c                	ja     e60 <printf+0x90>
     e44:	ff 24 85 4c 14 00 00 	jmp    *0x144c(,%eax,4)
     e4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e4f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     e50:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e53:	5b                   	pop    %ebx
     e54:	5e                   	pop    %esi
     e55:	5f                   	pop    %edi
     e56:	5d                   	pop    %ebp
     e57:	c3                   	ret
     e58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e5f:	90                   	nop
  write(fd, &c, 1);
     e60:	83 ec 04             	sub    $0x4,%esp
     e63:	8d 55 e7             	lea    -0x19(%ebp),%edx
     e66:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     e6a:	6a 01                	push   $0x1
     e6c:	52                   	push   %edx
     e6d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     e70:	57                   	push   %edi
     e71:	e8 fd fd ff ff       	call   c73 <write>
     e76:	83 c4 0c             	add    $0xc,%esp
     e79:	88 5d e7             	mov    %bl,-0x19(%ebp)
     e7c:	6a 01                	push   $0x1
     e7e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e81:	52                   	push   %edx
     e82:	57                   	push   %edi
     e83:	e8 eb fd ff ff       	call   c73 <write>
        putc(fd, c);
     e88:	83 c4 10             	add    $0x10,%esp
      state = 0;
     e8b:	31 d2                	xor    %edx,%edx
     e8d:	eb 8e                	jmp    e1d <printf+0x4d>
     e8f:	90                   	nop
        printint(fd, *ap, 16, 0);
     e90:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     e93:	83 ec 0c             	sub    $0xc,%esp
     e96:	b9 10 00 00 00       	mov    $0x10,%ecx
     e9b:	8b 13                	mov    (%ebx),%edx
     e9d:	6a 00                	push   $0x0
     e9f:	89 f8                	mov    %edi,%eax
        ap++;
     ea1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
     ea4:	e8 87 fe ff ff       	call   d30 <printint>
        ap++;
     ea9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     eac:	83 c4 10             	add    $0x10,%esp
      state = 0;
     eaf:	31 d2                	xor    %edx,%edx
     eb1:	e9 67 ff ff ff       	jmp    e1d <printf+0x4d>
     eb6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ebd:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
     ec0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     ec3:	8b 18                	mov    (%eax),%ebx
        ap++;
     ec5:	83 c0 04             	add    $0x4,%eax
     ec8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     ecb:	85 db                	test   %ebx,%ebx
     ecd:	0f 84 9d 00 00 00    	je     f70 <printf+0x1a0>
        while(*s != 0){
     ed3:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
     ed6:	31 d2                	xor    %edx,%edx
        while(*s != 0){
     ed8:	84 c0                	test   %al,%al
     eda:	0f 84 3d ff ff ff    	je     e1d <printf+0x4d>
     ee0:	8d 55 e7             	lea    -0x19(%ebp),%edx
     ee3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     ee6:	89 de                	mov    %ebx,%esi
     ee8:	89 d3                	mov    %edx,%ebx
     eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     ef0:	83 ec 04             	sub    $0x4,%esp
     ef3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
     ef6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
     ef9:	6a 01                	push   $0x1
     efb:	53                   	push   %ebx
     efc:	57                   	push   %edi
     efd:	e8 71 fd ff ff       	call   c73 <write>
        while(*s != 0){
     f02:	0f b6 06             	movzbl (%esi),%eax
     f05:	83 c4 10             	add    $0x10,%esp
     f08:	84 c0                	test   %al,%al
     f0a:	75 e4                	jne    ef0 <printf+0x120>
      state = 0;
     f0c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
     f0f:	31 d2                	xor    %edx,%edx
     f11:	e9 07 ff ff ff       	jmp    e1d <printf+0x4d>
     f16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f1d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
     f20:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f23:	83 ec 0c             	sub    $0xc,%esp
     f26:	b9 0a 00 00 00       	mov    $0xa,%ecx
     f2b:	8b 13                	mov    (%ebx),%edx
     f2d:	6a 01                	push   $0x1
     f2f:	e9 6b ff ff ff       	jmp    e9f <printf+0xcf>
     f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
     f38:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
     f3b:	83 ec 04             	sub    $0x4,%esp
     f3e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
     f41:	8b 03                	mov    (%ebx),%eax
        ap++;
     f43:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
     f46:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     f49:	6a 01                	push   $0x1
     f4b:	52                   	push   %edx
     f4c:	57                   	push   %edi
     f4d:	e8 21 fd ff ff       	call   c73 <write>
        ap++;
     f52:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     f55:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f58:	31 d2                	xor    %edx,%edx
     f5a:	e9 be fe ff ff       	jmp    e1d <printf+0x4d>
     f5f:	90                   	nop
  write(fd, &c, 1);
     f60:	83 ec 04             	sub    $0x4,%esp
     f63:	88 5d e7             	mov    %bl,-0x19(%ebp)
     f66:	8d 55 e7             	lea    -0x19(%ebp),%edx
     f69:	6a 01                	push   $0x1
     f6b:	e9 11 ff ff ff       	jmp    e81 <printf+0xb1>
     f70:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
     f75:	bb 43 14 00 00       	mov    $0x1443,%ebx
     f7a:	e9 61 ff ff ff       	jmp    ee0 <printf+0x110>
     f7f:	90                   	nop

00000f80 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f80:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f81:	a1 f0 18 00 00       	mov    0x18f0,%eax
{
     f86:	89 e5                	mov    %esp,%ebp
     f88:	57                   	push   %edi
     f89:	56                   	push   %esi
     f8a:	53                   	push   %ebx
     f8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
     f8e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f98:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f9a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f9c:	39 ca                	cmp    %ecx,%edx
     f9e:	73 30                	jae    fd0 <free+0x50>
     fa0:	39 c1                	cmp    %eax,%ecx
     fa2:	72 04                	jb     fa8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fa4:	39 c2                	cmp    %eax,%edx
     fa6:	72 f0                	jb     f98 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
     fa8:	8b 73 fc             	mov    -0x4(%ebx),%esi
     fab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     fae:	39 f8                	cmp    %edi,%eax
     fb0:	74 2e                	je     fe0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
     fb2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     fb5:	8b 42 04             	mov    0x4(%edx),%eax
     fb8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     fbb:	39 f1                	cmp    %esi,%ecx
     fbd:	74 38                	je     ff7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
     fbf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
     fc1:	5b                   	pop    %ebx
  freep = p;
     fc2:	89 15 f0 18 00 00    	mov    %edx,0x18f0
}
     fc8:	5e                   	pop    %esi
     fc9:	5f                   	pop    %edi
     fca:	5d                   	pop    %ebp
     fcb:	c3                   	ret
     fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fd0:	39 c1                	cmp    %eax,%ecx
     fd2:	72 d0                	jb     fa4 <free+0x24>
     fd4:	eb c2                	jmp    f98 <free+0x18>
     fd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fdd:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
     fe0:	03 70 04             	add    0x4(%eax),%esi
     fe3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     fe6:	8b 02                	mov    (%edx),%eax
     fe8:	8b 00                	mov    (%eax),%eax
     fea:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
     fed:	8b 42 04             	mov    0x4(%edx),%eax
     ff0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     ff3:	39 f1                	cmp    %esi,%ecx
     ff5:	75 c8                	jne    fbf <free+0x3f>
    p->s.size += bp->s.size;
     ff7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
     ffa:	89 15 f0 18 00 00    	mov    %edx,0x18f0
    p->s.size += bp->s.size;
    1000:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1003:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1006:	89 0a                	mov    %ecx,(%edx)
}
    1008:	5b                   	pop    %ebx
    1009:	5e                   	pop    %esi
    100a:	5f                   	pop    %edi
    100b:	5d                   	pop    %ebp
    100c:	c3                   	ret
    100d:	8d 76 00             	lea    0x0(%esi),%esi

00001010 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
    1016:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1019:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    101c:	8b 15 f0 18 00 00    	mov    0x18f0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1022:	8d 78 07             	lea    0x7(%eax),%edi
    1025:	c1 ef 03             	shr    $0x3,%edi
    1028:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    102b:	85 d2                	test   %edx,%edx
    102d:	0f 84 8d 00 00 00    	je     10c0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1033:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1035:	8b 48 04             	mov    0x4(%eax),%ecx
    1038:	39 f9                	cmp    %edi,%ecx
    103a:	73 64                	jae    10a0 <malloc+0x90>
  if(nu < 4096)
    103c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1041:	39 df                	cmp    %ebx,%edi
    1043:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1046:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    104d:	eb 0a                	jmp    1059 <malloc+0x49>
    104f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1050:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1052:	8b 48 04             	mov    0x4(%eax),%ecx
    1055:	39 f9                	cmp    %edi,%ecx
    1057:	73 47                	jae    10a0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1059:	89 c2                	mov    %eax,%edx
    105b:	39 05 f0 18 00 00    	cmp    %eax,0x18f0
    1061:	75 ed                	jne    1050 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1063:	83 ec 0c             	sub    $0xc,%esp
    1066:	56                   	push   %esi
    1067:	e8 6f fc ff ff       	call   cdb <sbrk>
  if(p == (char*)-1)
    106c:	83 c4 10             	add    $0x10,%esp
    106f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1072:	74 1c                	je     1090 <malloc+0x80>
  hp->s.size = nu;
    1074:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1077:	83 ec 0c             	sub    $0xc,%esp
    107a:	83 c0 08             	add    $0x8,%eax
    107d:	50                   	push   %eax
    107e:	e8 fd fe ff ff       	call   f80 <free>
  return freep;
    1083:	8b 15 f0 18 00 00    	mov    0x18f0,%edx
      if((p = morecore(nunits)) == 0)
    1089:	83 c4 10             	add    $0x10,%esp
    108c:	85 d2                	test   %edx,%edx
    108e:	75 c0                	jne    1050 <malloc+0x40>
        return 0;
  }
}
    1090:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1093:	31 c0                	xor    %eax,%eax
}
    1095:	5b                   	pop    %ebx
    1096:	5e                   	pop    %esi
    1097:	5f                   	pop    %edi
    1098:	5d                   	pop    %ebp
    1099:	c3                   	ret
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    10a0:	39 cf                	cmp    %ecx,%edi
    10a2:	74 4c                	je     10f0 <malloc+0xe0>
        p->s.size -= nunits;
    10a4:	29 f9                	sub    %edi,%ecx
    10a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    10a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    10ac:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    10af:	89 15 f0 18 00 00    	mov    %edx,0x18f0
}
    10b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    10b8:	83 c0 08             	add    $0x8,%eax
}
    10bb:	5b                   	pop    %ebx
    10bc:	5e                   	pop    %esi
    10bd:	5f                   	pop    %edi
    10be:	5d                   	pop    %ebp
    10bf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    10c0:	c7 05 f0 18 00 00 f4 	movl   $0x18f4,0x18f0
    10c7:	18 00 00 
    base.s.size = 0;
    10ca:	b8 f4 18 00 00       	mov    $0x18f4,%eax
    base.s.ptr = freep = prevp = &base;
    10cf:	c7 05 f4 18 00 00 f4 	movl   $0x18f4,0x18f4
    10d6:	18 00 00 
    base.s.size = 0;
    10d9:	c7 05 f8 18 00 00 00 	movl   $0x0,0x18f8
    10e0:	00 00 00 
    if(p->s.size >= nunits){
    10e3:	e9 54 ff ff ff       	jmp    103c <malloc+0x2c>
    10e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    10f0:	8b 08                	mov    (%eax),%ecx
    10f2:	89 0a                	mov    %ecx,(%edx)
    10f4:	eb b9                	jmp    10af <malloc+0x9f>
