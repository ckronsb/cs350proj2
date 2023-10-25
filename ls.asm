
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 41 05 00 00       	call   583 <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 70 0a 00 00       	push   $0xa70
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 2f 05 00 00       	call   583 <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 5f 03 00 00       	call   3d0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 f0                	cmp    %esi,%eax
  85:	72 0a                	jb     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 36 03 00 00       	call   3d0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 25 03 00 00       	call   3d0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 f8 0d 00 00       	push   $0xdf8
  b5:	e8 96 04 00 00       	call   550 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 0e 03 00 00       	call   3d0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb f8 0d 00 00       	mov    $0xdf8,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ff 02 00 00       	call   3d0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 f8 0d 00 00       	add    $0xdf8,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 ac 04 00 00       	call   5c3 <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 a7 04 00 00       	call   5db <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 50 04 00 00       	call   5ab <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 176:	83 ec 0c             	sub    $0xc,%esp
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 185:	57                   	push   %edi
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 50 0a 00 00       	push   $0xa50
 19d:	6a 01                	push   $0x1
 19f:	e8 5c 05 00 00       	call   700 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 17 02 00 00       	call   3d0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 ee 01 00 00       	call   3d0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 89 03 00 00       	call   59b <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 11 03 00 00       	call   550 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 6e 02 00 00       	call   4c0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 263:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 269:	83 ec 0c             	sub    $0xc,%esp
 26c:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 273:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 279:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 27f:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 285:	57                   	push   %edi
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	59                   	pop    %ecx
 28d:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 293:	51                   	push   %ecx
 294:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 50 0a 00 00       	push   $0xa50
 2a7:	6a 01                	push   $0x1
 2a9:	e8 52 04 00 00       	call   700 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 28 0a 00 00       	push   $0xa28
 2c9:	6a 02                	push   $0x2
 2cb:	e8 30 04 00 00       	call   700 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 5d 0a 00 00       	push   $0xa5d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 11 04 00 00       	call   700 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 3c 0a 00 00       	push   $0xa3c
 309:	6a 02                	push   $0x2
 30b:	e8 f0 03 00 00       	call   700 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 93 02 00 00       	call   5ab <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 3c 0a 00 00       	push   $0xa3c
 331:	6a 01                	push   $0x1
 333:	e8 c8 03 00 00       	call   700 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 c0                	xor    %eax,%eax
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 4d 08             	mov    0x8(%ebp),%ecx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	89 c8                	mov    %ecx,%eax
 363:	c9                   	leave
 364:	c3                   	ret
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 37a:	0f b6 02             	movzbl (%edx),%eax
 37d:	84 c0                	test   %al,%al
 37f:	75 17                	jne    398 <strcmp+0x28>
 381:	eb 3a                	jmp    3bd <strcmp+0x4d>
 383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 387:	90                   	nop
 388:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 38c:	83 c2 01             	add    $0x1,%edx
 38f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 392:	84 c0                	test   %al,%al
 394:	74 1a                	je     3b0 <strcmp+0x40>
    p++, q++;
 396:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 398:	0f b6 19             	movzbl (%ecx),%ebx
 39b:	38 c3                	cmp    %al,%bl
 39d:	74 e9                	je     388 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 39f:	29 d8                	sub    %ebx,%eax
}
 3a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a4:	c9                   	leave
 3a5:	c3                   	ret
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3b4:	31 c0                	xor    %eax,%eax
 3b6:	29 d8                	sub    %ebx,%eax
}
 3b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3bb:	c9                   	leave
 3bc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 3bd:	0f b6 19             	movzbl (%ecx),%ebx
 3c0:	31 c0                	xor    %eax,%eax
 3c2:	eb db                	jmp    39f <strcmp+0x2f>
 3c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <strlen>:

