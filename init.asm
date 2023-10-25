
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 d8 07 00 00       	push   $0x7d8
  19:	e8 55 03 00 00       	call   373 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 78 03 00 00       	call   3ab <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 6c 03 00 00       	call   3ab <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 e0 07 00 00       	push   $0x7e0
  50:	6a 01                	push   $0x1
  52:	e8 59 04 00 00       	call   4b0 <printf>
    pid = fork();
  57:	e8 cf 02 00 00       	call   32b <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 c6 02 00 00       	call   33b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 1f 08 00 00       	push   $0x81f
  85:	6a 01                	push   $0x1
  87:	e8 24 04 00 00       	call   4b0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 f3 07 00 00       	push   $0x7f3
  98:	6a 01                	push   $0x1
  9a:	e8 11 04 00 00       	call   4b0 <printf>
      exit();
  9f:	e8 8f 02 00 00       	call   333 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 28 0b 00 00       	push   $0xb28
  ab:	68 06 08 00 00       	push   $0x806
  b0:	e8 b6 02 00 00       	call   36b <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 09 08 00 00       	push   $0x809
  bc:	6a 01                	push   $0x1
  be:	e8 ed 03 00 00       	call   4b0 <printf>
      exit();
  c3:	e8 6b 02 00 00       	call   333 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 d8 07 00 00       	push   $0x7d8
  d2:	e8 a4 02 00 00       	call   37b <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 d8 07 00 00       	push   $0x7d8
  e0:	e8 8e 02 00 00       	call   373 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave
 114:	c3                   	ret
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave
 155:	c3                   	ret
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave
 16c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	56                   	push   %esi
 226:	6a 00                	push   $0x0
 228:	e8 1e 01 00 00       	call   34b <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 10                	je     253 <gets+0x43>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 0c                	je     253 <gets+0x43>
  for(i=0; i+1 < max; ){
 247:	89 df                	mov    %ebx,%edi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
 251:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 25a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5f                   	pop    %edi
 260:	5d                   	pop    %ebp
 261:	c3                   	ret
 262:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <stat>:

int
stat(char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	push   0x8(%ebp)
 27d:	e8 f1 00 00 00       	call   373 <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 f4 00 00 00       	call   38b <fstat>
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29a:	89 c6                	mov    %eax,%esi
  close(fd);
 29c:	e8 ba 00 00 00       	call   35b <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
}
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave
 2fb:	c3                   	ret
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	8b 45 10             	mov    0x10(%ebp),%eax
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
  dst = vdst;
 314:	89 d7                	mov    %edx,%edi
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret

0000032b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32b:	b8 01 00 00 00       	mov    $0x1,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <exit>:
SYSCALL(exit)
 333:	b8 02 00 00 00       	mov    $0x2,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <wait>:
SYSCALL(wait)
 33b:	b8 03 00 00 00       	mov    $0x3,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <pipe>:
SYSCALL(pipe)
 343:	b8 04 00 00 00       	mov    $0x4,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <read>:
SYSCALL(read)
 34b:	b8 05 00 00 00       	mov    $0x5,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <write>:
SYSCALL(write)
 353:	b8 10 00 00 00       	mov    $0x10,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <close>:
SYSCALL(close)
 35b:	b8 15 00 00 00       	mov    $0x15,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <kill>:
SYSCALL(kill)
 363:	b8 06 00 00 00       	mov    $0x6,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <exec>:
SYSCALL(exec)
 36b:	b8 07 00 00 00       	mov    $0x7,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <open>:
SYSCALL(open)
 373:	b8 0f 00 00 00       	mov    $0xf,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <mknod>:
SYSCALL(mknod)
 37b:	b8 11 00 00 00       	mov    $0x11,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <unlink>:
SYSCALL(unlink)
 383:	b8 12 00 00 00       	mov    $0x12,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <fstat>:
SYSCALL(fstat)
 38b:	b8 08 00 00 00       	mov    $0x8,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <link>:
SYSCALL(link)
 393:	b8 13 00 00 00       	mov    $0x13,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <mkdir>:
SYSCALL(mkdir)
 39b:	b8 14 00 00 00       	mov    $0x14,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <chdir>:
SYSCALL(chdir)
 3a3:	b8 09 00 00 00       	mov    $0x9,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <dup>:
SYSCALL(dup)
 3ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <getpid>:
SYSCALL(getpid)
 3b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <sbrk>:
SYSCALL(sbrk)
 3bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <sleep>:
SYSCALL(sleep)
 3c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <uptime>:
SYSCALL(uptime)
 3cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <shutdown>:
SYSCALL(shutdown)
 3d3:	b8 16 00 00 00       	mov    $0x16,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <fork_winner>:
SYSCALL(fork_winner)
 3db:	b8 18 00 00 00       	mov    $0x18,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <enable_sched_trace>:
SYSCALL(enable_sched_trace)
 3e3:	b8 17 00 00 00       	mov    $0x17,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <set_sched>:
SYSCALL(set_sched)
 3eb:	b8 19 00 00 00       	mov    $0x19,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <tickets_owned>:
SYSCALL(tickets_owned)
 3f3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret

000003fb <transfer_tickets>:
 3fb:	b8 1b 00 00 00       	mov    $0x1b,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret
 403:	66 90                	xchg   %ax,%ax
 405:	66 90                	xchg   %ax,%ax
 407:	66 90                	xchg   %ax,%ax
 409:	66 90                	xchg   %ax,%ax
 40b:	66 90                	xchg   %ax,%ax
 40d:	66 90                	xchg   %ax,%ax
 40f:	90                   	nop

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 418:	89 d1                	mov    %edx,%ecx
{
 41a:	83 ec 3c             	sub    $0x3c,%esp
 41d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 420:	85 d2                	test   %edx,%edx
 422:	0f 89 80 00 00 00    	jns    4a8 <printint+0x98>
 428:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 42c:	74 7a                	je     4a8 <printint+0x98>
    x = -xx;
 42e:	f7 d9                	neg    %ecx
    neg = 1;
 430:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 435:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 438:	31 f6                	xor    %esi,%esi
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 440:	89 c8                	mov    %ecx,%eax
 442:	31 d2                	xor    %edx,%edx
 444:	89 f7                	mov    %esi,%edi
 446:	f7 f3                	div    %ebx
 448:	8d 76 01             	lea    0x1(%esi),%esi
 44b:	0f b6 92 88 08 00 00 	movzbl 0x888(%edx),%edx
 452:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 456:	89 ca                	mov    %ecx,%edx
 458:	89 c1                	mov    %eax,%ecx
 45a:	39 da                	cmp    %ebx,%edx
 45c:	73 e2                	jae    440 <printint+0x30>
  if(neg)
 45e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 461:	85 c0                	test   %eax,%eax
 463:	74 07                	je     46c <printint+0x5c>
    buf[i++] = '-';
 465:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 46a:	89 f7                	mov    %esi,%edi
 46c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 46f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 472:	01 df                	add    %ebx,%edi
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 478:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	88 45 d7             	mov    %al,-0x29(%ebp)
 481:	8d 45 d7             	lea    -0x29(%ebp),%eax
 484:	6a 01                	push   $0x1
 486:	50                   	push   %eax
 487:	56                   	push   %esi
 488:	e8 c6 fe ff ff       	call   353 <write>
  while(--i >= 0)
 48d:	89 f8                	mov    %edi,%eax
 48f:	83 c4 10             	add    $0x10,%esp
 492:	83 ef 01             	sub    $0x1,%edi
 495:	39 d8                	cmp    %ebx,%eax
 497:	75 df                	jne    478 <printint+0x68>
}
 499:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49c:	5b                   	pop    %ebx
 49d:	5e                   	pop    %esi
 49e:	5f                   	pop    %edi
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4a8:	31 c0                	xor    %eax,%eax
 4aa:	eb 89                	jmp    435 <printint+0x25>
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 4bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 4bf:	0f b6 1e             	movzbl (%esi),%ebx
 4c2:	83 c6 01             	add    $0x1,%esi
 4c5:	84 db                	test   %bl,%bl
 4c7:	74 67                	je     530 <printf+0x80>
 4c9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4cc:	31 d2                	xor    %edx,%edx
 4ce:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 4d1:	eb 34                	jmp    507 <printf+0x57>
 4d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d7:	90                   	nop
 4d8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4db:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4e0:	83 f8 25             	cmp    $0x25,%eax
 4e3:	74 18                	je     4fd <printf+0x4d>
  write(fd, &c, 1);
 4e5:	83 ec 04             	sub    $0x4,%esp
 4e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4eb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4ee:	6a 01                	push   $0x1
 4f0:	50                   	push   %eax
 4f1:	57                   	push   %edi
 4f2:	e8 5c fe ff ff       	call   353 <write>
 4f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4fa:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4fd:	0f b6 1e             	movzbl (%esi),%ebx
 500:	83 c6 01             	add    $0x1,%esi
 503:	84 db                	test   %bl,%bl
 505:	74 29                	je     530 <printf+0x80>
    c = fmt[i] & 0xff;
 507:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 50a:	85 d2                	test   %edx,%edx
 50c:	74 ca                	je     4d8 <printf+0x28>
      }
    } else if(state == '%'){
 50e:	83 fa 25             	cmp    $0x25,%edx
 511:	75 ea                	jne    4fd <printf+0x4d>
      if(c == 'd'){
 513:	83 f8 25             	cmp    $0x25,%eax
 516:	0f 84 24 01 00 00    	je     640 <printf+0x190>
 51c:	83 e8 63             	sub    $0x63,%eax
 51f:	83 f8 15             	cmp    $0x15,%eax
 522:	77 1c                	ja     540 <printf+0x90>
 524:	ff 24 85 30 08 00 00 	jmp    *0x830(,%eax,4)
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 530:	8d 65 f4             	lea    -0xc(%ebp),%esp
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5f                   	pop    %edi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	8d 55 e7             	lea    -0x19(%ebp),%edx
 546:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 54a:	6a 01                	push   $0x1
 54c:	52                   	push   %edx
 54d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 550:	57                   	push   %edi
 551:	e8 fd fd ff ff       	call   353 <write>
 556:	83 c4 0c             	add    $0xc,%esp
 559:	88 5d e7             	mov    %bl,-0x19(%ebp)
 55c:	6a 01                	push   $0x1
 55e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 561:	52                   	push   %edx
 562:	57                   	push   %edi
 563:	e8 eb fd ff ff       	call   353 <write>
        putc(fd, c);
 568:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56b:	31 d2                	xor    %edx,%edx
 56d:	eb 8e                	jmp    4fd <printf+0x4d>
 56f:	90                   	nop
        printint(fd, *ap, 16, 0);
 570:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 573:	83 ec 0c             	sub    $0xc,%esp
 576:	b9 10 00 00 00       	mov    $0x10,%ecx
 57b:	8b 13                	mov    (%ebx),%edx
 57d:	6a 00                	push   $0x0
 57f:	89 f8                	mov    %edi,%eax
        ap++;
 581:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 584:	e8 87 fe ff ff       	call   410 <printint>
        ap++;
 589:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 58c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58f:	31 d2                	xor    %edx,%edx
 591:	e9 67 ff ff ff       	jmp    4fd <printf+0x4d>
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 5a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5a5:	83 c0 04             	add    $0x4,%eax
 5a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5ab:	85 db                	test   %ebx,%ebx
 5ad:	0f 84 9d 00 00 00    	je     650 <printf+0x1a0>
        while(*s != 0){
 5b3:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5b6:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5b8:	84 c0                	test   %al,%al
 5ba:	0f 84 3d ff ff ff    	je     4fd <printf+0x4d>
 5c0:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5c3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5c6:	89 de                	mov    %ebx,%esi
 5c8:	89 d3                	mov    %edx,%ebx
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 5d6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5d9:	6a 01                	push   $0x1
 5db:	53                   	push   %ebx
 5dc:	57                   	push   %edi
 5dd:	e8 71 fd ff ff       	call   353 <write>
        while(*s != 0){
 5e2:	0f b6 06             	movzbl (%esi),%eax
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	84 c0                	test   %al,%al
 5ea:	75 e4                	jne    5d0 <printf+0x120>
      state = 0;
 5ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 5ef:	31 d2                	xor    %edx,%edx
 5f1:	e9 07 ff ff ff       	jmp    4fd <printf+0x4d>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 600:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 603:	83 ec 0c             	sub    $0xc,%esp
 606:	b9 0a 00 00 00       	mov    $0xa,%ecx
 60b:	8b 13                	mov    (%ebx),%edx
 60d:	6a 01                	push   $0x1
 60f:	e9 6b ff ff ff       	jmp    57f <printf+0xcf>
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 618:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 621:	8b 03                	mov    (%ebx),%eax
        ap++;
 623:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 626:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 629:	6a 01                	push   $0x1
 62b:	52                   	push   %edx
 62c:	57                   	push   %edi
 62d:	e8 21 fd ff ff       	call   353 <write>
        ap++;
 632:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 635:	83 c4 10             	add    $0x10,%esp
      state = 0;
 638:	31 d2                	xor    %edx,%edx
 63a:	e9 be fe ff ff       	jmp    4fd <printf+0x4d>
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	88 5d e7             	mov    %bl,-0x19(%ebp)
 646:	8d 55 e7             	lea    -0x19(%ebp),%edx
 649:	6a 01                	push   $0x1
 64b:	e9 11 ff ff ff       	jmp    561 <printf+0xb1>
 650:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 655:	bb 28 08 00 00       	mov    $0x828,%ebx
 65a:	e9 61 ff ff ff       	jmp    5c0 <printf+0x110>
 65f:	90                   	nop

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 30 0b 00 00       	mov    0xb30,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 66e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67c:	39 ca                	cmp    %ecx,%edx
 67e:	73 30                	jae    6b0 <free+0x50>
 680:	39 c1                	cmp    %eax,%ecx
 682:	72 04                	jb     688 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	39 c2                	cmp    %eax,%edx
 686:	72 f0                	jb     678 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	74 2e                	je     6c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 692:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 695:	8b 42 04             	mov    0x4(%edx),%eax
 698:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 69b:	39 f1                	cmp    %esi,%ecx
 69d:	74 38                	je     6d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 69f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6a1:	5b                   	pop    %ebx
  freep = p;
 6a2:	89 15 30 0b 00 00    	mov    %edx,0xb30
}
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	39 c1                	cmp    %eax,%ecx
 6b2:	72 d0                	jb     684 <free+0x24>
 6b4:	eb c2                	jmp    678 <free+0x18>
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 6c0:	03 70 04             	add    0x4(%eax),%esi
 6c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c6:	8b 02                	mov    (%edx),%eax
 6c8:	8b 00                	mov    (%eax),%eax
 6ca:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cd:	8b 42 04             	mov    0x4(%edx),%eax
 6d0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6d3:	39 f1                	cmp    %esi,%ecx
 6d5:	75 c8                	jne    69f <free+0x3f>
    p->s.size += bp->s.size;
 6d7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6da:	89 15 30 0b 00 00    	mov    %edx,0xb30
    p->s.size += bp->s.size;
 6e0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6e3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6e6:	89 0a                	mov    %ecx,(%edx)
}
 6e8:	5b                   	pop    %ebx
 6e9:	5e                   	pop    %esi
 6ea:	5f                   	pop    %edi
 6eb:	5d                   	pop    %ebp
 6ec:	c3                   	ret
 6ed:	8d 76 00             	lea    0x0(%esi),%esi

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 15 30 0b 00 00    	mov    0xb30,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 78 07             	lea    0x7(%eax),%edi
 705:	c1 ef 03             	shr    $0x3,%edi
 708:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 70b:	85 d2                	test   %edx,%edx
 70d:	0f 84 8d 00 00 00    	je     7a0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 713:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 715:	8b 48 04             	mov    0x4(%eax),%ecx
 718:	39 f9                	cmp    %edi,%ecx
 71a:	73 64                	jae    780 <malloc+0x90>
  if(nu < 4096)
 71c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 721:	39 df                	cmp    %ebx,%edi
 723:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 726:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 72d:	eb 0a                	jmp    739 <malloc+0x49>
 72f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 730:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 732:	8b 48 04             	mov    0x4(%eax),%ecx
 735:	39 f9                	cmp    %edi,%ecx
 737:	73 47                	jae    780 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 739:	89 c2                	mov    %eax,%edx
 73b:	39 05 30 0b 00 00    	cmp    %eax,0xb30
 741:	75 ed                	jne    730 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 743:	83 ec 0c             	sub    $0xc,%esp
 746:	56                   	push   %esi
 747:	e8 6f fc ff ff       	call   3bb <sbrk>
  if(p == (char*)-1)
 74c:	83 c4 10             	add    $0x10,%esp
 74f:	83 f8 ff             	cmp    $0xffffffff,%eax
 752:	74 1c                	je     770 <malloc+0x80>
  hp->s.size = nu;
 754:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 757:	83 ec 0c             	sub    $0xc,%esp
 75a:	83 c0 08             	add    $0x8,%eax
 75d:	50                   	push   %eax
 75e:	e8 fd fe ff ff       	call   660 <free>
  return freep;
 763:	8b 15 30 0b 00 00    	mov    0xb30,%edx
      if((p = morecore(nunits)) == 0)
 769:	83 c4 10             	add    $0x10,%esp
 76c:	85 d2                	test   %edx,%edx
 76e:	75 c0                	jne    730 <malloc+0x40>
        return 0;
  }
}
 770:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 773:	31 c0                	xor    %eax,%eax
}
 775:	5b                   	pop    %ebx
 776:	5e                   	pop    %esi
 777:	5f                   	pop    %edi
 778:	5d                   	pop    %ebp
 779:	c3                   	ret
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 780:	39 cf                	cmp    %ecx,%edi
 782:	74 4c                	je     7d0 <malloc+0xe0>
        p->s.size -= nunits;
 784:	29 f9                	sub    %edi,%ecx
 786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 78c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 78f:	89 15 30 0b 00 00    	mov    %edx,0xb30
}
 795:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 798:	83 c0 08             	add    $0x8,%eax
}
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 7a0:	c7 05 30 0b 00 00 34 	movl   $0xb34,0xb30
 7a7:	0b 00 00 
    base.s.size = 0;
 7aa:	b8 34 0b 00 00       	mov    $0xb34,%eax
    base.s.ptr = freep = prevp = &base;
 7af:	c7 05 34 0b 00 00 34 	movl   $0xb34,0xb34
 7b6:	0b 00 00 
    base.s.size = 0;
 7b9:	c7 05 38 0b 00 00 00 	movl   $0x0,0xb38
 7c0:	00 00 00 
    if(p->s.size >= nunits){
 7c3:	e9 54 ff ff ff       	jmp    71c <malloc+0x2c>
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 7d0:	8b 08                	mov    (%eax),%ecx
 7d2:	89 0a                	mov    %ecx,(%edx)
 7d4:	eb b9                	jmp    78f <malloc+0x9f>
