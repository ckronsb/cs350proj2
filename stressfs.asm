
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	push   -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  2b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  32:	74 72 65 
  35:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  3c:	73 66 73 
  printf(1, "stressfs starting\n");
  3f:	68 08 08 00 00       	push   $0x808
  44:	6a 01                	push   $0x1
  46:	e8 95 04 00 00       	call   4e0 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 85 01 00 00       	call   1e0 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 f8 02 00 00       	call   35b <fork>
  63:	85 c0                	test   %eax,%eax
  65:	7f 08                	jg     6f <main+0x6f>
  for(i = 0; i < 4; i++)
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	83 fb 04             	cmp    $0x4,%ebx
  6d:	75 ef                	jne    5e <main+0x5e>
      break;

  printf(1, "write %d\n", i);
  6f:	83 ec 04             	sub    $0x4,%esp
  72:	53                   	push   %ebx
  73:	68 1b 08 00 00       	push   $0x81b
  78:	6a 01                	push   $0x1
  7a:	e8 61 04 00 00       	call   4e0 <printf>

  path[8] += i;
  7f:	00 9d e6 fd ff ff    	add    %bl,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  85:	5f                   	pop    %edi
  86:	bb 14 00 00 00       	mov    $0x14,%ebx
  8b:	58                   	pop    %eax
  8c:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  92:	68 02 02 00 00       	push   $0x202
  97:	50                   	push   %eax
  98:	e8 06 03 00 00       	call   3a3 <open>
  9d:	83 c4 10             	add    $0x10,%esp
  a0:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  a8:	83 ec 04             	sub    $0x4,%esp
  ab:	68 00 02 00 00       	push   $0x200
  b0:	56                   	push   %esi
  b1:	57                   	push   %edi
  b2:	e8 cc 02 00 00       	call   383 <write>
  for(i = 0; i < 20; i++)
  b7:	83 c4 10             	add    $0x10,%esp
  ba:	83 eb 01             	sub    $0x1,%ebx
  bd:	75 e9                	jne    a8 <main+0xa8>
  close(fd);
  bf:	83 ec 0c             	sub    $0xc,%esp
  c2:	57                   	push   %edi
  c3:	e8 c3 02 00 00       	call   38b <close>

  printf(1, "read\n");
  c8:	58                   	pop    %eax
  c9:	5a                   	pop    %edx
  ca:	68 25 08 00 00       	push   $0x825
  cf:	6a 01                	push   $0x1
  d1:	e8 0a 04 00 00       	call   4e0 <printf>

  fd = open(path, O_RDONLY);
  d6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  dc:	59                   	pop    %ecx
  dd:	5b                   	pop    %ebx
  de:	6a 00                	push   $0x0
  e0:	bb 14 00 00 00       	mov    $0x14,%ebx
  e5:	50                   	push   %eax
  e6:	e8 b8 02 00 00       	call   3a3 <open>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  f0:	83 ec 04             	sub    $0x4,%esp
  f3:	68 00 02 00 00       	push   $0x200
  f8:	56                   	push   %esi
  f9:	57                   	push   %edi
  fa:	e8 7c 02 00 00       	call   37b <read>
  for (i = 0; i < 20; i++)
  ff:	83 c4 10             	add    $0x10,%esp
 102:	83 eb 01             	sub    $0x1,%ebx
 105:	75 e9                	jne    f0 <main+0xf0>
  close(fd);
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	57                   	push   %edi
 10b:	e8 7b 02 00 00       	call   38b <close>

  wait();
 110:	e8 56 02 00 00       	call   36b <wait>

  exit();
 115:	e8 49 02 00 00       	call   363 <exit>
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave
 144:	c3                   	ret
 145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 17                	jne    178 <strcmp+0x28>
 161:	eb 3a                	jmp    19d <strcmp+0x4d>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 16c:	83 c2 01             	add    $0x1,%edx
 16f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 172:	84 c0                	test   %al,%al
 174:	74 1a                	je     190 <strcmp+0x40>
    p++, q++;
 176:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 178:	0f b6 19             	movzbl (%ecx),%ebx
 17b:	38 c3                	cmp    %al,%bl
 17d:	74 e9                	je     168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 17f:	29 d8                	sub    %ebx,%eax
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave
 185:	c3                   	ret
 186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 194:	31 c0                	xor    %eax,%eax
 196:	29 d8                	sub    %ebx,%eax
}
 198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19b:	c9                   	leave
 19c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 19             	movzbl (%ecx),%ebx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	eb db                	jmp    17f <strcmp+0x2f>
 1a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <strlen>:

