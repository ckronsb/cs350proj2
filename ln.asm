
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  if(argc != 3){
   f:	83 39 03             	cmpl   $0x3,(%ecx)
{
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 48 07 00 00       	push   $0x748
  1e:	6a 02                	push   $0x2
  20:	e8 fb 03 00 00       	call   420 <printf>
    exit();
  25:	e8 79 02 00 00       	call   2a3 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	push   0x8(%ebx)
  2f:	ff 73 04             	push   0x4(%ebx)
  32:	e8 cc 02 00 00       	call   303 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 60 02 00 00       	call   2a3 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	push   0x8(%ebx)
  46:	ff 73 04             	push   0x4(%ebx)
  49:	68 5b 07 00 00       	push   $0x75b
  4e:	6a 02                	push   $0x2
  50:	e8 cb 03 00 00       	call   420 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave
  84:	c3                   	ret
  85:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 17                	jne    b8 <strcmp+0x28>
  a1:	eb 3a                	jmp    dd <strcmp+0x4d>
  a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a7:	90                   	nop
  a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  ac:	83 c2 01             	add    $0x1,%edx
  af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  b2:	84 c0                	test   %al,%al
  b4:	74 1a                	je     d0 <strcmp+0x40>
    p++, q++;
  b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  b8:	0f b6 19             	movzbl (%ecx),%ebx
  bb:	38 c3                	cmp    %al,%bl
  bd:	74 e9                	je     a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  bf:	29 d8                	sub    %ebx,%eax
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave
  c5:	c3                   	ret
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  d4:	31 c0                	xor    %eax,%eax
  d6:	29 d8                	sub    %ebx,%eax
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave
  dc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  dd:	0f b6 19             	movzbl (%ecx),%ebx
  e0:	31 c0                	xor    %eax,%eax
  e2:	eb db                	jmp    bf <strcmp+0x2f>
  e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 3a 00             	cmpb   $0x0,(%edx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 c0                	xor    %eax,%eax
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c0 01             	add    $0x1,%eax
 103:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 107:	89 c1                	mov    %eax,%ecx
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	89 c8                	mov    %ecx,%eax
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret
 10f:	90                   	nop
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	8b 7d fc             	mov    -0x4(%ebp),%edi
 135:	89 d0                	mov    %edx,%eax
 137:	c9                   	leave
 138:	c3                   	ret
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 157:	90                   	nop
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	83 c0 01             	add    $0x1,%eax
 15f:	84 d2                	test   %dl,%dl
 161:	74 0d                	je     170 <strchr+0x30>
    if(*s == c)
 163:	38 d1                	cmp    %dl,%cl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 185:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 188:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 189:	31 db                	xor    %ebx,%ebx
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 27                	jmp    1b7 <gets+0x37>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	56                   	push   %esi
 196:	6a 00                	push   $0x0
 198:	e8 1e 01 00 00       	call   2bb <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1af:	3c 0a                	cmp    $0xa,%al
 1b1:	74 10                	je     1c3 <gets+0x43>
 1b3:	3c 0d                	cmp    $0xd,%al
 1b5:	74 0c                	je     1c3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1b7:	89 df                	mov    %ebx,%edi
 1b9:	83 c3 01             	add    $0x1,%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
 1c1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cd:	5b                   	pop    %ebx
 1ce:	5e                   	pop    %esi
 1cf:	5f                   	pop    %edi
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret
 1d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 f1 00 00 00       	call   2e3 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f4 00 00 00       	call   2fb <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 ba 00 00 00       	call   2cb <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave
 26b:	c3                   	ret
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	8b 45 10             	mov    0x10(%ebp),%eax
 278:	8b 55 08             	mov    0x8(%ebp),%edx
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	7e 13                	jle    295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 f8                	cmp    %edi,%eax
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
}
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret

0000029b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29b:	b8 01 00 00 00       	mov    $0x1,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret

000002a3 <exit>:
SYSCALL(exit)
 2a3:	b8 02 00 00 00       	mov    $0x2,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret

000002ab <wait>:
SYSCALL(wait)
 2ab:	b8 03 00 00 00       	mov    $0x3,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <pipe>:
SYSCALL(pipe)
 2b3:	b8 04 00 00 00       	mov    $0x4,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <read>:
SYSCALL(read)
 2bb:	b8 05 00 00 00       	mov    $0x5,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <write>:
SYSCALL(write)
 2c3:	b8 10 00 00 00       	mov    $0x10,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <close>:
SYSCALL(close)
 2cb:	b8 15 00 00 00       	mov    $0x15,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <kill>:
SYSCALL(kill)
 2d3:	b8 06 00 00 00       	mov    $0x6,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <exec>:
SYSCALL(exec)
 2db:	b8 07 00 00 00       	mov    $0x7,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <open>:
SYSCALL(open)
 2e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <mknod>:
SYSCALL(mknod)
 2eb:	b8 11 00 00 00       	mov    $0x11,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <unlink>:
SYSCALL(unlink)
 2f3:	b8 12 00 00 00       	mov    $0x12,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <fstat>:
SYSCALL(fstat)
 2fb:	b8 08 00 00 00       	mov    $0x8,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <link>:
SYSCALL(link)
 303:	b8 13 00 00 00       	mov    $0x13,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <mkdir>:
SYSCALL(mkdir)
 30b:	b8 14 00 00 00       	mov    $0x14,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <chdir>:
SYSCALL(chdir)
 313:	b8 09 00 00 00       	mov    $0x9,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <dup>:
SYSCALL(dup)
 31b:	b8 0a 00 00 00       	mov    $0xa,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <getpid>:
SYSCALL(getpid)
 323:	b8 0b 00 00 00       	mov    $0xb,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <shutdown>:
SYSCALL(shutdown)
 343:	b8 16 00 00 00       	mov    $0x16,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <fork_winner>:
SYSCALL(fork_winner)
 34b:	b8 18 00 00 00       	mov    $0x18,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <enable_sched_trace>:
SYSCALL(enable_sched_trace)
 353:	b8 17 00 00 00       	mov    $0x17,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <set_sched>:
SYSCALL(set_sched)
 35b:	b8 19 00 00 00       	mov    $0x19,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <tickets_owned>:
SYSCALL(tickets_owned)
 363:	b8 1a 00 00 00       	mov    $0x1a,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <transfer_tickets>:
 36b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret
 373:	66 90                	xchg   %ax,%ax
 375:	66 90                	xchg   %ax,%ax
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 388:	89 d1                	mov    %edx,%ecx
{
 38a:	83 ec 3c             	sub    $0x3c,%esp
 38d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 390:	85 d2                	test   %edx,%edx
 392:	0f 89 80 00 00 00    	jns    418 <printint+0x98>
 398:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39c:	74 7a                	je     418 <printint+0x98>
    x = -xx;
 39e:	f7 d9                	neg    %ecx
    neg = 1;
 3a0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 3a5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3a8:	31 f6                	xor    %esi,%esi
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 c8                	mov    %ecx,%eax
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	89 f7                	mov    %esi,%edi
 3b6:	f7 f3                	div    %ebx
 3b8:	8d 76 01             	lea    0x1(%esi),%esi
 3bb:	0f b6 92 d0 07 00 00 	movzbl 0x7d0(%edx),%edx
 3c2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3c6:	89 ca                	mov    %ecx,%edx
 3c8:	89 c1                	mov    %eax,%ecx
 3ca:	39 da                	cmp    %ebx,%edx
 3cc:	73 e2                	jae    3b0 <printint+0x30>
  if(neg)
 3ce:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3d1:	85 c0                	test   %eax,%eax
 3d3:	74 07                	je     3dc <printint+0x5c>
    buf[i++] = '-';
 3d5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 3da:	89 f7                	mov    %esi,%edi
 3dc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3df:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3e2:	01 df                	add    %ebx,%edi
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 3e8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3eb:	83 ec 04             	sub    $0x4,%esp
 3ee:	88 45 d7             	mov    %al,-0x29(%ebp)
 3f1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3f4:	6a 01                	push   $0x1
 3f6:	50                   	push   %eax
 3f7:	56                   	push   %esi
 3f8:	e8 c6 fe ff ff       	call   2c3 <write>
  while(--i >= 0)
 3fd:	89 f8                	mov    %edi,%eax
 3ff:	83 c4 10             	add    $0x10,%esp
 402:	83 ef 01             	sub    $0x1,%edi
 405:	39 d8                	cmp    %ebx,%eax
 407:	75 df                	jne    3e8 <printint+0x68>
}
 409:	8d 65 f4             	lea    -0xc(%ebp),%esp
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5f                   	pop    %edi
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 418:	31 c0                	xor    %eax,%eax
 41a:	eb 89                	jmp    3a5 <printint+0x25>
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 42c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 42f:	0f b6 1e             	movzbl (%esi),%ebx
 432:	83 c6 01             	add    $0x1,%esi
 435:	84 db                	test   %bl,%bl
 437:	74 67                	je     4a0 <printf+0x80>
 439:	8d 4d 10             	lea    0x10(%ebp),%ecx
 43c:	31 d2                	xor    %edx,%edx
 43e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 441:	eb 34                	jmp    477 <printf+0x57>
 443:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 447:	90                   	nop
 448:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 44b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 450:	83 f8 25             	cmp    $0x25,%eax
 453:	74 18                	je     46d <printf+0x4d>
  write(fd, &c, 1);
 455:	83 ec 04             	sub    $0x4,%esp
 458:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 45e:	6a 01                	push   $0x1
 460:	50                   	push   %eax
 461:	57                   	push   %edi
 462:	e8 5c fe ff ff       	call   2c3 <write>
 467:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 46a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 46d:	0f b6 1e             	movzbl (%esi),%ebx
 470:	83 c6 01             	add    $0x1,%esi
 473:	84 db                	test   %bl,%bl
 475:	74 29                	je     4a0 <printf+0x80>
    c = fmt[i] & 0xff;
 477:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 47a:	85 d2                	test   %edx,%edx
 47c:	74 ca                	je     448 <printf+0x28>
      }
    } else if(state == '%'){
 47e:	83 fa 25             	cmp    $0x25,%edx
 481:	75 ea                	jne    46d <printf+0x4d>
      if(c == 'd'){
 483:	83 f8 25             	cmp    $0x25,%eax
 486:	0f 84 24 01 00 00    	je     5b0 <printf+0x190>
 48c:	83 e8 63             	sub    $0x63,%eax
 48f:	83 f8 15             	cmp    $0x15,%eax
 492:	77 1c                	ja     4b0 <printf+0x90>
 494:	ff 24 85 78 07 00 00 	jmp    *0x778(,%eax,4)
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
  write(fd, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	8d 55 e7             	lea    -0x19(%ebp),%edx
 4b6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ba:	6a 01                	push   $0x1
 4bc:	52                   	push   %edx
 4bd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4c0:	57                   	push   %edi
 4c1:	e8 fd fd ff ff       	call   2c3 <write>
 4c6:	83 c4 0c             	add    $0xc,%esp
 4c9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4d1:	52                   	push   %edx
 4d2:	57                   	push   %edi
 4d3:	e8 eb fd ff ff       	call   2c3 <write>
        putc(fd, c);
 4d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4db:	31 d2                	xor    %edx,%edx
 4dd:	eb 8e                	jmp    46d <printf+0x4d>
 4df:	90                   	nop
        printint(fd, *ap, 16, 0);
 4e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4e3:	83 ec 0c             	sub    $0xc,%esp
 4e6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4eb:	8b 13                	mov    (%ebx),%edx
 4ed:	6a 00                	push   $0x0
 4ef:	89 f8                	mov    %edi,%eax
        ap++;
 4f1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 4f4:	e8 87 fe ff ff       	call   380 <printint>
        ap++;
 4f9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ff:	31 d2                	xor    %edx,%edx
 501:	e9 67 ff ff ff       	jmp    46d <printf+0x4d>
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 510:	8b 45 d0             	mov    -0x30(%ebp),%eax
 513:	8b 18                	mov    (%eax),%ebx
        ap++;
 515:	83 c0 04             	add    $0x4,%eax
 518:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 51b:	85 db                	test   %ebx,%ebx
 51d:	0f 84 9d 00 00 00    	je     5c0 <printf+0x1a0>
        while(*s != 0){
 523:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 526:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 528:	84 c0                	test   %al,%al
 52a:	0f 84 3d ff ff ff    	je     46d <printf+0x4d>
 530:	8d 55 e7             	lea    -0x19(%ebp),%edx
 533:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 536:	89 de                	mov    %ebx,%esi
 538:	89 d3                	mov    %edx,%ebx
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 546:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 549:	6a 01                	push   $0x1
 54b:	53                   	push   %ebx
 54c:	57                   	push   %edi
 54d:	e8 71 fd ff ff       	call   2c3 <write>
        while(*s != 0){
 552:	0f b6 06             	movzbl (%esi),%eax
 555:	83 c4 10             	add    $0x10,%esp
 558:	84 c0                	test   %al,%al
 55a:	75 e4                	jne    540 <printf+0x120>
      state = 0;
 55c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 55f:	31 d2                	xor    %edx,%edx
 561:	e9 07 ff ff ff       	jmp    46d <printf+0x4d>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 570:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 573:	83 ec 0c             	sub    $0xc,%esp
 576:	b9 0a 00 00 00       	mov    $0xa,%ecx
 57b:	8b 13                	mov    (%ebx),%edx
 57d:	6a 01                	push   $0x1
 57f:	e9 6b ff ff ff       	jmp    4ef <printf+0xcf>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 588:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 591:	8b 03                	mov    (%ebx),%eax
        ap++;
 593:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 596:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 599:	6a 01                	push   $0x1
 59b:	52                   	push   %edx
 59c:	57                   	push   %edi
 59d:	e8 21 fd ff ff       	call   2c3 <write>
        ap++;
 5a2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5a5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a8:	31 d2                	xor    %edx,%edx
 5aa:	e9 be fe ff ff       	jmp    46d <printf+0x4d>
 5af:	90                   	nop
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5b6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5b9:	6a 01                	push   $0x1
 5bb:	e9 11 ff ff ff       	jmp    4d1 <printf+0xb1>
 5c0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5c5:	bb 6f 07 00 00       	mov    $0x76f,%ebx
 5ca:	e9 61 ff ff ff       	jmp    530 <printf+0x110>
 5cf:	90                   	nop

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	a1 70 0a 00 00       	mov    0xa70,%eax
{
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ea:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ec:	39 ca                	cmp    %ecx,%edx
 5ee:	73 30                	jae    620 <free+0x50>
 5f0:	39 c1                	cmp    %eax,%ecx
 5f2:	72 04                	jb     5f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f4:	39 c2                	cmp    %eax,%edx
 5f6:	72 f0                	jb     5e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 f8                	cmp    %edi,%eax
 600:	74 2e                	je     630 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 602:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 605:	8b 42 04             	mov    0x4(%edx),%eax
 608:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 60b:	39 f1                	cmp    %esi,%ecx
 60d:	74 38                	je     647 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 60f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 611:	5b                   	pop    %ebx
  freep = p;
 612:	89 15 70 0a 00 00    	mov    %edx,0xa70
}
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 620:	39 c1                	cmp    %eax,%ecx
 622:	72 d0                	jb     5f4 <free+0x24>
 624:	eb c2                	jmp    5e8 <free+0x18>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 630:	03 70 04             	add    0x4(%eax),%esi
 633:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 636:	8b 02                	mov    (%edx),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 63d:	8b 42 04             	mov    0x4(%edx),%eax
 640:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 643:	39 f1                	cmp    %esi,%ecx
 645:	75 c8                	jne    60f <free+0x3f>
    p->s.size += bp->s.size;
 647:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 64a:	89 15 70 0a 00 00    	mov    %edx,0xa70
    p->s.size += bp->s.size;
 650:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 653:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 656:	89 0a                	mov    %ecx,(%edx)
}
 658:	5b                   	pop    %ebx
 659:	5e                   	pop    %esi
 65a:	5f                   	pop    %edi
 65b:	5d                   	pop    %ebp
 65c:	c3                   	ret
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 66c:	8b 15 70 0a 00 00    	mov    0xa70,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 672:	8d 78 07             	lea    0x7(%eax),%edi
 675:	c1 ef 03             	shr    $0x3,%edi
 678:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 67b:	85 d2                	test   %edx,%edx
 67d:	0f 84 8d 00 00 00    	je     710 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 683:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 685:	8b 48 04             	mov    0x4(%eax),%ecx
 688:	39 f9                	cmp    %edi,%ecx
 68a:	73 64                	jae    6f0 <malloc+0x90>
  if(nu < 4096)
 68c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 691:	39 df                	cmp    %ebx,%edi
 693:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 696:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 69d:	eb 0a                	jmp    6a9 <malloc+0x49>
 69f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6a2:	8b 48 04             	mov    0x4(%eax),%ecx
 6a5:	39 f9                	cmp    %edi,%ecx
 6a7:	73 47                	jae    6f0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a9:	89 c2                	mov    %eax,%edx
 6ab:	39 05 70 0a 00 00    	cmp    %eax,0xa70
 6b1:	75 ed                	jne    6a0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 6b3:	83 ec 0c             	sub    $0xc,%esp
 6b6:	56                   	push   %esi
 6b7:	e8 6f fc ff ff       	call   32b <sbrk>
  if(p == (char*)-1)
 6bc:	83 c4 10             	add    $0x10,%esp
 6bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c2:	74 1c                	je     6e0 <malloc+0x80>
  hp->s.size = nu;
 6c4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c7:	83 ec 0c             	sub    $0xc,%esp
 6ca:	83 c0 08             	add    $0x8,%eax
 6cd:	50                   	push   %eax
 6ce:	e8 fd fe ff ff       	call   5d0 <free>
  return freep;
 6d3:	8b 15 70 0a 00 00    	mov    0xa70,%edx
      if((p = morecore(nunits)) == 0)
 6d9:	83 c4 10             	add    $0x10,%esp
 6dc:	85 d2                	test   %edx,%edx
 6de:	75 c0                	jne    6a0 <malloc+0x40>
        return 0;
  }
}
 6e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6e3:	31 c0                	xor    %eax,%eax
}
 6e5:	5b                   	pop    %ebx
 6e6:	5e                   	pop    %esi
 6e7:	5f                   	pop    %edi
 6e8:	5d                   	pop    %ebp
 6e9:	c3                   	ret
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6f0:	39 cf                	cmp    %ecx,%edi
 6f2:	74 4c                	je     740 <malloc+0xe0>
        p->s.size -= nunits;
 6f4:	29 f9                	sub    %edi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6fc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6ff:	89 15 70 0a 00 00    	mov    %edx,0xa70
}
 705:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 708:	83 c0 08             	add    $0x8,%eax
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 70 0a 00 00 74 	movl   $0xa74,0xa70
 717:	0a 00 00 
    base.s.size = 0;
 71a:	b8 74 0a 00 00       	mov    $0xa74,%eax
    base.s.ptr = freep = prevp = &base;
 71f:	c7 05 74 0a 00 00 74 	movl   $0xa74,0xa74
 726:	0a 00 00 
    base.s.size = 0;
 729:	c7 05 78 0a 00 00 00 	movl   $0x0,0xa78
 730:	00 00 00 
    if(p->s.size >= nunits){
 733:	e9 54 ff ff ff       	jmp    68c <malloc+0x2c>
 738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b9                	jmp    6ff <malloc+0x9f>