uint
strlen(char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3d6:	80 3a 00             	cmpb   $0x0,(%edx)
 3d9:	74 15                	je     3f0 <strlen+0x20>
 3db:	31 c0                	xor    %eax,%eax
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	83 c0 01             	add    $0x1,%eax
 3e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3e7:	89 c1                	mov    %eax,%ecx
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	89 c8                	mov    %ecx,%eax
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret
 3ef:	90                   	nop
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	8b 7d fc             	mov    -0x4(%ebp),%edi
 415:	89 d0                	mov    %edx,%eax
 417:	c9                   	leave
 418:	c3                   	ret
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	75 12                	jne    443 <strchr+0x23>
 431:	eb 1d                	jmp    450 <strchr+0x30>
 433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 437:	90                   	nop
 438:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 43c:	83 c0 01             	add    $0x1,%eax
 43f:	84 d2                	test   %dl,%dl
 441:	74 0d                	je     450 <strchr+0x30>
    if(*s == c)
 443:	38 d1                	cmp    %dl,%cl
 445:	75 f1                	jne    438 <strchr+0x18>
      return (char*)s;
  return 0;
}
 447:	5d                   	pop    %ebp
 448:	c3                   	ret
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 450:	31 c0                	xor    %eax,%eax
}
 452:	5d                   	pop    %ebp
 453:	c3                   	ret
 454:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 465:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 468:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 469:	31 db                	xor    %ebx,%ebx
{
 46b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 46e:	eb 27                	jmp    497 <gets+0x37>
    cc = read(0, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	6a 01                	push   $0x1
 475:	56                   	push   %esi
 476:	6a 00                	push   $0x0
 478:	e8 1e 01 00 00       	call   59b <read>
    if(cc < 1)
 47d:	83 c4 10             	add    $0x10,%esp
 480:	85 c0                	test   %eax,%eax
 482:	7e 1d                	jle    4a1 <gets+0x41>
      break;
    buf[i++] = c;
 484:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 488:	8b 55 08             	mov    0x8(%ebp),%edx
 48b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 48f:	3c 0a                	cmp    $0xa,%al
 491:	74 10                	je     4a3 <gets+0x43>
 493:	3c 0d                	cmp    $0xd,%al
 495:	74 0c                	je     4a3 <gets+0x43>
  for(i=0; i+1 < max; ){
 497:	89 df                	mov    %ebx,%edi
 499:	83 c3 01             	add    $0x1,%ebx
 49c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 49f:	7c cf                	jl     470 <gets+0x10>
 4a1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 4aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ad:	5b                   	pop    %ebx
 4ae:	5e                   	pop    %esi
 4af:	5f                   	pop    %edi
 4b0:	5d                   	pop    %ebp
 4b1:	c3                   	ret
 4b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <stat>:

int
stat(char *n, struct stat *st)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	ff 75 08             	push   0x8(%ebp)
 4cd:	e8 f1 00 00 00       	call   5c3 <open>
  if(fd < 0)
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	85 c0                	test   %eax,%eax
 4d7:	78 27                	js     500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4d9:	83 ec 08             	sub    $0x8,%esp
 4dc:	ff 75 0c             	push   0xc(%ebp)
 4df:	89 c3                	mov    %eax,%ebx
 4e1:	50                   	push   %eax
 4e2:	e8 f4 00 00 00       	call   5db <fstat>
  close(fd);
 4e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ea:	89 c6                	mov    %eax,%esi
  close(fd);
 4ec:	e8 ba 00 00 00       	call   5ab <close>
  return r;
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f7:	89 f0                	mov    %esi,%eax
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 500:	be ff ff ff ff       	mov    $0xffffffff,%esi
 505:	eb ed                	jmp    4f4 <stat+0x34>
 507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50e:	66 90                	xchg   %ax,%ax

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 517:	0f be 02             	movsbl (%edx),%eax
 51a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 51d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 520:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 525:	77 1e                	ja     545 <atoi+0x35>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 530:	83 c2 01             	add    $0x1,%edx
 533:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 536:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 53a:	0f be 02             	movsbl (%edx),%eax
 53d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 540:	80 fb 09             	cmp    $0x9,%bl
 543:	76 eb                	jbe    530 <atoi+0x20>
  return n;
}
 545:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 548:	89 c8                	mov    %ecx,%eax
 54a:	c9                   	leave
 54b:	c3                   	ret
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000550 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	8b 45 10             	mov    0x10(%ebp),%eax
 558:	8b 55 08             	mov    0x8(%ebp),%edx
 55b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 55e:	85 c0                	test   %eax,%eax
 560:	7e 13                	jle    575 <memmove+0x25>
 562:	01 d0                	add    %edx,%eax
  dst = vdst;
 564:	89 d7                	mov    %edx,%edi
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 570:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 571:	39 f8                	cmp    %edi,%eax
 573:	75 fb                	jne    570 <memmove+0x20>
  return vdst;
}
 575:	5e                   	pop    %esi
 576:	89 d0                	mov    %edx,%eax
 578:	5f                   	pop    %edi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret

0000057b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57b:	b8 01 00 00 00       	mov    $0x1,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret

00000583 <exit>:
SYSCALL(exit)
 583:	b8 02 00 00 00       	mov    $0x2,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret

0000058b <wait>:
SYSCALL(wait)
 58b:	b8 03 00 00 00       	mov    $0x3,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret

00000593 <pipe>:
SYSCALL(pipe)
 593:	b8 04 00 00 00       	mov    $0x4,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret

0000059b <read>:
SYSCALL(read)
 59b:	b8 05 00 00 00       	mov    $0x5,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret

000005a3 <write>:
SYSCALL(write)
 5a3:	b8 10 00 00 00       	mov    $0x10,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret

000005ab <close>:
SYSCALL(close)
 5ab:	b8 15 00 00 00       	mov    $0x15,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret

000005b3 <kill>:
SYSCALL(kill)
 5b3:	b8 06 00 00 00       	mov    $0x6,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret

000005bb <exec>:
SYSCALL(exec)
 5bb:	b8 07 00 00 00       	mov    $0x7,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret

000005c3 <open>:
SYSCALL(open)
 5c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret

000005cb <mknod>:
SYSCALL(mknod)
 5cb:	b8 11 00 00 00       	mov    $0x11,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret

000005d3 <unlink>:
SYSCALL(unlink)
 5d3:	b8 12 00 00 00       	mov    $0x12,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret

000005db <fstat>:
SYSCALL(fstat)
 5db:	b8 08 00 00 00       	mov    $0x8,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret

000005e3 <link>:
SYSCALL(link)
 5e3:	b8 13 00 00 00       	mov    $0x13,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret

000005eb <mkdir>:
SYSCALL(mkdir)
 5eb:	b8 14 00 00 00       	mov    $0x14,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret

000005f3 <chdir>:
SYSCALL(chdir)
 5f3:	b8 09 00 00 00       	mov    $0x9,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret

000005fb <dup>:
SYSCALL(dup)
 5fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret

00000603 <getpid>:
SYSCALL(getpid)
 603:	b8 0b 00 00 00       	mov    $0xb,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret

0000060b <sbrk>:
SYSCALL(sbrk)
 60b:	b8 0c 00 00 00       	mov    $0xc,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret

00000613 <sleep>:
SYSCALL(sleep)
 613:	b8 0d 00 00 00       	mov    $0xd,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret

0000061b <uptime>:
SYSCALL(uptime)
 61b:	b8 0e 00 00 00       	mov    $0xe,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret

00000623 <shutdown>:
SYSCALL(shutdown)
 623:	b8 16 00 00 00       	mov    $0x16,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret

0000062b <fork_winner>:
SYSCALL(fork_winner)
 62b:	b8 18 00 00 00       	mov    $0x18,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret

00000633 <enable_sched_trace>:
SYSCALL(enable_sched_trace)
 633:	b8 17 00 00 00       	mov    $0x17,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret

0000063b <set_sched>:
SYSCALL(set_sched)
 63b:	b8 19 00 00 00       	mov    $0x19,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret

00000643 <tickets_owned>:
SYSCALL(tickets_owned)
 643:	b8 1a 00 00 00       	mov    $0x1a,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret

0000064b <transfer_tickets>:
 64b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret
 653:	66 90                	xchg   %ax,%ax
 655:	66 90                	xchg   %ax,%ax
 657:	66 90                	xchg   %ax,%ax
 659:	66 90                	xchg   %ax,%ax
 65b:	66 90                	xchg   %ax,%ax
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 668:	89 d1                	mov    %edx,%ecx
{
 66a:	83 ec 3c             	sub    $0x3c,%esp
 66d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 670:	85 d2                	test   %edx,%edx
 672:	0f 89 80 00 00 00    	jns    6f8 <printint+0x98>
 678:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 67c:	74 7a                	je     6f8 <printint+0x98>
    x = -xx;
 67e:	f7 d9                	neg    %ecx
    neg = 1;
 680:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 685:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 688:	31 f6                	xor    %esi,%esi
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 c8                	mov    %ecx,%eax
 692:	31 d2                	xor    %edx,%edx
 694:	89 f7                	mov    %esi,%edi
 696:	f7 f3                	div    %ebx
 698:	8d 76 01             	lea    0x1(%esi),%esi
 69b:	0f b6 92 d4 0a 00 00 	movzbl 0xad4(%edx),%edx
 6a2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 6a6:	89 ca                	mov    %ecx,%edx
 6a8:	89 c1                	mov    %eax,%ecx
 6aa:	39 da                	cmp    %ebx,%edx
 6ac:	73 e2                	jae    690 <printint+0x30>
  if(neg)
 6ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6b1:	85 c0                	test   %eax,%eax
 6b3:	74 07                	je     6bc <printint+0x5c>
    buf[i++] = '-';
 6b5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 6ba:	89 f7                	mov    %esi,%edi
 6bc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 6bf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 6c2:	01 df                	add    %ebx,%edi
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 6c8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 6cb:	83 ec 04             	sub    $0x4,%esp
 6ce:	88 45 d7             	mov    %al,-0x29(%ebp)
 6d1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 6d4:	6a 01                	push   $0x1
 6d6:	50                   	push   %eax
 6d7:	56                   	push   %esi
 6d8:	e8 c6 fe ff ff       	call   5a3 <write>
  while(--i >= 0)
 6dd:	89 f8                	mov    %edi,%eax
 6df:	83 c4 10             	add    $0x10,%esp
 6e2:	83 ef 01             	sub    $0x1,%edi
 6e5:	39 d8                	cmp    %ebx,%eax
 6e7:	75 df                	jne    6c8 <printint+0x68>
}
 6e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ec:	5b                   	pop    %ebx
 6ed:	5e                   	pop    %esi
 6ee:	5f                   	pop    %edi
 6ef:	5d                   	pop    %ebp
 6f0:	c3                   	ret
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f8:	31 c0                	xor    %eax,%eax
 6fa:	eb 89                	jmp    685 <printint+0x25>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 70c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 70f:	0f b6 1e             	movzbl (%esi),%ebx
 712:	83 c6 01             	add    $0x1,%esi
 715:	84 db                	test   %bl,%bl
 717:	74 67                	je     780 <printf+0x80>
 719:	8d 4d 10             	lea    0x10(%ebp),%ecx
 71c:	31 d2                	xor    %edx,%edx
 71e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 721:	eb 34                	jmp    757 <printf+0x57>
 723:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 727:	90                   	nop
 728:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 72b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 730:	83 f8 25             	cmp    $0x25,%eax
 733:	74 18                	je     74d <printf+0x4d>
  write(fd, &c, 1);
 735:	83 ec 04             	sub    $0x4,%esp
 738:	8d 45 e7             	lea    -0x19(%ebp),%eax
 73b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 73e:	6a 01                	push   $0x1
 740:	50                   	push   %eax
 741:	57                   	push   %edi
 742:	e8 5c fe ff ff       	call   5a3 <write>
 747:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 74a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 74d:	0f b6 1e             	movzbl (%esi),%ebx
 750:	83 c6 01             	add    $0x1,%esi
 753:	84 db                	test   %bl,%bl
 755:	74 29                	je     780 <printf+0x80>
    c = fmt[i] & 0xff;
 757:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 75a:	85 d2                	test   %edx,%edx
 75c:	74 ca                	je     728 <printf+0x28>
      }
    } else if(state == '%'){
 75e:	83 fa 25             	cmp    $0x25,%edx
 761:	75 ea                	jne    74d <printf+0x4d>
      if(c == 'd'){
 763:	83 f8 25             	cmp    $0x25,%eax
 766:	0f 84 24 01 00 00    	je     890 <printf+0x190>
 76c:	83 e8 63             	sub    $0x63,%eax
 76f:	83 f8 15             	cmp    $0x15,%eax
 772:	77 1c                	ja     790 <printf+0x90>
 774:	ff 24 85 7c 0a 00 00 	jmp    *0xa7c(,%eax,4)
 77b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 780:	8d 65 f4             	lea    -0xc(%ebp),%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
 793:	8d 55 e7             	lea    -0x19(%ebp),%edx
 796:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 79a:	6a 01                	push   $0x1
 79c:	52                   	push   %edx
 79d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 7a0:	57                   	push   %edi
 7a1:	e8 fd fd ff ff       	call   5a3 <write>
 7a6:	83 c4 0c             	add    $0xc,%esp
 7a9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7ac:	6a 01                	push   $0x1
 7ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7b1:	52                   	push   %edx
 7b2:	57                   	push   %edi
 7b3:	e8 eb fd ff ff       	call   5a3 <write>
        putc(fd, c);
 7b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bb:	31 d2                	xor    %edx,%edx
 7bd:	eb 8e                	jmp    74d <printf+0x4d>
 7bf:	90                   	nop
        printint(fd, *ap, 16, 0);
 7c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 7cb:	8b 13                	mov    (%ebx),%edx
 7cd:	6a 00                	push   $0x0
 7cf:	89 f8                	mov    %edi,%eax
        ap++;
 7d1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 7d4:	e8 87 fe ff ff       	call   660 <printint>
        ap++;
 7d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 67 ff ff ff       	jmp    74d <printf+0x4d>
 7e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 7f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7f3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7f5:	83 c0 04             	add    $0x4,%eax
 7f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7fb:	85 db                	test   %ebx,%ebx
 7fd:	0f 84 9d 00 00 00    	je     8a0 <printf+0x1a0>
        while(*s != 0){
 803:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 806:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 808:	84 c0                	test   %al,%al
 80a:	0f 84 3d ff ff ff    	je     74d <printf+0x4d>
 810:	8d 55 e7             	lea    -0x19(%ebp),%edx
 813:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 816:	89 de                	mov    %ebx,%esi
 818:	89 d3                	mov    %edx,%ebx
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
 823:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 826:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 829:	6a 01                	push   $0x1
 82b:	53                   	push   %ebx
 82c:	57                   	push   %edi
 82d:	e8 71 fd ff ff       	call   5a3 <write>
        while(*s != 0){
 832:	0f b6 06             	movzbl (%esi),%eax
 835:	83 c4 10             	add    $0x10,%esp
 838:	84 c0                	test   %al,%al
 83a:	75 e4                	jne    820 <printf+0x120>
      state = 0;
 83c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 83f:	31 d2                	xor    %edx,%edx
 841:	e9 07 ff ff ff       	jmp    74d <printf+0x4d>
 846:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 850:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	b9 0a 00 00 00       	mov    $0xa,%ecx
 85b:	8b 13                	mov    (%ebx),%edx
 85d:	6a 01                	push   $0x1
 85f:	e9 6b ff ff ff       	jmp    7cf <printf+0xcf>
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 868:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 86b:	83 ec 04             	sub    $0x4,%esp
 86e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 871:	8b 03                	mov    (%ebx),%eax
        ap++;
 873:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 876:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 879:	6a 01                	push   $0x1
 87b:	52                   	push   %edx
 87c:	57                   	push   %edi
 87d:	e8 21 fd ff ff       	call   5a3 <write>
        ap++;
 882:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 885:	83 c4 10             	add    $0x10,%esp
      state = 0;
 888:	31 d2                	xor    %edx,%edx
 88a:	e9 be fe ff ff       	jmp    74d <printf+0x4d>
 88f:	90                   	nop
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
 893:	88 5d e7             	mov    %bl,-0x19(%ebp)
 896:	8d 55 e7             	lea    -0x19(%ebp),%edx
 899:	6a 01                	push   $0x1
 89b:	e9 11 ff ff ff       	jmp    7b1 <printf+0xb1>
 8a0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 8a5:	bb 72 0a 00 00       	mov    $0xa72,%ebx
 8aa:	e9 61 ff ff ff       	jmp    810 <printf+0x110>
 8af:	90                   	nop

000008b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	a1 08 0e 00 00       	mov    0xe08,%eax
{
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8c8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ca:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8cc:	39 ca                	cmp    %ecx,%edx
 8ce:	73 30                	jae    900 <free+0x50>
 8d0:	39 c1                	cmp    %eax,%ecx
 8d2:	72 04                	jb     8d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d4:	39 c2                	cmp    %eax,%edx
 8d6:	72 f0                	jb     8c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8de:	39 f8                	cmp    %edi,%eax
 8e0:	74 2e                	je     910 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8e5:	8b 42 04             	mov    0x4(%edx),%eax
 8e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8eb:	39 f1                	cmp    %esi,%ecx
 8ed:	74 38                	je     927 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8f1:	5b                   	pop    %ebx
  freep = p;
 8f2:	89 15 08 0e 00 00    	mov    %edx,0xe08
}
 8f8:	5e                   	pop    %esi
 8f9:	5f                   	pop    %edi
 8fa:	5d                   	pop    %ebp
 8fb:	c3                   	ret
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 900:	39 c1                	cmp    %eax,%ecx
 902:	72 d0                	jb     8d4 <free+0x24>
 904:	eb c2                	jmp    8c8 <free+0x18>
 906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 910:	03 70 04             	add    0x4(%eax),%esi
 913:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 916:	8b 02                	mov    (%edx),%eax
 918:	8b 00                	mov    (%eax),%eax
 91a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 91d:	8b 42 04             	mov    0x4(%edx),%eax
 920:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 923:	39 f1                	cmp    %esi,%ecx
 925:	75 c8                	jne    8ef <free+0x3f>
    p->s.size += bp->s.size;
 927:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 92a:	89 15 08 0e 00 00    	mov    %edx,0xe08
    p->s.size += bp->s.size;
 930:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 933:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 936:	89 0a                	mov    %ecx,(%edx)
}
 938:	5b                   	pop    %ebx
 939:	5e                   	pop    %esi
 93a:	5f                   	pop    %edi
 93b:	5d                   	pop    %ebp
 93c:	c3                   	ret
 93d:	8d 76 00             	lea    0x0(%esi),%esi

00000940 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	57                   	push   %edi
 944:	56                   	push   %esi
 945:	53                   	push   %ebx
 946:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 949:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 94c:	8b 15 08 0e 00 00    	mov    0xe08,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 952:	8d 78 07             	lea    0x7(%eax),%edi
 955:	c1 ef 03             	shr    $0x3,%edi
 958:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 95b:	85 d2                	test   %edx,%edx
 95d:	0f 84 8d 00 00 00    	je     9f0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 963:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 965:	8b 48 04             	mov    0x4(%eax),%ecx
 968:	39 f9                	cmp    %edi,%ecx
 96a:	73 64                	jae    9d0 <malloc+0x90>
  if(nu < 4096)
 96c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 971:	39 df                	cmp    %ebx,%edi
 973:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 976:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 97d:	eb 0a                	jmp    989 <malloc+0x49>
 97f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 980:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 982:	8b 48 04             	mov    0x4(%eax),%ecx
 985:	39 f9                	cmp    %edi,%ecx
 987:	73 47                	jae    9d0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 989:	89 c2                	mov    %eax,%edx
 98b:	39 05 08 0e 00 00    	cmp    %eax,0xe08
 991:	75 ed                	jne    980 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 993:	83 ec 0c             	sub    $0xc,%esp
 996:	56                   	push   %esi
 997:	e8 6f fc ff ff       	call   60b <sbrk>
  if(p == (char*)-1)
 99c:	83 c4 10             	add    $0x10,%esp
 99f:	83 f8 ff             	cmp    $0xffffffff,%eax
 9a2:	74 1c                	je     9c0 <malloc+0x80>
  hp->s.size = nu;
 9a4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9a7:	83 ec 0c             	sub    $0xc,%esp
 9aa:	83 c0 08             	add    $0x8,%eax
 9ad:	50                   	push   %eax
 9ae:	e8 fd fe ff ff       	call   8b0 <free>
  return freep;
 9b3:	8b 15 08 0e 00 00    	mov    0xe08,%edx
      if((p = morecore(nunits)) == 0)
 9b9:	83 c4 10             	add    $0x10,%esp
 9bc:	85 d2                	test   %edx,%edx
 9be:	75 c0                	jne    980 <malloc+0x40>
        return 0;
  }
}
 9c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9c3:	31 c0                	xor    %eax,%eax
}
 9c5:	5b                   	pop    %ebx
 9c6:	5e                   	pop    %esi
 9c7:	5f                   	pop    %edi
 9c8:	5d                   	pop    %ebp
 9c9:	c3                   	ret
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9d0:	39 cf                	cmp    %ecx,%edi
 9d2:	74 4c                	je     a20 <malloc+0xe0>
        p->s.size -= nunits;
 9d4:	29 f9                	sub    %edi,%ecx
 9d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9dc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 9df:	89 15 08 0e 00 00    	mov    %edx,0xe08
}
 9e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9e8:	83 c0 08             	add    $0x8,%eax
}
 9eb:	5b                   	pop    %ebx
 9ec:	5e                   	pop    %esi
 9ed:	5f                   	pop    %edi
 9ee:	5d                   	pop    %ebp
 9ef:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 9f0:	c7 05 08 0e 00 00 0c 	movl   $0xe0c,0xe08
 9f7:	0e 00 00 
    base.s.size = 0;
 9fa:	b8 0c 0e 00 00       	mov    $0xe0c,%eax
    base.s.ptr = freep = prevp = &base;
 9ff:	c7 05 0c 0e 00 00 0c 	movl   $0xe0c,0xe0c
 a06:	0e 00 00 
    base.s.size = 0;
 a09:	c7 05 10 0e 00 00 00 	movl   $0x0,0xe10
 a10:	00 00 00 
    if(p->s.size >= nunits){
 a13:	e9 54 ff ff ff       	jmp    96c <malloc+0x2c>
 a18:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 a20:	8b 08                	mov    (%eax),%ecx
 a22:	89 0a                	mov    %ecx,(%edx)
 a24:	eb b9                	jmp    9df <malloc+0x9f>