uint
strlen(char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	89 c1                	mov    %eax,%ecx
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	89 c8                	mov    %ecx,%eax
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret
 1cf:	90                   	nop
  for(n = 0; s[n]; n++)
 1d0:	31 c9                	xor    %ecx,%ecx
}
 1d2:	5d                   	pop    %ebp
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	c3                   	ret
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c9                   	leave
 1f8:	c3                   	ret
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	75 12                	jne    223 <strchr+0x23>
 211:	eb 1d                	jmp    230 <strchr+0x30>
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 21c:	83 c0 01             	add    $0x1,%eax
 21f:	84 d2                	test   %dl,%dl
 221:	74 0d                	je     230 <strchr+0x30>
    if(*s == c)
 223:	38 d1                	cmp    %dl,%cl
 225:	75 f1                	jne    218 <strchr+0x18>
      return (char*)s;
  return 0;
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 230:	31 c0                	xor    %eax,%eax
}
 232:	5d                   	pop    %ebp
 233:	c3                   	ret
 234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 245:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 249:	31 db                	xor    %ebx,%ebx
{
 24b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 24e:	eb 27                	jmp    277 <gets+0x37>
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	6a 01                	push   $0x1
 255:	56                   	push   %esi
 256:	6a 00                	push   $0x0
 258:	e8 1e 01 00 00       	call   37b <read>
    if(cc < 1)
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	7e 1d                	jle    281 <gets+0x41>
      break;
    buf[i++] = c;
 264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 268:	8b 55 08             	mov    0x8(%ebp),%edx
 26b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 26f:	3c 0a                	cmp    $0xa,%al
 271:	74 10                	je     283 <gets+0x43>
 273:	3c 0d                	cmp    $0xd,%al
 275:	74 0c                	je     283 <gets+0x43>
  for(i=0; i+1 < max; ){
 277:	89 df                	mov    %ebx,%edi
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27f:	7c cf                	jl     250 <gets+0x10>
 281:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 28a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28d:	5b                   	pop    %ebx
 28e:	5e                   	pop    %esi
 28f:	5f                   	pop    %edi
 290:	5d                   	pop    %ebp
 291:	c3                   	ret
 292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <stat>:

int
stat(char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a5:	83 ec 08             	sub    $0x8,%esp
 2a8:	6a 00                	push   $0x0
 2aa:	ff 75 08             	push   0x8(%ebp)
 2ad:	e8 f1 00 00 00       	call   3a3 <open>
  if(fd < 0)
 2b2:	83 c4 10             	add    $0x10,%esp
 2b5:	85 c0                	test   %eax,%eax
 2b7:	78 27                	js     2e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	ff 75 0c             	push   0xc(%ebp)
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	50                   	push   %eax
 2c2:	e8 f4 00 00 00       	call   3bb <fstat>
  close(fd);
 2c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ca:	89 c6                	mov    %eax,%esi
  close(fd);
 2cc:	e8 ba 00 00 00       	call   38b <close>
  return r;
 2d1:	83 c4 10             	add    $0x10,%esp
}
 2d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e5:	eb ed                	jmp    2d4 <stat+0x34>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 02             	movsbl (%edx),%eax
 2fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2fd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 300:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 305:	77 1e                	ja     325 <atoi+0x35>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 310:	83 c2 01             	add    $0x1,%edx
 313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 31a:	0f be 02             	movsbl (%edx),%eax
 31d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 320:	80 fb 09             	cmp    $0x9,%bl
 323:	76 eb                	jbe    310 <atoi+0x20>
  return n;
}
 325:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 328:	89 c8                	mov    %ecx,%eax
 32a:	c9                   	leave
 32b:	c3                   	ret
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	8b 55 08             	mov    0x8(%ebp),%edx
 33b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	85 c0                	test   %eax,%eax
 340:	7e 13                	jle    355 <memmove+0x25>
 342:	01 d0                	add    %edx,%eax
  dst = vdst;
 344:	89 d7                	mov    %edx,%edi
 346:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 351:	39 f8                	cmp    %edi,%eax
 353:	75 fb                	jne    350 <memmove+0x20>
  return vdst;
}
 355:	5e                   	pop    %esi
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret

0000035b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <exit>:
SYSCALL(exit)
 363:	b8 02 00 00 00       	mov    $0x2,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret

0000036b <wait>:
SYSCALL(wait)
 36b:	b8 03 00 00 00       	mov    $0x3,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret

00000373 <pipe>:
SYSCALL(pipe)
 373:	b8 04 00 00 00       	mov    $0x4,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret

0000037b <read>:
SYSCALL(read)
 37b:	b8 05 00 00 00       	mov    $0x5,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret

00000383 <write>:
SYSCALL(write)
 383:	b8 10 00 00 00       	mov    $0x10,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret

0000038b <close>:
SYSCALL(close)
 38b:	b8 15 00 00 00       	mov    $0x15,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret

00000393 <kill>:
SYSCALL(kill)
 393:	b8 06 00 00 00       	mov    $0x6,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret

0000039b <exec>:
SYSCALL(exec)
 39b:	b8 07 00 00 00       	mov    $0x7,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret

000003a3 <open>:
SYSCALL(open)
 3a3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret

000003ab <mknod>:
SYSCALL(mknod)
 3ab:	b8 11 00 00 00       	mov    $0x11,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret

000003b3 <unlink>:
SYSCALL(unlink)
 3b3:	b8 12 00 00 00       	mov    $0x12,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret

000003bb <fstat>:
SYSCALL(fstat)
 3bb:	b8 08 00 00 00       	mov    $0x8,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret

000003c3 <link>:
SYSCALL(link)
 3c3:	b8 13 00 00 00       	mov    $0x13,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret

000003cb <mkdir>:
SYSCALL(mkdir)
 3cb:	b8 14 00 00 00       	mov    $0x14,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret

000003d3 <chdir>:
SYSCALL(chdir)
 3d3:	b8 09 00 00 00       	mov    $0x9,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret

000003db <dup>:
SYSCALL(dup)
 3db:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret

000003e3 <getpid>:
SYSCALL(getpid)
 3e3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret

000003eb <sbrk>:
SYSCALL(sbrk)
 3eb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret

000003f3 <sleep>:
SYSCALL(sleep)
 3f3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret

000003fb <uptime>:
SYSCALL(uptime)
 3fb:	b8 0e 00 00 00       	mov    $0xe,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret

00000403 <shutdown>:
SYSCALL(shutdown)
 403:	b8 16 00 00 00       	mov    $0x16,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret

0000040b <fork_winner>:
SYSCALL(fork_winner)
 40b:	b8 18 00 00 00       	mov    $0x18,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret

00000413 <enable_sched_trace>:
SYSCALL(enable_sched_trace)
 413:	b8 17 00 00 00       	mov    $0x17,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret

0000041b <set_sched>:
SYSCALL(set_sched)
 41b:	b8 19 00 00 00       	mov    $0x19,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret

00000423 <tickets_owned>:
SYSCALL(tickets_owned)
 423:	b8 1a 00 00 00       	mov    $0x1a,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret

0000042b <transfer_tickets>:
 42b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret
 433:	66 90                	xchg   %ax,%ax
 435:	66 90                	xchg   %ax,%ax
 437:	66 90                	xchg   %ax,%ax
 439:	66 90                	xchg   %ax,%ax
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 448:	89 d1                	mov    %edx,%ecx
{
 44a:	83 ec 3c             	sub    $0x3c,%esp
 44d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 450:	85 d2                	test   %edx,%edx
 452:	0f 89 80 00 00 00    	jns    4d8 <printint+0x98>
 458:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45c:	74 7a                	je     4d8 <printint+0x98>
    x = -xx;
 45e:	f7 d9                	neg    %ecx
    neg = 1;
 460:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 465:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 468:	31 f6                	xor    %esi,%esi
 46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 c8                	mov    %ecx,%eax
 472:	31 d2                	xor    %edx,%edx
 474:	89 f7                	mov    %esi,%edi
 476:	f7 f3                	div    %ebx
 478:	8d 76 01             	lea    0x1(%esi),%esi
 47b:	0f b6 92 8c 08 00 00 	movzbl 0x88c(%edx),%edx
 482:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 486:	89 ca                	mov    %ecx,%edx
 488:	89 c1                	mov    %eax,%ecx
 48a:	39 da                	cmp    %ebx,%edx
 48c:	73 e2                	jae    470 <printint+0x30>
  if(neg)
 48e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 491:	85 c0                	test   %eax,%eax
 493:	74 07                	je     49c <printint+0x5c>
    buf[i++] = '-';
 495:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
 49a:	89 f7                	mov    %esi,%edi
 49c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 49f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4a2:	01 df                	add    %ebx,%edi
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
 4a8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4ab:	83 ec 04             	sub    $0x4,%esp
 4ae:	88 45 d7             	mov    %al,-0x29(%ebp)
 4b1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4b4:	6a 01                	push   $0x1
 4b6:	50                   	push   %eax
 4b7:	56                   	push   %esi
 4b8:	e8 c6 fe ff ff       	call   383 <write>
  while(--i >= 0)
 4bd:	89 f8                	mov    %edi,%eax
 4bf:	83 c4 10             	add    $0x10,%esp
 4c2:	83 ef 01             	sub    $0x1,%edi
 4c5:	39 d8                	cmp    %ebx,%eax
 4c7:	75 df                	jne    4a8 <printint+0x68>
}
 4c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cc:	5b                   	pop    %ebx
 4cd:	5e                   	pop    %esi
 4ce:	5f                   	pop    %edi
 4cf:	5d                   	pop    %ebp
 4d0:	c3                   	ret
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4d8:	31 c0                	xor    %eax,%eax
 4da:	eb 89                	jmp    465 <printint+0x25>
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 4ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 4ef:	0f b6 1e             	movzbl (%esi),%ebx
 4f2:	83 c6 01             	add    $0x1,%esi
 4f5:	84 db                	test   %bl,%bl
 4f7:	74 67                	je     560 <printf+0x80>
 4f9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4fc:	31 d2                	xor    %edx,%edx
 4fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 501:	eb 34                	jmp    537 <printf+0x57>
 503:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 507:	90                   	nop
 508:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 50b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 510:	83 f8 25             	cmp    $0x25,%eax
 513:	74 18                	je     52d <printf+0x4d>
  write(fd, &c, 1);
 515:	83 ec 04             	sub    $0x4,%esp
 518:	8d 45 e7             	lea    -0x19(%ebp),%eax
 51b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 51e:	6a 01                	push   $0x1
 520:	50                   	push   %eax
 521:	57                   	push   %edi
 522:	e8 5c fe ff ff       	call   383 <write>
 527:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 52a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 52d:	0f b6 1e             	movzbl (%esi),%ebx
 530:	83 c6 01             	add    $0x1,%esi
 533:	84 db                	test   %bl,%bl
 535:	74 29                	je     560 <printf+0x80>
    c = fmt[i] & 0xff;
 537:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 53a:	85 d2                	test   %edx,%edx
 53c:	74 ca                	je     508 <printf+0x28>
      }
    } else if(state == '%'){
 53e:	83 fa 25             	cmp    $0x25,%edx
 541:	75 ea                	jne    52d <printf+0x4d>
      if(c == 'd'){
 543:	83 f8 25             	cmp    $0x25,%eax
 546:	0f 84 24 01 00 00    	je     670 <printf+0x190>
 54c:	83 e8 63             	sub    $0x63,%eax
 54f:	83 f8 15             	cmp    $0x15,%eax
 552:	77 1c                	ja     570 <printf+0x90>
 554:	ff 24 85 34 08 00 00 	jmp    *0x834(,%eax,4)
 55b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 560:	8d 65 f4             	lea    -0xc(%ebp),%esp
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	8d 55 e7             	lea    -0x19(%ebp),%edx
 576:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57a:	6a 01                	push   $0x1
 57c:	52                   	push   %edx
 57d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 580:	57                   	push   %edi
 581:	e8 fd fd ff ff       	call   383 <write>
 586:	83 c4 0c             	add    $0xc,%esp
 589:	88 5d e7             	mov    %bl,-0x19(%ebp)
 58c:	6a 01                	push   $0x1
 58e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 591:	52                   	push   %edx
 592:	57                   	push   %edi
 593:	e8 eb fd ff ff       	call   383 <write>
        putc(fd, c);
 598:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59b:	31 d2                	xor    %edx,%edx
 59d:	eb 8e                	jmp    52d <printf+0x4d>
 59f:	90                   	nop
        printint(fd, *ap, 16, 0);
 5a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5a3:	83 ec 0c             	sub    $0xc,%esp
 5a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ab:	8b 13                	mov    (%ebx),%edx
 5ad:	6a 00                	push   $0x0
 5af:	89 f8                	mov    %edi,%eax
        ap++;
 5b1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 5b4:	e8 87 fe ff ff       	call   440 <printint>
        ap++;
 5b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5bf:	31 d2                	xor    %edx,%edx
 5c1:	e9 67 ff ff ff       	jmp    52d <printf+0x4d>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
 5d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5d5:	83 c0 04             	add    $0x4,%eax
 5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5db:	85 db                	test   %ebx,%ebx
 5dd:	0f 84 9d 00 00 00    	je     680 <printf+0x1a0>
        while(*s != 0){
 5e3:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5e6:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5e8:	84 c0                	test   %al,%al
 5ea:	0f 84 3d ff ff ff    	je     52d <printf+0x4d>
 5f0:	8d 55 e7             	lea    -0x19(%ebp),%edx
 5f3:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5f6:	89 de                	mov    %ebx,%esi
 5f8:	89 d3                	mov    %edx,%ebx
 5fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 606:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 609:	6a 01                	push   $0x1
 60b:	53                   	push   %ebx
 60c:	57                   	push   %edi
 60d:	e8 71 fd ff ff       	call   383 <write>
        while(*s != 0){
 612:	0f b6 06             	movzbl (%esi),%eax
 615:	83 c4 10             	add    $0x10,%esp
 618:	84 c0                	test   %al,%al
 61a:	75 e4                	jne    600 <printf+0x120>
      state = 0;
 61c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 61f:	31 d2                	xor    %edx,%edx
 621:	e9 07 ff ff ff       	jmp    52d <printf+0x4d>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 630:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 633:	83 ec 0c             	sub    $0xc,%esp
 636:	b9 0a 00 00 00       	mov    $0xa,%ecx
 63b:	8b 13                	mov    (%ebx),%edx
 63d:	6a 01                	push   $0x1
 63f:	e9 6b ff ff ff       	jmp    5af <printf+0xcf>
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 648:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 64b:	83 ec 04             	sub    $0x4,%esp
 64e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 651:	8b 03                	mov    (%ebx),%eax
        ap++;
 653:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	52                   	push   %edx
 65c:	57                   	push   %edi
 65d:	e8 21 fd ff ff       	call   383 <write>
        ap++;
 662:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 665:	83 c4 10             	add    $0x10,%esp
      state = 0;
 668:	31 d2                	xor    %edx,%edx
 66a:	e9 be fe ff ff       	jmp    52d <printf+0x4d>
 66f:	90                   	nop
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 5d e7             	mov    %bl,-0x19(%ebp)
 676:	8d 55 e7             	lea    -0x19(%ebp),%edx
 679:	6a 01                	push   $0x1
 67b:	e9 11 ff ff ff       	jmp    591 <printf+0xb1>
 680:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 685:	bb 2b 08 00 00       	mov    $0x82b,%ebx
 68a:	e9 61 ff ff ff       	jmp    5f0 <printf+0x110>
 68f:	90                   	nop

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 38 0b 00 00       	mov    0xb38,%eax
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 69e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6aa:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ac:	39 ca                	cmp    %ecx,%edx
 6ae:	73 30                	jae    6e0 <free+0x50>
 6b0:	39 c1                	cmp    %eax,%ecx
 6b2:	72 04                	jb     6b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b4:	39 c2                	cmp    %eax,%edx
 6b6:	72 f0                	jb     6a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 f8                	cmp    %edi,%eax
 6c0:	74 2e                	je     6f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6c5:	8b 42 04             	mov    0x4(%edx),%eax
 6c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6cb:	39 f1                	cmp    %esi,%ecx
 6cd:	74 38                	je     707 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6d1:	5b                   	pop    %ebx
  freep = p;
 6d2:	89 15 38 0b 00 00    	mov    %edx,0xb38
}
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e0:	39 c1                	cmp    %eax,%ecx
 6e2:	72 d0                	jb     6b4 <free+0x24>
 6e4:	eb c2                	jmp    6a8 <free+0x18>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 6f0:	03 70 04             	add    0x4(%eax),%esi
 6f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f6:	8b 02                	mov    (%edx),%eax
 6f8:	8b 00                	mov    (%eax),%eax
 6fa:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6fd:	8b 42 04             	mov    0x4(%edx),%eax
 700:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 703:	39 f1                	cmp    %esi,%ecx
 705:	75 c8                	jne    6cf <free+0x3f>
    p->s.size += bp->s.size;
 707:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 70a:	89 15 38 0b 00 00    	mov    %edx,0xb38
    p->s.size += bp->s.size;
 710:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 713:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 716:	89 0a                	mov    %ecx,(%edx)
}
 718:	5b                   	pop    %ebx
 719:	5e                   	pop    %esi
 71a:	5f                   	pop    %edi
 71b:	5d                   	pop    %ebp
 71c:	c3                   	ret
 71d:	8d 76 00             	lea    0x0(%esi),%esi

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 72c:	8b 15 38 0b 00 00    	mov    0xb38,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 732:	8d 78 07             	lea    0x7(%eax),%edi
 735:	c1 ef 03             	shr    $0x3,%edi
 738:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 73b:	85 d2                	test   %edx,%edx
 73d:	0f 84 8d 00 00 00    	je     7d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 743:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 745:	8b 48 04             	mov    0x4(%eax),%ecx
 748:	39 f9                	cmp    %edi,%ecx
 74a:	73 64                	jae    7b0 <malloc+0x90>
  if(nu < 4096)
 74c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 751:	39 df                	cmp    %ebx,%edi
 753:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 756:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 75d:	eb 0a                	jmp    769 <malloc+0x49>
 75f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 760:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 762:	8b 48 04             	mov    0x4(%eax),%ecx
 765:	39 f9                	cmp    %edi,%ecx
 767:	73 47                	jae    7b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 769:	89 c2                	mov    %eax,%edx
 76b:	39 05 38 0b 00 00    	cmp    %eax,0xb38
 771:	75 ed                	jne    760 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	56                   	push   %esi
 777:	e8 6f fc ff ff       	call   3eb <sbrk>
  if(p == (char*)-1)
 77c:	83 c4 10             	add    $0x10,%esp
 77f:	83 f8 ff             	cmp    $0xffffffff,%eax
 782:	74 1c                	je     7a0 <malloc+0x80>
  hp->s.size = nu;
 784:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 787:	83 ec 0c             	sub    $0xc,%esp
 78a:	83 c0 08             	add    $0x8,%eax
 78d:	50                   	push   %eax
 78e:	e8 fd fe ff ff       	call   690 <free>
  return freep;
 793:	8b 15 38 0b 00 00    	mov    0xb38,%edx
      if((p = morecore(nunits)) == 0)
 799:	83 c4 10             	add    $0x10,%esp
 79c:	85 d2                	test   %edx,%edx
 79e:	75 c0                	jne    760 <malloc+0x40>
        return 0;
  }
}
 7a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7a3:	31 c0                	xor    %eax,%eax
}
 7a5:	5b                   	pop    %ebx
 7a6:	5e                   	pop    %esi
 7a7:	5f                   	pop    %edi
 7a8:	5d                   	pop    %ebp
 7a9:	c3                   	ret
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7b0:	39 cf                	cmp    %ecx,%edi
 7b2:	74 4c                	je     800 <malloc+0xe0>
        p->s.size -= nunits;
 7b4:	29 f9                	sub    %edi,%ecx
 7b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7bf:	89 15 38 0b 00 00    	mov    %edx,0xb38
}
 7c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 38 0b 00 00 3c 	movl   $0xb3c,0xb38
 7d7:	0b 00 00 
    base.s.size = 0;
 7da:	b8 3c 0b 00 00       	mov    $0xb3c,%eax
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 3c 0b 00 00 3c 	movl   $0xb3c,0xb3c
 7e6:	0b 00 00 
    base.s.size = 0;
 7e9:	c7 05 40 0b 00 00 00 	movl   $0x0,0xb40
 7f0:	00 00 00 
    if(p->s.size >= nunits){
 7f3:	e9 54 ff ff ff       	jmp    74c <malloc+0x2c>
 7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb b9                	jmp    7bf <malloc+0x9f>
