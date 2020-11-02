
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 73 2d 00 00       	call   102d9f <memset>

    cons_init();                // init the console
  10002c:	e8 06 16 00 00       	call   101637 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 35 10 00 	movl   $0x1035e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 35 10 00 	movl   $0x1035fc,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 f4 29 00 00       	call   102a4e <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 2d 17 00 00       	call   10178c <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 ad 18 00 00       	call   101911 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 53 0d 00 00       	call   100dbc <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 6a 18 00 00       	call   1018d8 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 10 0d 00 00       	call   100da6 <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 01 36 10 00 	movl   $0x103601,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 0f 36 10 00 	movl   $0x10360f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 1d 36 10 00 	movl   $0x10361d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 2b 36 10 00 	movl   $0x10362b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 39 36 10 00 	movl   $0x103639,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 2b 14 00 00       	call   101668 <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 8c 2e 00 00       	call   10310b <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 a5 13 00 00       	call   101668 <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 6d 13 00 00       	call   101696 <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 87 36 10 00 	movl   $0x103687,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 8a 36 10 00 	movl   $0x10368a,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 80 14 00 00       	call   1018e4 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 5d 08 00 00       	call   100ccd <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 ba 36 10 00 	movl   $0x1036ba,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 d8 36 10 00    	movl   $0x1036d8,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 d8 36 10 00 	movl   $0x1036d8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 ec 3e 10 00 	movl   $0x103eec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 d4 cb 10 00 	movl   $0x10cbd4,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec d5 cb 10 00 	movl   $0x10cbd5,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 eb ec 10 00 	movl   $0x10eceb,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 45 24 00 00       	call   102c13 <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 c3 35 10 	movl   $0x1035c3,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 13 37 10 00 	movl   $0x103713,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 43 37 10 00 	movl   $0x103743,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 5c 37 10 00 	movl   $0x10375c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 86 37 10 00 	movl   $0x103786,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 a2 37 10 00 	movl   $0x1037a2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100aa3:	89 e8                	mov    %ebp,%eax
  100aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100aa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
     /* LAB1 YOUR CODE : STEP 1 */
    uint32_t ebp = read_ebp();//(1) call read_ebp() to get the value of ebp. the type is (uint32_t);
  100aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eip = read_eip(); //(2) call read_eip() to get the value of eip. the type is (uint32_t);
  100aae:	e8 d1 ff ff ff       	call   100a84 <read_eip>
  100ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(auto it = 0; it <= STACKFRAME_DEPTH && ebp != 0; it++){//(3) from 0 .. STACKFRAME_DEPTH
  100ab6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100abd:	e9 84 00 00 00       	jmp    100b46 <print_stackframe+0xad>
        cprintf("ebp:0x%08x eip:0x%08x args: ", ebp, eip);//   (3.1) printf value of ebp, eip
  100ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac5:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad0:	c7 04 24 b4 37 10 00 	movl   $0x1037b4,(%esp)
  100ad7:	e8 a8 f7 ff ff       	call   100284 <cprintf>
        uint32_t *arguments = (uint32_t*)ebp + 2;
  100adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100adf:	83 c0 08             	add    $0x8,%eax
  100ae2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for(auto i = 0; i < 4; i++){        //   (3.2) (uint32_t)calling arguments [0..4] = the contents in address (uint32_t)ebp +2 [0..4]
  100ae5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aec:	eb 24                	jmp    100b12 <print_stackframe+0x79>
            cprintf("0x%08x ", *(arguments + i));
  100aee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100af1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100af8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100afb:	01 d0                	add    %edx,%eax
  100afd:	8b 00                	mov    (%eax),%eax
  100aff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b03:	c7 04 24 d1 37 10 00 	movl   $0x1037d1,(%esp)
  100b0a:	e8 75 f7 ff ff       	call   100284 <cprintf>
        for(auto i = 0; i < 4; i++){        //   (3.2) (uint32_t)calling arguments [0..4] = the contents in address (uint32_t)ebp +2 [0..4]
  100b0f:	ff 45 e8             	incl   -0x18(%ebp)
  100b12:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b16:	7e d6                	jle    100aee <print_stackframe+0x55>
        }
        cprintf("\n");     //   (3.3) cprintf("\n");
  100b18:	c7 04 24 d9 37 10 00 	movl   $0x1037d9,(%esp)
  100b1f:	e8 60 f7 ff ff       	call   100284 <cprintf>
        print_debuginfo(eip-1);//   (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
  100b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b27:	48                   	dec    %eax
  100b28:	89 04 24             	mov    %eax,(%esp)
  100b2b:	e8 ad fe ff ff       	call   1009dd <print_debuginfo>
     //  (3.5) popup a calling stackframe
        eip = ((uint32_t*)ebp)[1];//         NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
  100b30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b33:	83 c0 04             	add    $0x4,%eax
  100b36:	8b 00                	mov    (%eax),%eax
  100b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t*)ebp)[0];//                  the calling funciton's ebp = ss:[ebp]
  100b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3e:	8b 00                	mov    (%eax),%eax
  100b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(auto it = 0; it <= STACKFRAME_DEPTH && ebp != 0; it++){//(3) from 0 .. STACKFRAME_DEPTH
  100b43:	ff 45 ec             	incl   -0x14(%ebp)
  100b46:	83 7d ec 14          	cmpl   $0x14,-0x14(%ebp)
  100b4a:	7f 0a                	jg     100b56 <print_stackframe+0xbd>
  100b4c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b50:	0f 85 6c ff ff ff    	jne    100ac2 <print_stackframe+0x29>
     //
    }
}
  100b56:	90                   	nop
  100b57:	c9                   	leave  
  100b58:	c3                   	ret    

00100b59 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b59:	f3 0f 1e fb          	endbr32 
  100b5d:	55                   	push   %ebp
  100b5e:	89 e5                	mov    %esp,%ebp
  100b60:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b63:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b6a:	eb 0c                	jmp    100b78 <parse+0x1f>
            *buf ++ = '\0';
  100b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6f:	8d 50 01             	lea    0x1(%eax),%edx
  100b72:	89 55 08             	mov    %edx,0x8(%ebp)
  100b75:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b78:	8b 45 08             	mov    0x8(%ebp),%eax
  100b7b:	0f b6 00             	movzbl (%eax),%eax
  100b7e:	84 c0                	test   %al,%al
  100b80:	74 1d                	je     100b9f <parse+0x46>
  100b82:	8b 45 08             	mov    0x8(%ebp),%eax
  100b85:	0f b6 00             	movzbl (%eax),%eax
  100b88:	0f be c0             	movsbl %al,%eax
  100b8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b8f:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  100b96:	e8 42 20 00 00       	call   102bdd <strchr>
  100b9b:	85 c0                	test   %eax,%eax
  100b9d:	75 cd                	jne    100b6c <parse+0x13>
        }
        if (*buf == '\0') {
  100b9f:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba2:	0f b6 00             	movzbl (%eax),%eax
  100ba5:	84 c0                	test   %al,%al
  100ba7:	74 65                	je     100c0e <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ba9:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bad:	75 14                	jne    100bc3 <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100baf:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bb6:	00 
  100bb7:	c7 04 24 61 38 10 00 	movl   $0x103861,(%esp)
  100bbe:	e8 c1 f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bc6:	8d 50 01             	lea    0x1(%eax),%edx
  100bc9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bcc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bd3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bd6:	01 c2                	add    %eax,%edx
  100bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdb:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bdd:	eb 03                	jmp    100be2 <parse+0x89>
            buf ++;
  100bdf:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	0f b6 00             	movzbl (%eax),%eax
  100be8:	84 c0                	test   %al,%al
  100bea:	74 8c                	je     100b78 <parse+0x1f>
  100bec:	8b 45 08             	mov    0x8(%ebp),%eax
  100bef:	0f b6 00             	movzbl (%eax),%eax
  100bf2:	0f be c0             	movsbl %al,%eax
  100bf5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bf9:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  100c00:	e8 d8 1f 00 00       	call   102bdd <strchr>
  100c05:	85 c0                	test   %eax,%eax
  100c07:	74 d6                	je     100bdf <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c09:	e9 6a ff ff ff       	jmp    100b78 <parse+0x1f>
            break;
  100c0e:	90                   	nop
        }
    }
    return argc;
  100c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c12:	c9                   	leave  
  100c13:	c3                   	ret    

00100c14 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c14:	f3 0f 1e fb          	endbr32 
  100c18:	55                   	push   %ebp
  100c19:	89 e5                	mov    %esp,%ebp
  100c1b:	53                   	push   %ebx
  100c1c:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c1f:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c22:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c26:	8b 45 08             	mov    0x8(%ebp),%eax
  100c29:	89 04 24             	mov    %eax,(%esp)
  100c2c:	e8 28 ff ff ff       	call   100b59 <parse>
  100c31:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c38:	75 0a                	jne    100c44 <runcmd+0x30>
        return 0;
  100c3a:	b8 00 00 00 00       	mov    $0x0,%eax
  100c3f:	e9 83 00 00 00       	jmp    100cc7 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c4b:	eb 5a                	jmp    100ca7 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c4d:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c50:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c53:	89 d0                	mov    %edx,%eax
  100c55:	01 c0                	add    %eax,%eax
  100c57:	01 d0                	add    %edx,%eax
  100c59:	c1 e0 02             	shl    $0x2,%eax
  100c5c:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c61:	8b 00                	mov    (%eax),%eax
  100c63:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c67:	89 04 24             	mov    %eax,(%esp)
  100c6a:	e8 ca 1e 00 00       	call   102b39 <strcmp>
  100c6f:	85 c0                	test   %eax,%eax
  100c71:	75 31                	jne    100ca4 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c73:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c76:	89 d0                	mov    %edx,%eax
  100c78:	01 c0                	add    %eax,%eax
  100c7a:	01 d0                	add    %edx,%eax
  100c7c:	c1 e0 02             	shl    $0x2,%eax
  100c7f:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c84:	8b 10                	mov    (%eax),%edx
  100c86:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c89:	83 c0 04             	add    $0x4,%eax
  100c8c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c8f:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c92:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c95:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c99:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c9d:	89 1c 24             	mov    %ebx,(%esp)
  100ca0:	ff d2                	call   *%edx
  100ca2:	eb 23                	jmp    100cc7 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100ca4:	ff 45 f4             	incl   -0xc(%ebp)
  100ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100caa:	83 f8 02             	cmp    $0x2,%eax
  100cad:	76 9e                	jbe    100c4d <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100caf:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb6:	c7 04 24 7f 38 10 00 	movl   $0x10387f,(%esp)
  100cbd:	e8 c2 f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cc2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cc7:	83 c4 64             	add    $0x64,%esp
  100cca:	5b                   	pop    %ebx
  100ccb:	5d                   	pop    %ebp
  100ccc:	c3                   	ret    

00100ccd <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100ccd:	f3 0f 1e fb          	endbr32 
  100cd1:	55                   	push   %ebp
  100cd2:	89 e5                	mov    %esp,%ebp
  100cd4:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cd7:	c7 04 24 98 38 10 00 	movl   $0x103898,(%esp)
  100cde:	e8 a1 f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100ce3:	c7 04 24 c0 38 10 00 	movl   $0x1038c0,(%esp)
  100cea:	e8 95 f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100cef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cf3:	74 0b                	je     100d00 <kmonitor+0x33>
        print_trapframe(tf);
  100cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  100cf8:	89 04 24             	mov    %eax,(%esp)
  100cfb:	e8 db 0d 00 00       	call   101adb <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d00:	c7 04 24 e5 38 10 00 	movl   $0x1038e5,(%esp)
  100d07:	e8 2b f6 ff ff       	call   100337 <readline>
  100d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d13:	74 eb                	je     100d00 <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d15:	8b 45 08             	mov    0x8(%ebp),%eax
  100d18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1f:	89 04 24             	mov    %eax,(%esp)
  100d22:	e8 ed fe ff ff       	call   100c14 <runcmd>
  100d27:	85 c0                	test   %eax,%eax
  100d29:	78 02                	js     100d2d <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d2b:	eb d3                	jmp    100d00 <kmonitor+0x33>
                break;
  100d2d:	90                   	nop
            }
        }
    }
}
  100d2e:	90                   	nop
  100d2f:	c9                   	leave  
  100d30:	c3                   	ret    

00100d31 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d31:	f3 0f 1e fb          	endbr32 
  100d35:	55                   	push   %ebp
  100d36:	89 e5                	mov    %esp,%ebp
  100d38:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d3b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d42:	eb 3d                	jmp    100d81 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d47:	89 d0                	mov    %edx,%eax
  100d49:	01 c0                	add    %eax,%eax
  100d4b:	01 d0                	add    %edx,%eax
  100d4d:	c1 e0 02             	shl    $0x2,%eax
  100d50:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d55:	8b 08                	mov    (%eax),%ecx
  100d57:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d5a:	89 d0                	mov    %edx,%eax
  100d5c:	01 c0                	add    %eax,%eax
  100d5e:	01 d0                	add    %edx,%eax
  100d60:	c1 e0 02             	shl    $0x2,%eax
  100d63:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d68:	8b 00                	mov    (%eax),%eax
  100d6a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d72:	c7 04 24 e9 38 10 00 	movl   $0x1038e9,(%esp)
  100d79:	e8 06 f5 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d7e:	ff 45 f4             	incl   -0xc(%ebp)
  100d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d84:	83 f8 02             	cmp    $0x2,%eax
  100d87:	76 bb                	jbe    100d44 <mon_help+0x13>
    }
    return 0;
  100d89:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d8e:	c9                   	leave  
  100d8f:	c3                   	ret    

00100d90 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d90:	f3 0f 1e fb          	endbr32 
  100d94:	55                   	push   %ebp
  100d95:	89 e5                	mov    %esp,%ebp
  100d97:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d9a:	e8 a8 fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100d9f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100da4:	c9                   	leave  
  100da5:	c3                   	ret    

00100da6 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100da6:	f3 0f 1e fb          	endbr32 
  100daa:	55                   	push   %ebp
  100dab:	89 e5                	mov    %esp,%ebp
  100dad:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100db0:	e8 e4 fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100db5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dba:	c9                   	leave  
  100dbb:	c3                   	ret    

00100dbc <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dbc:	f3 0f 1e fb          	endbr32 
  100dc0:	55                   	push   %ebp
  100dc1:	89 e5                	mov    %esp,%ebp
  100dc3:	83 ec 28             	sub    $0x28,%esp
  100dc6:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dcc:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dd0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dd4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dd8:	ee                   	out    %al,(%dx)
}
  100dd9:	90                   	nop
  100dda:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100de0:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100de8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dec:	ee                   	out    %al,(%dx)
}
  100ded:	90                   	nop
  100dee:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100df4:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df8:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dfc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e00:	ee                   	out    %al,(%dx)
}
  100e01:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e02:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e09:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e0c:	c7 04 24 f2 38 10 00 	movl   $0x1038f2,(%esp)
  100e13:	e8 6c f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e18:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e1f:	e8 31 09 00 00       	call   101755 <pic_enable>
}
  100e24:	90                   	nop
  100e25:	c9                   	leave  
  100e26:	c3                   	ret    

00100e27 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e27:	f3 0f 1e fb          	endbr32 
  100e2b:	55                   	push   %ebp
  100e2c:	89 e5                	mov    %esp,%ebp
  100e2e:	83 ec 10             	sub    $0x10,%esp
  100e31:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e37:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e3b:	89 c2                	mov    %eax,%edx
  100e3d:	ec                   	in     (%dx),%al
  100e3e:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e41:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e47:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e4b:	89 c2                	mov    %eax,%edx
  100e4d:	ec                   	in     (%dx),%al
  100e4e:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e51:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e57:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e5b:	89 c2                	mov    %eax,%edx
  100e5d:	ec                   	in     (%dx),%al
  100e5e:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e61:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e67:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e6b:	89 c2                	mov    %eax,%edx
  100e6d:	ec                   	in     (%dx),%al
  100e6e:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e71:	90                   	nop
  100e72:	c9                   	leave  
  100e73:	c3                   	ret    

00100e74 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e74:	f3 0f 1e fb          	endbr32 
  100e78:	55                   	push   %ebp
  100e79:	89 e5                	mov    %esp,%ebp
  100e7b:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e7e:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e85:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e88:	0f b7 00             	movzwl (%eax),%eax
  100e8b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e92:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e97:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e9a:	0f b7 00             	movzwl (%eax),%eax
  100e9d:	0f b7 c0             	movzwl %ax,%eax
  100ea0:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100ea5:	74 12                	je     100eb9 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100ea7:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100eae:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100eb5:	b4 03 
  100eb7:	eb 13                	jmp    100ecc <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100eb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ebc:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ec0:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ec3:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100eca:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100ecc:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ed3:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ed7:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100edb:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100edf:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ee3:	ee                   	out    %al,(%dx)
}
  100ee4:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ee5:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eec:	40                   	inc    %eax
  100eed:	0f b7 c0             	movzwl %ax,%eax
  100ef0:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ef4:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ef8:	89 c2                	mov    %eax,%edx
  100efa:	ec                   	in     (%dx),%al
  100efb:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100efe:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f02:	0f b6 c0             	movzbl %al,%eax
  100f05:	c1 e0 08             	shl    $0x8,%eax
  100f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f0b:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f12:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f16:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f1a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f1e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f22:	ee                   	out    %al,(%dx)
}
  100f23:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f24:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f2b:	40                   	inc    %eax
  100f2c:	0f b7 c0             	movzwl %ax,%eax
  100f2f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f33:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f37:	89 c2                	mov    %eax,%edx
  100f39:	ec                   	in     (%dx),%al
  100f3a:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f3d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f41:	0f b6 c0             	movzbl %al,%eax
  100f44:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f4a:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f52:	0f b7 c0             	movzwl %ax,%eax
  100f55:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f5b:	90                   	nop
  100f5c:	c9                   	leave  
  100f5d:	c3                   	ret    

00100f5e <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f5e:	f3 0f 1e fb          	endbr32 
  100f62:	55                   	push   %ebp
  100f63:	89 e5                	mov    %esp,%ebp
  100f65:	83 ec 48             	sub    $0x48,%esp
  100f68:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f6e:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f72:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f76:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f7a:	ee                   	out    %al,(%dx)
}
  100f7b:	90                   	nop
  100f7c:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f82:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f86:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f8a:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f8e:	ee                   	out    %al,(%dx)
}
  100f8f:	90                   	nop
  100f90:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f96:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f9a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f9e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fa2:	ee                   	out    %al,(%dx)
}
  100fa3:	90                   	nop
  100fa4:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100faa:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fae:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fb2:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fb6:	ee                   	out    %al,(%dx)
}
  100fb7:	90                   	nop
  100fb8:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fbe:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc2:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fc6:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fca:	ee                   	out    %al,(%dx)
}
  100fcb:	90                   	nop
  100fcc:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fd2:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fda:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fde:	ee                   	out    %al,(%dx)
}
  100fdf:	90                   	nop
  100fe0:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fe6:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fea:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fee:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ff2:	ee                   	out    %al,(%dx)
}
  100ff3:	90                   	nop
  100ff4:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ffa:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ffe:	89 c2                	mov    %eax,%edx
  101000:	ec                   	in     (%dx),%al
  101001:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101004:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101008:	3c ff                	cmp    $0xff,%al
  10100a:	0f 95 c0             	setne  %al
  10100d:	0f b6 c0             	movzbl %al,%eax
  101010:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  101015:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10101b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10101f:	89 c2                	mov    %eax,%edx
  101021:	ec                   	in     (%dx),%al
  101022:	88 45 f1             	mov    %al,-0xf(%ebp)
  101025:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10102b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10102f:	89 c2                	mov    %eax,%edx
  101031:	ec                   	in     (%dx),%al
  101032:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101035:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10103a:	85 c0                	test   %eax,%eax
  10103c:	74 0c                	je     10104a <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10103e:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101045:	e8 0b 07 00 00       	call   101755 <pic_enable>
    }
}
  10104a:	90                   	nop
  10104b:	c9                   	leave  
  10104c:	c3                   	ret    

0010104d <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10104d:	f3 0f 1e fb          	endbr32 
  101051:	55                   	push   %ebp
  101052:	89 e5                	mov    %esp,%ebp
  101054:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101057:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10105e:	eb 08                	jmp    101068 <lpt_putc_sub+0x1b>
        delay();
  101060:	e8 c2 fd ff ff       	call   100e27 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101065:	ff 45 fc             	incl   -0x4(%ebp)
  101068:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10106e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101072:	89 c2                	mov    %eax,%edx
  101074:	ec                   	in     (%dx),%al
  101075:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101078:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10107c:	84 c0                	test   %al,%al
  10107e:	78 09                	js     101089 <lpt_putc_sub+0x3c>
  101080:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101087:	7e d7                	jle    101060 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101089:	8b 45 08             	mov    0x8(%ebp),%eax
  10108c:	0f b6 c0             	movzbl %al,%eax
  10108f:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101095:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101098:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10109c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010a0:	ee                   	out    %al,(%dx)
}
  1010a1:	90                   	nop
  1010a2:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010a8:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010ac:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010b0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010b4:	ee                   	out    %al,(%dx)
}
  1010b5:	90                   	nop
  1010b6:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010bc:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010c0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010c4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010c8:	ee                   	out    %al,(%dx)
}
  1010c9:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010ca:	90                   	nop
  1010cb:	c9                   	leave  
  1010cc:	c3                   	ret    

001010cd <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010cd:	f3 0f 1e fb          	endbr32 
  1010d1:	55                   	push   %ebp
  1010d2:	89 e5                	mov    %esp,%ebp
  1010d4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010d7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010db:	74 0d                	je     1010ea <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e0:	89 04 24             	mov    %eax,(%esp)
  1010e3:	e8 65 ff ff ff       	call   10104d <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010e8:	eb 24                	jmp    10110e <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010ea:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010f1:	e8 57 ff ff ff       	call   10104d <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010f6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010fd:	e8 4b ff ff ff       	call   10104d <lpt_putc_sub>
        lpt_putc_sub('\b');
  101102:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101109:	e8 3f ff ff ff       	call   10104d <lpt_putc_sub>
}
  10110e:	90                   	nop
  10110f:	c9                   	leave  
  101110:	c3                   	ret    

00101111 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101111:	f3 0f 1e fb          	endbr32 
  101115:	55                   	push   %ebp
  101116:	89 e5                	mov    %esp,%ebp
  101118:	53                   	push   %ebx
  101119:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10111c:	8b 45 08             	mov    0x8(%ebp),%eax
  10111f:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101124:	85 c0                	test   %eax,%eax
  101126:	75 07                	jne    10112f <cga_putc+0x1e>
        c |= 0x0700;
  101128:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10112f:	8b 45 08             	mov    0x8(%ebp),%eax
  101132:	0f b6 c0             	movzbl %al,%eax
  101135:	83 f8 0d             	cmp    $0xd,%eax
  101138:	74 72                	je     1011ac <cga_putc+0x9b>
  10113a:	83 f8 0d             	cmp    $0xd,%eax
  10113d:	0f 8f a3 00 00 00    	jg     1011e6 <cga_putc+0xd5>
  101143:	83 f8 08             	cmp    $0x8,%eax
  101146:	74 0a                	je     101152 <cga_putc+0x41>
  101148:	83 f8 0a             	cmp    $0xa,%eax
  10114b:	74 4c                	je     101199 <cga_putc+0x88>
  10114d:	e9 94 00 00 00       	jmp    1011e6 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101152:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101159:	85 c0                	test   %eax,%eax
  10115b:	0f 84 af 00 00 00    	je     101210 <cga_putc+0xff>
            crt_pos --;
  101161:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101168:	48                   	dec    %eax
  101169:	0f b7 c0             	movzwl %ax,%eax
  10116c:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101172:	8b 45 08             	mov    0x8(%ebp),%eax
  101175:	98                   	cwtl   
  101176:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10117b:	98                   	cwtl   
  10117c:	83 c8 20             	or     $0x20,%eax
  10117f:	98                   	cwtl   
  101180:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101186:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10118d:	01 c9                	add    %ecx,%ecx
  10118f:	01 ca                	add    %ecx,%edx
  101191:	0f b7 c0             	movzwl %ax,%eax
  101194:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101197:	eb 77                	jmp    101210 <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  101199:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011a0:	83 c0 50             	add    $0x50,%eax
  1011a3:	0f b7 c0             	movzwl %ax,%eax
  1011a6:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011ac:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011b3:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011ba:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011bf:	89 c8                	mov    %ecx,%eax
  1011c1:	f7 e2                	mul    %edx
  1011c3:	c1 ea 06             	shr    $0x6,%edx
  1011c6:	89 d0                	mov    %edx,%eax
  1011c8:	c1 e0 02             	shl    $0x2,%eax
  1011cb:	01 d0                	add    %edx,%eax
  1011cd:	c1 e0 04             	shl    $0x4,%eax
  1011d0:	29 c1                	sub    %eax,%ecx
  1011d2:	89 c8                	mov    %ecx,%eax
  1011d4:	0f b7 c0             	movzwl %ax,%eax
  1011d7:	29 c3                	sub    %eax,%ebx
  1011d9:	89 d8                	mov    %ebx,%eax
  1011db:	0f b7 c0             	movzwl %ax,%eax
  1011de:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011e4:	eb 2b                	jmp    101211 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011e6:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011ec:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011f3:	8d 50 01             	lea    0x1(%eax),%edx
  1011f6:	0f b7 d2             	movzwl %dx,%edx
  1011f9:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  101200:	01 c0                	add    %eax,%eax
  101202:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101205:	8b 45 08             	mov    0x8(%ebp),%eax
  101208:	0f b7 c0             	movzwl %ax,%eax
  10120b:	66 89 02             	mov    %ax,(%edx)
        break;
  10120e:	eb 01                	jmp    101211 <cga_putc+0x100>
        break;
  101210:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101211:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101218:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10121d:	76 5d                	jbe    10127c <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10121f:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101224:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10122a:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10122f:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101236:	00 
  101237:	89 54 24 04          	mov    %edx,0x4(%esp)
  10123b:	89 04 24             	mov    %eax,(%esp)
  10123e:	e8 9f 1b 00 00       	call   102de2 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101243:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10124a:	eb 14                	jmp    101260 <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10124c:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101251:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101254:	01 d2                	add    %edx,%edx
  101256:	01 d0                	add    %edx,%eax
  101258:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10125d:	ff 45 f4             	incl   -0xc(%ebp)
  101260:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101267:	7e e3                	jle    10124c <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101269:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101270:	83 e8 50             	sub    $0x50,%eax
  101273:	0f b7 c0             	movzwl %ax,%eax
  101276:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10127c:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101283:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101287:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10128b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10128f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101293:	ee                   	out    %al,(%dx)
}
  101294:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101295:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10129c:	c1 e8 08             	shr    $0x8,%eax
  10129f:	0f b7 c0             	movzwl %ax,%eax
  1012a2:	0f b6 c0             	movzbl %al,%eax
  1012a5:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012ac:	42                   	inc    %edx
  1012ad:	0f b7 d2             	movzwl %dx,%edx
  1012b0:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012b4:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b7:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012bb:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012bf:	ee                   	out    %al,(%dx)
}
  1012c0:	90                   	nop
    outb(addr_6845, 15);
  1012c1:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012c8:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012cc:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012d0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012d4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012d8:	ee                   	out    %al,(%dx)
}
  1012d9:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012da:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012e1:	0f b6 c0             	movzbl %al,%eax
  1012e4:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012eb:	42                   	inc    %edx
  1012ec:	0f b7 d2             	movzwl %dx,%edx
  1012ef:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012f3:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012f6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012fa:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012fe:	ee                   	out    %al,(%dx)
}
  1012ff:	90                   	nop
}
  101300:	90                   	nop
  101301:	83 c4 34             	add    $0x34,%esp
  101304:	5b                   	pop    %ebx
  101305:	5d                   	pop    %ebp
  101306:	c3                   	ret    

00101307 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101307:	f3 0f 1e fb          	endbr32 
  10130b:	55                   	push   %ebp
  10130c:	89 e5                	mov    %esp,%ebp
  10130e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101311:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101318:	eb 08                	jmp    101322 <serial_putc_sub+0x1b>
        delay();
  10131a:	e8 08 fb ff ff       	call   100e27 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10131f:	ff 45 fc             	incl   -0x4(%ebp)
  101322:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101328:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10132c:	89 c2                	mov    %eax,%edx
  10132e:	ec                   	in     (%dx),%al
  10132f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101332:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101336:	0f b6 c0             	movzbl %al,%eax
  101339:	83 e0 20             	and    $0x20,%eax
  10133c:	85 c0                	test   %eax,%eax
  10133e:	75 09                	jne    101349 <serial_putc_sub+0x42>
  101340:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101347:	7e d1                	jle    10131a <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101349:	8b 45 08             	mov    0x8(%ebp),%eax
  10134c:	0f b6 c0             	movzbl %al,%eax
  10134f:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101355:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101358:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10135c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101360:	ee                   	out    %al,(%dx)
}
  101361:	90                   	nop
}
  101362:	90                   	nop
  101363:	c9                   	leave  
  101364:	c3                   	ret    

00101365 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101365:	f3 0f 1e fb          	endbr32 
  101369:	55                   	push   %ebp
  10136a:	89 e5                	mov    %esp,%ebp
  10136c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10136f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101373:	74 0d                	je     101382 <serial_putc+0x1d>
        serial_putc_sub(c);
  101375:	8b 45 08             	mov    0x8(%ebp),%eax
  101378:	89 04 24             	mov    %eax,(%esp)
  10137b:	e8 87 ff ff ff       	call   101307 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101380:	eb 24                	jmp    1013a6 <serial_putc+0x41>
        serial_putc_sub('\b');
  101382:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101389:	e8 79 ff ff ff       	call   101307 <serial_putc_sub>
        serial_putc_sub(' ');
  10138e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101395:	e8 6d ff ff ff       	call   101307 <serial_putc_sub>
        serial_putc_sub('\b');
  10139a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013a1:	e8 61 ff ff ff       	call   101307 <serial_putc_sub>
}
  1013a6:	90                   	nop
  1013a7:	c9                   	leave  
  1013a8:	c3                   	ret    

001013a9 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013a9:	f3 0f 1e fb          	endbr32 
  1013ad:	55                   	push   %ebp
  1013ae:	89 e5                	mov    %esp,%ebp
  1013b0:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013b3:	eb 33                	jmp    1013e8 <cons_intr+0x3f>
        if (c != 0) {
  1013b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013b9:	74 2d                	je     1013e8 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013bb:	a1 84 00 11 00       	mov    0x110084,%eax
  1013c0:	8d 50 01             	lea    0x1(%eax),%edx
  1013c3:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013cc:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013d2:	a1 84 00 11 00       	mov    0x110084,%eax
  1013d7:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013dc:	75 0a                	jne    1013e8 <cons_intr+0x3f>
                cons.wpos = 0;
  1013de:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013e5:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1013eb:	ff d0                	call   *%eax
  1013ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013f0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013f4:	75 bf                	jne    1013b5 <cons_intr+0xc>
            }
        }
    }
}
  1013f6:	90                   	nop
  1013f7:	90                   	nop
  1013f8:	c9                   	leave  
  1013f9:	c3                   	ret    

001013fa <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013fa:	f3 0f 1e fb          	endbr32 
  1013fe:	55                   	push   %ebp
  1013ff:	89 e5                	mov    %esp,%ebp
  101401:	83 ec 10             	sub    $0x10,%esp
  101404:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10140a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10140e:	89 c2                	mov    %eax,%edx
  101410:	ec                   	in     (%dx),%al
  101411:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101414:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101418:	0f b6 c0             	movzbl %al,%eax
  10141b:	83 e0 01             	and    $0x1,%eax
  10141e:	85 c0                	test   %eax,%eax
  101420:	75 07                	jne    101429 <serial_proc_data+0x2f>
        return -1;
  101422:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101427:	eb 2a                	jmp    101453 <serial_proc_data+0x59>
  101429:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10142f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101433:	89 c2                	mov    %eax,%edx
  101435:	ec                   	in     (%dx),%al
  101436:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101439:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10143d:	0f b6 c0             	movzbl %al,%eax
  101440:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101443:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101447:	75 07                	jne    101450 <serial_proc_data+0x56>
        c = '\b';
  101449:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101450:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101453:	c9                   	leave  
  101454:	c3                   	ret    

00101455 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101455:	f3 0f 1e fb          	endbr32 
  101459:	55                   	push   %ebp
  10145a:	89 e5                	mov    %esp,%ebp
  10145c:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10145f:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101464:	85 c0                	test   %eax,%eax
  101466:	74 0c                	je     101474 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101468:	c7 04 24 fa 13 10 00 	movl   $0x1013fa,(%esp)
  10146f:	e8 35 ff ff ff       	call   1013a9 <cons_intr>
    }
}
  101474:	90                   	nop
  101475:	c9                   	leave  
  101476:	c3                   	ret    

00101477 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101477:	f3 0f 1e fb          	endbr32 
  10147b:	55                   	push   %ebp
  10147c:	89 e5                	mov    %esp,%ebp
  10147e:	83 ec 38             	sub    $0x38,%esp
  101481:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101487:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10148a:	89 c2                	mov    %eax,%edx
  10148c:	ec                   	in     (%dx),%al
  10148d:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101494:	0f b6 c0             	movzbl %al,%eax
  101497:	83 e0 01             	and    $0x1,%eax
  10149a:	85 c0                	test   %eax,%eax
  10149c:	75 0a                	jne    1014a8 <kbd_proc_data+0x31>
        return -1;
  10149e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014a3:	e9 56 01 00 00       	jmp    1015fe <kbd_proc_data+0x187>
  1014a8:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014b1:	89 c2                	mov    %eax,%edx
  1014b3:	ec                   	in     (%dx),%al
  1014b4:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014b7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014bb:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014be:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014c2:	75 17                	jne    1014db <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014c4:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c9:	83 c8 40             	or     $0x40,%eax
  1014cc:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014d1:	b8 00 00 00 00       	mov    $0x0,%eax
  1014d6:	e9 23 01 00 00       	jmp    1015fe <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014db:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014df:	84 c0                	test   %al,%al
  1014e1:	79 45                	jns    101528 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014e3:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e8:	83 e0 40             	and    $0x40,%eax
  1014eb:	85 c0                	test   %eax,%eax
  1014ed:	75 08                	jne    1014f7 <kbd_proc_data+0x80>
  1014ef:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f3:	24 7f                	and    $0x7f,%al
  1014f5:	eb 04                	jmp    1014fb <kbd_proc_data+0x84>
  1014f7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014fb:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014fe:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101502:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101509:	0c 40                	or     $0x40,%al
  10150b:	0f b6 c0             	movzbl %al,%eax
  10150e:	f7 d0                	not    %eax
  101510:	89 c2                	mov    %eax,%edx
  101512:	a1 88 00 11 00       	mov    0x110088,%eax
  101517:	21 d0                	and    %edx,%eax
  101519:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10151e:	b8 00 00 00 00       	mov    $0x0,%eax
  101523:	e9 d6 00 00 00       	jmp    1015fe <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101528:	a1 88 00 11 00       	mov    0x110088,%eax
  10152d:	83 e0 40             	and    $0x40,%eax
  101530:	85 c0                	test   %eax,%eax
  101532:	74 11                	je     101545 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101534:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101538:	a1 88 00 11 00       	mov    0x110088,%eax
  10153d:	83 e0 bf             	and    $0xffffffbf,%eax
  101540:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101545:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101549:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101550:	0f b6 d0             	movzbl %al,%edx
  101553:	a1 88 00 11 00       	mov    0x110088,%eax
  101558:	09 d0                	or     %edx,%eax
  10155a:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10155f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101563:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  10156a:	0f b6 d0             	movzbl %al,%edx
  10156d:	a1 88 00 11 00       	mov    0x110088,%eax
  101572:	31 d0                	xor    %edx,%eax
  101574:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101579:	a1 88 00 11 00       	mov    0x110088,%eax
  10157e:	83 e0 03             	and    $0x3,%eax
  101581:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101588:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10158c:	01 d0                	add    %edx,%eax
  10158e:	0f b6 00             	movzbl (%eax),%eax
  101591:	0f b6 c0             	movzbl %al,%eax
  101594:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101597:	a1 88 00 11 00       	mov    0x110088,%eax
  10159c:	83 e0 08             	and    $0x8,%eax
  10159f:	85 c0                	test   %eax,%eax
  1015a1:	74 22                	je     1015c5 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1015a3:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015a7:	7e 0c                	jle    1015b5 <kbd_proc_data+0x13e>
  1015a9:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015ad:	7f 06                	jg     1015b5 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015af:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015b3:	eb 10                	jmp    1015c5 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015b5:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015b9:	7e 0a                	jle    1015c5 <kbd_proc_data+0x14e>
  1015bb:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015bf:	7f 04                	jg     1015c5 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015c1:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015c5:	a1 88 00 11 00       	mov    0x110088,%eax
  1015ca:	f7 d0                	not    %eax
  1015cc:	83 e0 06             	and    $0x6,%eax
  1015cf:	85 c0                	test   %eax,%eax
  1015d1:	75 28                	jne    1015fb <kbd_proc_data+0x184>
  1015d3:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015da:	75 1f                	jne    1015fb <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015dc:	c7 04 24 0d 39 10 00 	movl   $0x10390d,(%esp)
  1015e3:	e8 9c ec ff ff       	call   100284 <cprintf>
  1015e8:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015ee:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015f2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015f6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015f9:	ee                   	out    %al,(%dx)
}
  1015fa:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015fe:	c9                   	leave  
  1015ff:	c3                   	ret    

00101600 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101600:	f3 0f 1e fb          	endbr32 
  101604:	55                   	push   %ebp
  101605:	89 e5                	mov    %esp,%ebp
  101607:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10160a:	c7 04 24 77 14 10 00 	movl   $0x101477,(%esp)
  101611:	e8 93 fd ff ff       	call   1013a9 <cons_intr>
}
  101616:	90                   	nop
  101617:	c9                   	leave  
  101618:	c3                   	ret    

00101619 <kbd_init>:

static void
kbd_init(void) {
  101619:	f3 0f 1e fb          	endbr32 
  10161d:	55                   	push   %ebp
  10161e:	89 e5                	mov    %esp,%ebp
  101620:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101623:	e8 d8 ff ff ff       	call   101600 <kbd_intr>
    pic_enable(IRQ_KBD);
  101628:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10162f:	e8 21 01 00 00       	call   101755 <pic_enable>
}
  101634:	90                   	nop
  101635:	c9                   	leave  
  101636:	c3                   	ret    

00101637 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101637:	f3 0f 1e fb          	endbr32 
  10163b:	55                   	push   %ebp
  10163c:	89 e5                	mov    %esp,%ebp
  10163e:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101641:	e8 2e f8 ff ff       	call   100e74 <cga_init>
    serial_init();
  101646:	e8 13 f9 ff ff       	call   100f5e <serial_init>
    kbd_init();
  10164b:	e8 c9 ff ff ff       	call   101619 <kbd_init>
    if (!serial_exists) {
  101650:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101655:	85 c0                	test   %eax,%eax
  101657:	75 0c                	jne    101665 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101659:	c7 04 24 19 39 10 00 	movl   $0x103919,(%esp)
  101660:	e8 1f ec ff ff       	call   100284 <cprintf>
    }
}
  101665:	90                   	nop
  101666:	c9                   	leave  
  101667:	c3                   	ret    

00101668 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101668:	f3 0f 1e fb          	endbr32 
  10166c:	55                   	push   %ebp
  10166d:	89 e5                	mov    %esp,%ebp
  10166f:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101672:	8b 45 08             	mov    0x8(%ebp),%eax
  101675:	89 04 24             	mov    %eax,(%esp)
  101678:	e8 50 fa ff ff       	call   1010cd <lpt_putc>
    cga_putc(c);
  10167d:	8b 45 08             	mov    0x8(%ebp),%eax
  101680:	89 04 24             	mov    %eax,(%esp)
  101683:	e8 89 fa ff ff       	call   101111 <cga_putc>
    serial_putc(c);
  101688:	8b 45 08             	mov    0x8(%ebp),%eax
  10168b:	89 04 24             	mov    %eax,(%esp)
  10168e:	e8 d2 fc ff ff       	call   101365 <serial_putc>
}
  101693:	90                   	nop
  101694:	c9                   	leave  
  101695:	c3                   	ret    

00101696 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101696:	f3 0f 1e fb          	endbr32 
  10169a:	55                   	push   %ebp
  10169b:	89 e5                	mov    %esp,%ebp
  10169d:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016a0:	e8 b0 fd ff ff       	call   101455 <serial_intr>
    kbd_intr();
  1016a5:	e8 56 ff ff ff       	call   101600 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016aa:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016b0:	a1 84 00 11 00       	mov    0x110084,%eax
  1016b5:	39 c2                	cmp    %eax,%edx
  1016b7:	74 36                	je     1016ef <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016b9:	a1 80 00 11 00       	mov    0x110080,%eax
  1016be:	8d 50 01             	lea    0x1(%eax),%edx
  1016c1:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016c7:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016ce:	0f b6 c0             	movzbl %al,%eax
  1016d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016d4:	a1 80 00 11 00       	mov    0x110080,%eax
  1016d9:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016de:	75 0a                	jne    1016ea <cons_getc+0x54>
            cons.rpos = 0;
  1016e0:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016e7:	00 00 00 
        }
        return c;
  1016ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016ed:	eb 05                	jmp    1016f4 <cons_getc+0x5e>
    }
    return 0;
  1016ef:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016f4:	c9                   	leave  
  1016f5:	c3                   	ret    

001016f6 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016f6:	f3 0f 1e fb          	endbr32 
  1016fa:	55                   	push   %ebp
  1016fb:	89 e5                	mov    %esp,%ebp
  1016fd:	83 ec 14             	sub    $0x14,%esp
  101700:	8b 45 08             	mov    0x8(%ebp),%eax
  101703:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101707:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10170a:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  101710:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101715:	85 c0                	test   %eax,%eax
  101717:	74 39                	je     101752 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101719:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10171c:	0f b6 c0             	movzbl %al,%eax
  10171f:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101725:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101728:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10172c:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101730:	ee                   	out    %al,(%dx)
}
  101731:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101732:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101736:	c1 e8 08             	shr    $0x8,%eax
  101739:	0f b7 c0             	movzwl %ax,%eax
  10173c:	0f b6 c0             	movzbl %al,%eax
  10173f:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101745:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101748:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10174c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101750:	ee                   	out    %al,(%dx)
}
  101751:	90                   	nop
    }
}
  101752:	90                   	nop
  101753:	c9                   	leave  
  101754:	c3                   	ret    

00101755 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101755:	f3 0f 1e fb          	endbr32 
  101759:	55                   	push   %ebp
  10175a:	89 e5                	mov    %esp,%ebp
  10175c:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10175f:	8b 45 08             	mov    0x8(%ebp),%eax
  101762:	ba 01 00 00 00       	mov    $0x1,%edx
  101767:	88 c1                	mov    %al,%cl
  101769:	d3 e2                	shl    %cl,%edx
  10176b:	89 d0                	mov    %edx,%eax
  10176d:	98                   	cwtl   
  10176e:	f7 d0                	not    %eax
  101770:	0f bf d0             	movswl %ax,%edx
  101773:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10177a:	98                   	cwtl   
  10177b:	21 d0                	and    %edx,%eax
  10177d:	98                   	cwtl   
  10177e:	0f b7 c0             	movzwl %ax,%eax
  101781:	89 04 24             	mov    %eax,(%esp)
  101784:	e8 6d ff ff ff       	call   1016f6 <pic_setmask>
}
  101789:	90                   	nop
  10178a:	c9                   	leave  
  10178b:	c3                   	ret    

0010178c <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10178c:	f3 0f 1e fb          	endbr32 
  101790:	55                   	push   %ebp
  101791:	89 e5                	mov    %esp,%ebp
  101793:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101796:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  10179d:	00 00 00 
  1017a0:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017a6:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017aa:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017ae:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017b2:	ee                   	out    %al,(%dx)
}
  1017b3:	90                   	nop
  1017b4:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017ba:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017be:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017c2:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017c6:	ee                   	out    %al,(%dx)
}
  1017c7:	90                   	nop
  1017c8:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017ce:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d2:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017d6:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017da:	ee                   	out    %al,(%dx)
}
  1017db:	90                   	nop
  1017dc:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017e2:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e6:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017ea:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017ee:	ee                   	out    %al,(%dx)
}
  1017ef:	90                   	nop
  1017f0:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017f6:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017fa:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017fe:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101802:	ee                   	out    %al,(%dx)
}
  101803:	90                   	nop
  101804:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10180a:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101812:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101816:	ee                   	out    %al,(%dx)
}
  101817:	90                   	nop
  101818:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10181e:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101822:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101826:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10182a:	ee                   	out    %al,(%dx)
}
  10182b:	90                   	nop
  10182c:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101832:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101836:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10183a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10183e:	ee                   	out    %al,(%dx)
}
  10183f:	90                   	nop
  101840:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101846:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10184a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10184e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101852:	ee                   	out    %al,(%dx)
}
  101853:	90                   	nop
  101854:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10185a:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10185e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101862:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101866:	ee                   	out    %al,(%dx)
}
  101867:	90                   	nop
  101868:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10186e:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101872:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101876:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10187a:	ee                   	out    %al,(%dx)
}
  10187b:	90                   	nop
  10187c:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101882:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101886:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10188a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10188e:	ee                   	out    %al,(%dx)
}
  10188f:	90                   	nop
  101890:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101896:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10189a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10189e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018a2:	ee                   	out    %al,(%dx)
}
  1018a3:	90                   	nop
  1018a4:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018aa:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018ae:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018b2:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018b6:	ee                   	out    %al,(%dx)
}
  1018b7:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018b8:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018bf:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018c4:	74 0f                	je     1018d5 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018c6:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018cd:	89 04 24             	mov    %eax,(%esp)
  1018d0:	e8 21 fe ff ff       	call   1016f6 <pic_setmask>
    }
}
  1018d5:	90                   	nop
  1018d6:	c9                   	leave  
  1018d7:	c3                   	ret    

001018d8 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018d8:	f3 0f 1e fb          	endbr32 
  1018dc:	55                   	push   %ebp
  1018dd:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018df:	fb                   	sti    
}
  1018e0:	90                   	nop
    sti();
}
  1018e1:	90                   	nop
  1018e2:	5d                   	pop    %ebp
  1018e3:	c3                   	ret    

001018e4 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018e4:	f3 0f 1e fb          	endbr32 
  1018e8:	55                   	push   %ebp
  1018e9:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018eb:	fa                   	cli    
}
  1018ec:	90                   	nop
    cli();
}
  1018ed:	90                   	nop
  1018ee:	5d                   	pop    %ebp
  1018ef:	c3                   	ret    

001018f0 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018f0:	f3 0f 1e fb          	endbr32 
  1018f4:	55                   	push   %ebp
  1018f5:	89 e5                	mov    %esp,%ebp
  1018f7:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018fa:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101901:	00 
  101902:	c7 04 24 40 39 10 00 	movl   $0x103940,(%esp)
  101909:	e8 76 e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10190e:	90                   	nop
  10190f:	c9                   	leave  
  101910:	c3                   	ret    

00101911 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101911:	f3 0f 1e fb          	endbr32 
  101915:	55                   	push   %ebp
  101916:	89 e5                	mov    %esp,%ebp
  101918:	83 ec 10             	sub    $0x10,%esp
      *     You can use  "extern uintptr_t __vectors[];" to define this extern variable which will be used later.*/
      extern uintptr_t __vectors[];
      int index;
      /* (2) Now you should setup the entries of ISR in Interrupt Description Table (IDT).
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT*/
      auto size_of_idt = sizeof(idt)/sizeof(struct gatedesc);
  10191b:	c7 45 f8 00 01 00 00 	movl   $0x100,-0x8(%ebp)
      for(index=0;index<size_of_idt;index++){
  101922:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101929:	e9 c4 00 00 00       	jmp    1019f2 <idt_init+0xe1>
          SETGATE(idt[index], 0, GD_KTEXT, __vectors[index], DPL_KERNEL);
  10192e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101931:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101938:	0f b7 d0             	movzwl %ax,%edx
  10193b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193e:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101945:	00 
  101946:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101949:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  101950:	00 08 00 
  101953:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101956:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10195d:	00 
  10195e:	80 e2 e0             	and    $0xe0,%dl
  101961:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101968:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10196b:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101972:	00 
  101973:	80 e2 1f             	and    $0x1f,%dl
  101976:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  10197d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101980:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101987:	00 
  101988:	80 e2 f0             	and    $0xf0,%dl
  10198b:	80 ca 0e             	or     $0xe,%dl
  10198e:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  101995:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101998:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  10199f:	00 
  1019a0:	80 e2 ef             	and    $0xef,%dl
  1019a3:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019ad:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019b4:	00 
  1019b5:	80 e2 9f             	and    $0x9f,%dl
  1019b8:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019c2:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019c9:	00 
  1019ca:	80 ca 80             	or     $0x80,%dl
  1019cd:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019d7:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019de:	c1 e8 10             	shr    $0x10,%eax
  1019e1:	0f b7 d0             	movzwl %ax,%edx
  1019e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e7:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  1019ee:	00 
      for(index=0;index<size_of_idt;index++){
  1019ef:	ff 45 fc             	incl   -0x4(%ebp)
  1019f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1019f8:	0f 8c 30 ff ff ff    	jl     10192e <idt_init+0x1d>
      }
      /* (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  1019fe:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a03:	0f b7 c0             	movzwl %ax,%eax
  101a06:	66 a3 68 04 11 00    	mov    %ax,0x110468
  101a0c:	66 c7 05 6a 04 11 00 	movw   $0x8,0x11046a
  101a13:	08 00 
  101a15:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a1c:	24 e0                	and    $0xe0,%al
  101a1e:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a23:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a2a:	24 1f                	and    $0x1f,%al
  101a2c:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a31:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a38:	24 f0                	and    $0xf0,%al
  101a3a:	0c 0e                	or     $0xe,%al
  101a3c:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a41:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a48:	24 ef                	and    $0xef,%al
  101a4a:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a4f:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a56:	0c 60                	or     $0x60,%al
  101a58:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a5d:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a64:	0c 80                	or     $0x80,%al
  101a66:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a6b:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a70:	c1 e8 10             	shr    $0x10,%eax
  101a73:	0f b7 c0             	movzwl %ax,%eax
  101a76:	66 a3 6e 04 11 00    	mov    %ax,0x11046e
  101a7c:	c7 45 f4 60 f5 10 00 	movl   $0x10f560,-0xc(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a86:	0f 01 18             	lidtl  (%eax)
}
  101a89:	90                   	nop
      lidt(&idt_pd);
}
  101a8a:	90                   	nop
  101a8b:	c9                   	leave  
  101a8c:	c3                   	ret    

00101a8d <trapname>:

static const char *
trapname(int trapno) {
  101a8d:	f3 0f 1e fb          	endbr32 
  101a91:	55                   	push   %ebp
  101a92:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a94:	8b 45 08             	mov    0x8(%ebp),%eax
  101a97:	83 f8 13             	cmp    $0x13,%eax
  101a9a:	77 0c                	ja     101aa8 <trapname+0x1b>
        return excnames[trapno];
  101a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a9f:	8b 04 85 a0 3c 10 00 	mov    0x103ca0(,%eax,4),%eax
  101aa6:	eb 18                	jmp    101ac0 <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101aa8:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101aac:	7e 0d                	jle    101abb <trapname+0x2e>
  101aae:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ab2:	7f 07                	jg     101abb <trapname+0x2e>
        return "Hardware Interrupt";
  101ab4:	b8 4a 39 10 00       	mov    $0x10394a,%eax
  101ab9:	eb 05                	jmp    101ac0 <trapname+0x33>
    }
    return "(unknown trap)";
  101abb:	b8 5d 39 10 00       	mov    $0x10395d,%eax
}
  101ac0:	5d                   	pop    %ebp
  101ac1:	c3                   	ret    

00101ac2 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ac2:	f3 0f 1e fb          	endbr32 
  101ac6:	55                   	push   %ebp
  101ac7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ac9:	8b 45 08             	mov    0x8(%ebp),%eax
  101acc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ad0:	83 f8 08             	cmp    $0x8,%eax
  101ad3:	0f 94 c0             	sete   %al
  101ad6:	0f b6 c0             	movzbl %al,%eax
}
  101ad9:	5d                   	pop    %ebp
  101ada:	c3                   	ret    

00101adb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101adb:	f3 0f 1e fb          	endbr32 
  101adf:	55                   	push   %ebp
  101ae0:	89 e5                	mov    %esp,%ebp
  101ae2:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aec:	c7 04 24 9e 39 10 00 	movl   $0x10399e,(%esp)
  101af3:	e8 8c e7 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101af8:	8b 45 08             	mov    0x8(%ebp),%eax
  101afb:	89 04 24             	mov    %eax,(%esp)
  101afe:	e8 8d 01 00 00       	call   101c90 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b03:	8b 45 08             	mov    0x8(%ebp),%eax
  101b06:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b0a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b0e:	c7 04 24 af 39 10 00 	movl   $0x1039af,(%esp)
  101b15:	e8 6a e7 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1d:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b21:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b25:	c7 04 24 c2 39 10 00 	movl   $0x1039c2,(%esp)
  101b2c:	e8 53 e7 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b31:	8b 45 08             	mov    0x8(%ebp),%eax
  101b34:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b38:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b3c:	c7 04 24 d5 39 10 00 	movl   $0x1039d5,(%esp)
  101b43:	e8 3c e7 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b48:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b53:	c7 04 24 e8 39 10 00 	movl   $0x1039e8,(%esp)
  101b5a:	e8 25 e7 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b62:	8b 40 30             	mov    0x30(%eax),%eax
  101b65:	89 04 24             	mov    %eax,(%esp)
  101b68:	e8 20 ff ff ff       	call   101a8d <trapname>
  101b6d:	8b 55 08             	mov    0x8(%ebp),%edx
  101b70:	8b 52 30             	mov    0x30(%edx),%edx
  101b73:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b77:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b7b:	c7 04 24 fb 39 10 00 	movl   $0x1039fb,(%esp)
  101b82:	e8 fd e6 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b87:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8a:	8b 40 34             	mov    0x34(%eax),%eax
  101b8d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b91:	c7 04 24 0d 3a 10 00 	movl   $0x103a0d,(%esp)
  101b98:	e8 e7 e6 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba0:	8b 40 38             	mov    0x38(%eax),%eax
  101ba3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba7:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  101bae:	e8 d1 e6 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bb3:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bba:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bbe:	c7 04 24 2b 3a 10 00 	movl   $0x103a2b,(%esp)
  101bc5:	e8 ba e6 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bca:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcd:	8b 40 40             	mov    0x40(%eax),%eax
  101bd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd4:	c7 04 24 3e 3a 10 00 	movl   $0x103a3e,(%esp)
  101bdb:	e8 a4 e6 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101be0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101be7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101bee:	eb 3d                	jmp    101c2d <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101bf0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf3:	8b 50 40             	mov    0x40(%eax),%edx
  101bf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101bf9:	21 d0                	and    %edx,%eax
  101bfb:	85 c0                	test   %eax,%eax
  101bfd:	74 28                	je     101c27 <print_trapframe+0x14c>
  101bff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c02:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c09:	85 c0                	test   %eax,%eax
  101c0b:	74 1a                	je     101c27 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101c0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c10:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1b:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101c22:	e8 5d e6 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c27:	ff 45 f4             	incl   -0xc(%ebp)
  101c2a:	d1 65 f0             	shll   -0x10(%ebp)
  101c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c30:	83 f8 17             	cmp    $0x17,%eax
  101c33:	76 bb                	jbe    101bf0 <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c35:	8b 45 08             	mov    0x8(%ebp),%eax
  101c38:	8b 40 40             	mov    0x40(%eax),%eax
  101c3b:	c1 e8 0c             	shr    $0xc,%eax
  101c3e:	83 e0 03             	and    $0x3,%eax
  101c41:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c45:	c7 04 24 51 3a 10 00 	movl   $0x103a51,(%esp)
  101c4c:	e8 33 e6 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c51:	8b 45 08             	mov    0x8(%ebp),%eax
  101c54:	89 04 24             	mov    %eax,(%esp)
  101c57:	e8 66 fe ff ff       	call   101ac2 <trap_in_kernel>
  101c5c:	85 c0                	test   %eax,%eax
  101c5e:	75 2d                	jne    101c8d <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c60:	8b 45 08             	mov    0x8(%ebp),%eax
  101c63:	8b 40 44             	mov    0x44(%eax),%eax
  101c66:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6a:	c7 04 24 5a 3a 10 00 	movl   $0x103a5a,(%esp)
  101c71:	e8 0e e6 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c76:	8b 45 08             	mov    0x8(%ebp),%eax
  101c79:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c7d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c81:	c7 04 24 69 3a 10 00 	movl   $0x103a69,(%esp)
  101c88:	e8 f7 e5 ff ff       	call   100284 <cprintf>
    }
}
  101c8d:	90                   	nop
  101c8e:	c9                   	leave  
  101c8f:	c3                   	ret    

00101c90 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c90:	f3 0f 1e fb          	endbr32 
  101c94:	55                   	push   %ebp
  101c95:	89 e5                	mov    %esp,%ebp
  101c97:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c9a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c9d:	8b 00                	mov    (%eax),%eax
  101c9f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ca3:	c7 04 24 7c 3a 10 00 	movl   $0x103a7c,(%esp)
  101caa:	e8 d5 e5 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101caf:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb2:	8b 40 04             	mov    0x4(%eax),%eax
  101cb5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb9:	c7 04 24 8b 3a 10 00 	movl   $0x103a8b,(%esp)
  101cc0:	e8 bf e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101cc5:	8b 45 08             	mov    0x8(%ebp),%eax
  101cc8:	8b 40 08             	mov    0x8(%eax),%eax
  101ccb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ccf:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101cd6:	e8 a9 e5 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101cdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cde:	8b 40 0c             	mov    0xc(%eax),%eax
  101ce1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ce5:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101cec:	e8 93 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf4:	8b 40 10             	mov    0x10(%eax),%eax
  101cf7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cfb:	c7 04 24 b8 3a 10 00 	movl   $0x103ab8,(%esp)
  101d02:	e8 7d e5 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d07:	8b 45 08             	mov    0x8(%ebp),%eax
  101d0a:	8b 40 14             	mov    0x14(%eax),%eax
  101d0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d11:	c7 04 24 c7 3a 10 00 	movl   $0x103ac7,(%esp)
  101d18:	e8 67 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d20:	8b 40 18             	mov    0x18(%eax),%eax
  101d23:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d27:	c7 04 24 d6 3a 10 00 	movl   $0x103ad6,(%esp)
  101d2e:	e8 51 e5 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d33:	8b 45 08             	mov    0x8(%ebp),%eax
  101d36:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d39:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d3d:	c7 04 24 e5 3a 10 00 	movl   $0x103ae5,(%esp)
  101d44:	e8 3b e5 ff ff       	call   100284 <cprintf>
}
  101d49:	90                   	nop
  101d4a:	c9                   	leave  
  101d4b:	c3                   	ret    

00101d4c <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d4c:	f3 0f 1e fb          	endbr32 
  101d50:	55                   	push   %ebp
  101d51:	89 e5                	mov    %esp,%ebp
  101d53:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d56:	8b 45 08             	mov    0x8(%ebp),%eax
  101d59:	8b 40 30             	mov    0x30(%eax),%eax
  101d5c:	83 f8 79             	cmp    $0x79,%eax
  101d5f:	0f 87 cd 00 00 00    	ja     101e32 <trap_dispatch+0xe6>
  101d65:	83 f8 78             	cmp    $0x78,%eax
  101d68:	0f 83 a8 00 00 00    	jae    101e16 <trap_dispatch+0xca>
  101d6e:	83 f8 2f             	cmp    $0x2f,%eax
  101d71:	0f 87 bb 00 00 00    	ja     101e32 <trap_dispatch+0xe6>
  101d77:	83 f8 2e             	cmp    $0x2e,%eax
  101d7a:	0f 83 e7 00 00 00    	jae    101e67 <trap_dispatch+0x11b>
  101d80:	83 f8 24             	cmp    $0x24,%eax
  101d83:	74 45                	je     101dca <trap_dispatch+0x7e>
  101d85:	83 f8 24             	cmp    $0x24,%eax
  101d88:	0f 87 a4 00 00 00    	ja     101e32 <trap_dispatch+0xe6>
  101d8e:	83 f8 20             	cmp    $0x20,%eax
  101d91:	74 0a                	je     101d9d <trap_dispatch+0x51>
  101d93:	83 f8 21             	cmp    $0x21,%eax
  101d96:	74 58                	je     101df0 <trap_dispatch+0xa4>
  101d98:	e9 95 00 00 00       	jmp    101e32 <trap_dispatch+0xe6>
    case IRQ_OFFSET + IRQ_TIMER:
        /* LAB1 YOUR CODE : STEP 3 */
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c */
        ticks++;
  101d9d:	a1 08 09 11 00       	mov    0x110908,%eax
  101da2:	40                   	inc    %eax
  101da3:	a3 08 09 11 00       	mov    %eax,0x110908
         /* (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().*/
        /*if(ticks%100==0){
            print_ticks();
        }*/
        if(ticks==100){
  101da8:	a1 08 09 11 00       	mov    0x110908,%eax
  101dad:	83 f8 64             	cmp    $0x64,%eax
  101db0:	0f 85 b4 00 00 00    	jne    101e6a <trap_dispatch+0x11e>
            ticks=0;
  101db6:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  101dbd:	00 00 00 
            print_ticks();
  101dc0:	e8 2b fb ff ff       	call   1018f0 <print_ticks>
        }
         /* (3) Too Simple? Yes, I think so!
         */
        break;
  101dc5:	e9 a0 00 00 00       	jmp    101e6a <trap_dispatch+0x11e>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101dca:	e8 c7 f8 ff ff       	call   101696 <cons_getc>
  101dcf:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101dd2:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101dd6:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101dda:	89 54 24 08          	mov    %edx,0x8(%esp)
  101dde:	89 44 24 04          	mov    %eax,0x4(%esp)
  101de2:	c7 04 24 f4 3a 10 00 	movl   $0x103af4,(%esp)
  101de9:	e8 96 e4 ff ff       	call   100284 <cprintf>
        break;
  101dee:	eb 7b                	jmp    101e6b <trap_dispatch+0x11f>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101df0:	e8 a1 f8 ff ff       	call   101696 <cons_getc>
  101df5:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101df8:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101dfc:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e00:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e04:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e08:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101e0f:	e8 70 e4 ff ff       	call   100284 <cprintf>
        break;
  101e14:	eb 55                	jmp    101e6b <trap_dispatch+0x11f>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e16:	c7 44 24 08 15 3b 10 	movl   $0x103b15,0x8(%esp)
  101e1d:	00 
  101e1e:	c7 44 24 04 b2 00 00 	movl   $0xb2,0x4(%esp)
  101e25:	00 
  101e26:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101e2d:	e8 be e5 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e32:	8b 45 08             	mov    0x8(%ebp),%eax
  101e35:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e39:	83 e0 03             	and    $0x3,%eax
  101e3c:	85 c0                	test   %eax,%eax
  101e3e:	75 2b                	jne    101e6b <trap_dispatch+0x11f>
            print_trapframe(tf);
  101e40:	8b 45 08             	mov    0x8(%ebp),%eax
  101e43:	89 04 24             	mov    %eax,(%esp)
  101e46:	e8 90 fc ff ff       	call   101adb <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e4b:	c7 44 24 08 36 3b 10 	movl   $0x103b36,0x8(%esp)
  101e52:	00 
  101e53:	c7 44 24 04 bc 00 00 	movl   $0xbc,0x4(%esp)
  101e5a:	00 
  101e5b:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101e62:	e8 89 e5 ff ff       	call   1003f0 <__panic>
        break;
  101e67:	90                   	nop
  101e68:	eb 01                	jmp    101e6b <trap_dispatch+0x11f>
        break;
  101e6a:	90                   	nop
        }
    }
}
  101e6b:	90                   	nop
  101e6c:	c9                   	leave  
  101e6d:	c3                   	ret    

00101e6e <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e6e:	f3 0f 1e fb          	endbr32 
  101e72:	55                   	push   %ebp
  101e73:	89 e5                	mov    %esp,%ebp
  101e75:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e78:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7b:	89 04 24             	mov    %eax,(%esp)
  101e7e:	e8 c9 fe ff ff       	call   101d4c <trap_dispatch>
}
  101e83:	90                   	nop
  101e84:	c9                   	leave  
  101e85:	c3                   	ret    

00101e86 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101e86:	6a 00                	push   $0x0
  pushl $0
  101e88:	6a 00                	push   $0x0
  jmp __alltraps
  101e8a:	e9 69 0a 00 00       	jmp    1028f8 <__alltraps>

00101e8f <vector1>:
.globl vector1
vector1:
  pushl $0
  101e8f:	6a 00                	push   $0x0
  pushl $1
  101e91:	6a 01                	push   $0x1
  jmp __alltraps
  101e93:	e9 60 0a 00 00       	jmp    1028f8 <__alltraps>

00101e98 <vector2>:
.globl vector2
vector2:
  pushl $0
  101e98:	6a 00                	push   $0x0
  pushl $2
  101e9a:	6a 02                	push   $0x2
  jmp __alltraps
  101e9c:	e9 57 0a 00 00       	jmp    1028f8 <__alltraps>

00101ea1 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $3
  101ea3:	6a 03                	push   $0x3
  jmp __alltraps
  101ea5:	e9 4e 0a 00 00       	jmp    1028f8 <__alltraps>

00101eaa <vector4>:
.globl vector4
vector4:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $4
  101eac:	6a 04                	push   $0x4
  jmp __alltraps
  101eae:	e9 45 0a 00 00       	jmp    1028f8 <__alltraps>

00101eb3 <vector5>:
.globl vector5
vector5:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $5
  101eb5:	6a 05                	push   $0x5
  jmp __alltraps
  101eb7:	e9 3c 0a 00 00       	jmp    1028f8 <__alltraps>

00101ebc <vector6>:
.globl vector6
vector6:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $6
  101ebe:	6a 06                	push   $0x6
  jmp __alltraps
  101ec0:	e9 33 0a 00 00       	jmp    1028f8 <__alltraps>

00101ec5 <vector7>:
.globl vector7
vector7:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $7
  101ec7:	6a 07                	push   $0x7
  jmp __alltraps
  101ec9:	e9 2a 0a 00 00       	jmp    1028f8 <__alltraps>

00101ece <vector8>:
.globl vector8
vector8:
  pushl $8
  101ece:	6a 08                	push   $0x8
  jmp __alltraps
  101ed0:	e9 23 0a 00 00       	jmp    1028f8 <__alltraps>

00101ed5 <vector9>:
.globl vector9
vector9:
  pushl $0
  101ed5:	6a 00                	push   $0x0
  pushl $9
  101ed7:	6a 09                	push   $0x9
  jmp __alltraps
  101ed9:	e9 1a 0a 00 00       	jmp    1028f8 <__alltraps>

00101ede <vector10>:
.globl vector10
vector10:
  pushl $10
  101ede:	6a 0a                	push   $0xa
  jmp __alltraps
  101ee0:	e9 13 0a 00 00       	jmp    1028f8 <__alltraps>

00101ee5 <vector11>:
.globl vector11
vector11:
  pushl $11
  101ee5:	6a 0b                	push   $0xb
  jmp __alltraps
  101ee7:	e9 0c 0a 00 00       	jmp    1028f8 <__alltraps>

00101eec <vector12>:
.globl vector12
vector12:
  pushl $12
  101eec:	6a 0c                	push   $0xc
  jmp __alltraps
  101eee:	e9 05 0a 00 00       	jmp    1028f8 <__alltraps>

00101ef3 <vector13>:
.globl vector13
vector13:
  pushl $13
  101ef3:	6a 0d                	push   $0xd
  jmp __alltraps
  101ef5:	e9 fe 09 00 00       	jmp    1028f8 <__alltraps>

00101efa <vector14>:
.globl vector14
vector14:
  pushl $14
  101efa:	6a 0e                	push   $0xe
  jmp __alltraps
  101efc:	e9 f7 09 00 00       	jmp    1028f8 <__alltraps>

00101f01 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f01:	6a 00                	push   $0x0
  pushl $15
  101f03:	6a 0f                	push   $0xf
  jmp __alltraps
  101f05:	e9 ee 09 00 00       	jmp    1028f8 <__alltraps>

00101f0a <vector16>:
.globl vector16
vector16:
  pushl $0
  101f0a:	6a 00                	push   $0x0
  pushl $16
  101f0c:	6a 10                	push   $0x10
  jmp __alltraps
  101f0e:	e9 e5 09 00 00       	jmp    1028f8 <__alltraps>

00101f13 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f13:	6a 11                	push   $0x11
  jmp __alltraps
  101f15:	e9 de 09 00 00       	jmp    1028f8 <__alltraps>

00101f1a <vector18>:
.globl vector18
vector18:
  pushl $0
  101f1a:	6a 00                	push   $0x0
  pushl $18
  101f1c:	6a 12                	push   $0x12
  jmp __alltraps
  101f1e:	e9 d5 09 00 00       	jmp    1028f8 <__alltraps>

00101f23 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f23:	6a 00                	push   $0x0
  pushl $19
  101f25:	6a 13                	push   $0x13
  jmp __alltraps
  101f27:	e9 cc 09 00 00       	jmp    1028f8 <__alltraps>

00101f2c <vector20>:
.globl vector20
vector20:
  pushl $0
  101f2c:	6a 00                	push   $0x0
  pushl $20
  101f2e:	6a 14                	push   $0x14
  jmp __alltraps
  101f30:	e9 c3 09 00 00       	jmp    1028f8 <__alltraps>

00101f35 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f35:	6a 00                	push   $0x0
  pushl $21
  101f37:	6a 15                	push   $0x15
  jmp __alltraps
  101f39:	e9 ba 09 00 00       	jmp    1028f8 <__alltraps>

00101f3e <vector22>:
.globl vector22
vector22:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $22
  101f40:	6a 16                	push   $0x16
  jmp __alltraps
  101f42:	e9 b1 09 00 00       	jmp    1028f8 <__alltraps>

00101f47 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $23
  101f49:	6a 17                	push   $0x17
  jmp __alltraps
  101f4b:	e9 a8 09 00 00       	jmp    1028f8 <__alltraps>

00101f50 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $24
  101f52:	6a 18                	push   $0x18
  jmp __alltraps
  101f54:	e9 9f 09 00 00       	jmp    1028f8 <__alltraps>

00101f59 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $25
  101f5b:	6a 19                	push   $0x19
  jmp __alltraps
  101f5d:	e9 96 09 00 00       	jmp    1028f8 <__alltraps>

00101f62 <vector26>:
.globl vector26
vector26:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $26
  101f64:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f66:	e9 8d 09 00 00       	jmp    1028f8 <__alltraps>

00101f6b <vector27>:
.globl vector27
vector27:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $27
  101f6d:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f6f:	e9 84 09 00 00       	jmp    1028f8 <__alltraps>

00101f74 <vector28>:
.globl vector28
vector28:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $28
  101f76:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f78:	e9 7b 09 00 00       	jmp    1028f8 <__alltraps>

00101f7d <vector29>:
.globl vector29
vector29:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $29
  101f7f:	6a 1d                	push   $0x1d
  jmp __alltraps
  101f81:	e9 72 09 00 00       	jmp    1028f8 <__alltraps>

00101f86 <vector30>:
.globl vector30
vector30:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $30
  101f88:	6a 1e                	push   $0x1e
  jmp __alltraps
  101f8a:	e9 69 09 00 00       	jmp    1028f8 <__alltraps>

00101f8f <vector31>:
.globl vector31
vector31:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $31
  101f91:	6a 1f                	push   $0x1f
  jmp __alltraps
  101f93:	e9 60 09 00 00       	jmp    1028f8 <__alltraps>

00101f98 <vector32>:
.globl vector32
vector32:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $32
  101f9a:	6a 20                	push   $0x20
  jmp __alltraps
  101f9c:	e9 57 09 00 00       	jmp    1028f8 <__alltraps>

00101fa1 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $33
  101fa3:	6a 21                	push   $0x21
  jmp __alltraps
  101fa5:	e9 4e 09 00 00       	jmp    1028f8 <__alltraps>

00101faa <vector34>:
.globl vector34
vector34:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $34
  101fac:	6a 22                	push   $0x22
  jmp __alltraps
  101fae:	e9 45 09 00 00       	jmp    1028f8 <__alltraps>

00101fb3 <vector35>:
.globl vector35
vector35:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $35
  101fb5:	6a 23                	push   $0x23
  jmp __alltraps
  101fb7:	e9 3c 09 00 00       	jmp    1028f8 <__alltraps>

00101fbc <vector36>:
.globl vector36
vector36:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $36
  101fbe:	6a 24                	push   $0x24
  jmp __alltraps
  101fc0:	e9 33 09 00 00       	jmp    1028f8 <__alltraps>

00101fc5 <vector37>:
.globl vector37
vector37:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $37
  101fc7:	6a 25                	push   $0x25
  jmp __alltraps
  101fc9:	e9 2a 09 00 00       	jmp    1028f8 <__alltraps>

00101fce <vector38>:
.globl vector38
vector38:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $38
  101fd0:	6a 26                	push   $0x26
  jmp __alltraps
  101fd2:	e9 21 09 00 00       	jmp    1028f8 <__alltraps>

00101fd7 <vector39>:
.globl vector39
vector39:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $39
  101fd9:	6a 27                	push   $0x27
  jmp __alltraps
  101fdb:	e9 18 09 00 00       	jmp    1028f8 <__alltraps>

00101fe0 <vector40>:
.globl vector40
vector40:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $40
  101fe2:	6a 28                	push   $0x28
  jmp __alltraps
  101fe4:	e9 0f 09 00 00       	jmp    1028f8 <__alltraps>

00101fe9 <vector41>:
.globl vector41
vector41:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $41
  101feb:	6a 29                	push   $0x29
  jmp __alltraps
  101fed:	e9 06 09 00 00       	jmp    1028f8 <__alltraps>

00101ff2 <vector42>:
.globl vector42
vector42:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $42
  101ff4:	6a 2a                	push   $0x2a
  jmp __alltraps
  101ff6:	e9 fd 08 00 00       	jmp    1028f8 <__alltraps>

00101ffb <vector43>:
.globl vector43
vector43:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $43
  101ffd:	6a 2b                	push   $0x2b
  jmp __alltraps
  101fff:	e9 f4 08 00 00       	jmp    1028f8 <__alltraps>

00102004 <vector44>:
.globl vector44
vector44:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $44
  102006:	6a 2c                	push   $0x2c
  jmp __alltraps
  102008:	e9 eb 08 00 00       	jmp    1028f8 <__alltraps>

0010200d <vector45>:
.globl vector45
vector45:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $45
  10200f:	6a 2d                	push   $0x2d
  jmp __alltraps
  102011:	e9 e2 08 00 00       	jmp    1028f8 <__alltraps>

00102016 <vector46>:
.globl vector46
vector46:
  pushl $0
  102016:	6a 00                	push   $0x0
  pushl $46
  102018:	6a 2e                	push   $0x2e
  jmp __alltraps
  10201a:	e9 d9 08 00 00       	jmp    1028f8 <__alltraps>

0010201f <vector47>:
.globl vector47
vector47:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $47
  102021:	6a 2f                	push   $0x2f
  jmp __alltraps
  102023:	e9 d0 08 00 00       	jmp    1028f8 <__alltraps>

00102028 <vector48>:
.globl vector48
vector48:
  pushl $0
  102028:	6a 00                	push   $0x0
  pushl $48
  10202a:	6a 30                	push   $0x30
  jmp __alltraps
  10202c:	e9 c7 08 00 00       	jmp    1028f8 <__alltraps>

00102031 <vector49>:
.globl vector49
vector49:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $49
  102033:	6a 31                	push   $0x31
  jmp __alltraps
  102035:	e9 be 08 00 00       	jmp    1028f8 <__alltraps>

0010203a <vector50>:
.globl vector50
vector50:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $50
  10203c:	6a 32                	push   $0x32
  jmp __alltraps
  10203e:	e9 b5 08 00 00       	jmp    1028f8 <__alltraps>

00102043 <vector51>:
.globl vector51
vector51:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $51
  102045:	6a 33                	push   $0x33
  jmp __alltraps
  102047:	e9 ac 08 00 00       	jmp    1028f8 <__alltraps>

0010204c <vector52>:
.globl vector52
vector52:
  pushl $0
  10204c:	6a 00                	push   $0x0
  pushl $52
  10204e:	6a 34                	push   $0x34
  jmp __alltraps
  102050:	e9 a3 08 00 00       	jmp    1028f8 <__alltraps>

00102055 <vector53>:
.globl vector53
vector53:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $53
  102057:	6a 35                	push   $0x35
  jmp __alltraps
  102059:	e9 9a 08 00 00       	jmp    1028f8 <__alltraps>

0010205e <vector54>:
.globl vector54
vector54:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $54
  102060:	6a 36                	push   $0x36
  jmp __alltraps
  102062:	e9 91 08 00 00       	jmp    1028f8 <__alltraps>

00102067 <vector55>:
.globl vector55
vector55:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $55
  102069:	6a 37                	push   $0x37
  jmp __alltraps
  10206b:	e9 88 08 00 00       	jmp    1028f8 <__alltraps>

00102070 <vector56>:
.globl vector56
vector56:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $56
  102072:	6a 38                	push   $0x38
  jmp __alltraps
  102074:	e9 7f 08 00 00       	jmp    1028f8 <__alltraps>

00102079 <vector57>:
.globl vector57
vector57:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $57
  10207b:	6a 39                	push   $0x39
  jmp __alltraps
  10207d:	e9 76 08 00 00       	jmp    1028f8 <__alltraps>

00102082 <vector58>:
.globl vector58
vector58:
  pushl $0
  102082:	6a 00                	push   $0x0
  pushl $58
  102084:	6a 3a                	push   $0x3a
  jmp __alltraps
  102086:	e9 6d 08 00 00       	jmp    1028f8 <__alltraps>

0010208b <vector59>:
.globl vector59
vector59:
  pushl $0
  10208b:	6a 00                	push   $0x0
  pushl $59
  10208d:	6a 3b                	push   $0x3b
  jmp __alltraps
  10208f:	e9 64 08 00 00       	jmp    1028f8 <__alltraps>

00102094 <vector60>:
.globl vector60
vector60:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $60
  102096:	6a 3c                	push   $0x3c
  jmp __alltraps
  102098:	e9 5b 08 00 00       	jmp    1028f8 <__alltraps>

0010209d <vector61>:
.globl vector61
vector61:
  pushl $0
  10209d:	6a 00                	push   $0x0
  pushl $61
  10209f:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020a1:	e9 52 08 00 00       	jmp    1028f8 <__alltraps>

001020a6 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020a6:	6a 00                	push   $0x0
  pushl $62
  1020a8:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020aa:	e9 49 08 00 00       	jmp    1028f8 <__alltraps>

001020af <vector63>:
.globl vector63
vector63:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $63
  1020b1:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020b3:	e9 40 08 00 00       	jmp    1028f8 <__alltraps>

001020b8 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $64
  1020ba:	6a 40                	push   $0x40
  jmp __alltraps
  1020bc:	e9 37 08 00 00       	jmp    1028f8 <__alltraps>

001020c1 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020c1:	6a 00                	push   $0x0
  pushl $65
  1020c3:	6a 41                	push   $0x41
  jmp __alltraps
  1020c5:	e9 2e 08 00 00       	jmp    1028f8 <__alltraps>

001020ca <vector66>:
.globl vector66
vector66:
  pushl $0
  1020ca:	6a 00                	push   $0x0
  pushl $66
  1020cc:	6a 42                	push   $0x42
  jmp __alltraps
  1020ce:	e9 25 08 00 00       	jmp    1028f8 <__alltraps>

001020d3 <vector67>:
.globl vector67
vector67:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $67
  1020d5:	6a 43                	push   $0x43
  jmp __alltraps
  1020d7:	e9 1c 08 00 00       	jmp    1028f8 <__alltraps>

001020dc <vector68>:
.globl vector68
vector68:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $68
  1020de:	6a 44                	push   $0x44
  jmp __alltraps
  1020e0:	e9 13 08 00 00       	jmp    1028f8 <__alltraps>

001020e5 <vector69>:
.globl vector69
vector69:
  pushl $0
  1020e5:	6a 00                	push   $0x0
  pushl $69
  1020e7:	6a 45                	push   $0x45
  jmp __alltraps
  1020e9:	e9 0a 08 00 00       	jmp    1028f8 <__alltraps>

001020ee <vector70>:
.globl vector70
vector70:
  pushl $0
  1020ee:	6a 00                	push   $0x0
  pushl $70
  1020f0:	6a 46                	push   $0x46
  jmp __alltraps
  1020f2:	e9 01 08 00 00       	jmp    1028f8 <__alltraps>

001020f7 <vector71>:
.globl vector71
vector71:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $71
  1020f9:	6a 47                	push   $0x47
  jmp __alltraps
  1020fb:	e9 f8 07 00 00       	jmp    1028f8 <__alltraps>

00102100 <vector72>:
.globl vector72
vector72:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $72
  102102:	6a 48                	push   $0x48
  jmp __alltraps
  102104:	e9 ef 07 00 00       	jmp    1028f8 <__alltraps>

00102109 <vector73>:
.globl vector73
vector73:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $73
  10210b:	6a 49                	push   $0x49
  jmp __alltraps
  10210d:	e9 e6 07 00 00       	jmp    1028f8 <__alltraps>

00102112 <vector74>:
.globl vector74
vector74:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $74
  102114:	6a 4a                	push   $0x4a
  jmp __alltraps
  102116:	e9 dd 07 00 00       	jmp    1028f8 <__alltraps>

0010211b <vector75>:
.globl vector75
vector75:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $75
  10211d:	6a 4b                	push   $0x4b
  jmp __alltraps
  10211f:	e9 d4 07 00 00       	jmp    1028f8 <__alltraps>

00102124 <vector76>:
.globl vector76
vector76:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $76
  102126:	6a 4c                	push   $0x4c
  jmp __alltraps
  102128:	e9 cb 07 00 00       	jmp    1028f8 <__alltraps>

0010212d <vector77>:
.globl vector77
vector77:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $77
  10212f:	6a 4d                	push   $0x4d
  jmp __alltraps
  102131:	e9 c2 07 00 00       	jmp    1028f8 <__alltraps>

00102136 <vector78>:
.globl vector78
vector78:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $78
  102138:	6a 4e                	push   $0x4e
  jmp __alltraps
  10213a:	e9 b9 07 00 00       	jmp    1028f8 <__alltraps>

0010213f <vector79>:
.globl vector79
vector79:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $79
  102141:	6a 4f                	push   $0x4f
  jmp __alltraps
  102143:	e9 b0 07 00 00       	jmp    1028f8 <__alltraps>

00102148 <vector80>:
.globl vector80
vector80:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $80
  10214a:	6a 50                	push   $0x50
  jmp __alltraps
  10214c:	e9 a7 07 00 00       	jmp    1028f8 <__alltraps>

00102151 <vector81>:
.globl vector81
vector81:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $81
  102153:	6a 51                	push   $0x51
  jmp __alltraps
  102155:	e9 9e 07 00 00       	jmp    1028f8 <__alltraps>

0010215a <vector82>:
.globl vector82
vector82:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $82
  10215c:	6a 52                	push   $0x52
  jmp __alltraps
  10215e:	e9 95 07 00 00       	jmp    1028f8 <__alltraps>

00102163 <vector83>:
.globl vector83
vector83:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $83
  102165:	6a 53                	push   $0x53
  jmp __alltraps
  102167:	e9 8c 07 00 00       	jmp    1028f8 <__alltraps>

0010216c <vector84>:
.globl vector84
vector84:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $84
  10216e:	6a 54                	push   $0x54
  jmp __alltraps
  102170:	e9 83 07 00 00       	jmp    1028f8 <__alltraps>

00102175 <vector85>:
.globl vector85
vector85:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $85
  102177:	6a 55                	push   $0x55
  jmp __alltraps
  102179:	e9 7a 07 00 00       	jmp    1028f8 <__alltraps>

0010217e <vector86>:
.globl vector86
vector86:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $86
  102180:	6a 56                	push   $0x56
  jmp __alltraps
  102182:	e9 71 07 00 00       	jmp    1028f8 <__alltraps>

00102187 <vector87>:
.globl vector87
vector87:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $87
  102189:	6a 57                	push   $0x57
  jmp __alltraps
  10218b:	e9 68 07 00 00       	jmp    1028f8 <__alltraps>

00102190 <vector88>:
.globl vector88
vector88:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $88
  102192:	6a 58                	push   $0x58
  jmp __alltraps
  102194:	e9 5f 07 00 00       	jmp    1028f8 <__alltraps>

00102199 <vector89>:
.globl vector89
vector89:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $89
  10219b:	6a 59                	push   $0x59
  jmp __alltraps
  10219d:	e9 56 07 00 00       	jmp    1028f8 <__alltraps>

001021a2 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $90
  1021a4:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021a6:	e9 4d 07 00 00       	jmp    1028f8 <__alltraps>

001021ab <vector91>:
.globl vector91
vector91:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $91
  1021ad:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021af:	e9 44 07 00 00       	jmp    1028f8 <__alltraps>

001021b4 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $92
  1021b6:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021b8:	e9 3b 07 00 00       	jmp    1028f8 <__alltraps>

001021bd <vector93>:
.globl vector93
vector93:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $93
  1021bf:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021c1:	e9 32 07 00 00       	jmp    1028f8 <__alltraps>

001021c6 <vector94>:
.globl vector94
vector94:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $94
  1021c8:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021ca:	e9 29 07 00 00       	jmp    1028f8 <__alltraps>

001021cf <vector95>:
.globl vector95
vector95:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $95
  1021d1:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021d3:	e9 20 07 00 00       	jmp    1028f8 <__alltraps>

001021d8 <vector96>:
.globl vector96
vector96:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $96
  1021da:	6a 60                	push   $0x60
  jmp __alltraps
  1021dc:	e9 17 07 00 00       	jmp    1028f8 <__alltraps>

001021e1 <vector97>:
.globl vector97
vector97:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $97
  1021e3:	6a 61                	push   $0x61
  jmp __alltraps
  1021e5:	e9 0e 07 00 00       	jmp    1028f8 <__alltraps>

001021ea <vector98>:
.globl vector98
vector98:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $98
  1021ec:	6a 62                	push   $0x62
  jmp __alltraps
  1021ee:	e9 05 07 00 00       	jmp    1028f8 <__alltraps>

001021f3 <vector99>:
.globl vector99
vector99:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $99
  1021f5:	6a 63                	push   $0x63
  jmp __alltraps
  1021f7:	e9 fc 06 00 00       	jmp    1028f8 <__alltraps>

001021fc <vector100>:
.globl vector100
vector100:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $100
  1021fe:	6a 64                	push   $0x64
  jmp __alltraps
  102200:	e9 f3 06 00 00       	jmp    1028f8 <__alltraps>

00102205 <vector101>:
.globl vector101
vector101:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $101
  102207:	6a 65                	push   $0x65
  jmp __alltraps
  102209:	e9 ea 06 00 00       	jmp    1028f8 <__alltraps>

0010220e <vector102>:
.globl vector102
vector102:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $102
  102210:	6a 66                	push   $0x66
  jmp __alltraps
  102212:	e9 e1 06 00 00       	jmp    1028f8 <__alltraps>

00102217 <vector103>:
.globl vector103
vector103:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $103
  102219:	6a 67                	push   $0x67
  jmp __alltraps
  10221b:	e9 d8 06 00 00       	jmp    1028f8 <__alltraps>

00102220 <vector104>:
.globl vector104
vector104:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $104
  102222:	6a 68                	push   $0x68
  jmp __alltraps
  102224:	e9 cf 06 00 00       	jmp    1028f8 <__alltraps>

00102229 <vector105>:
.globl vector105
vector105:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $105
  10222b:	6a 69                	push   $0x69
  jmp __alltraps
  10222d:	e9 c6 06 00 00       	jmp    1028f8 <__alltraps>

00102232 <vector106>:
.globl vector106
vector106:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $106
  102234:	6a 6a                	push   $0x6a
  jmp __alltraps
  102236:	e9 bd 06 00 00       	jmp    1028f8 <__alltraps>

0010223b <vector107>:
.globl vector107
vector107:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $107
  10223d:	6a 6b                	push   $0x6b
  jmp __alltraps
  10223f:	e9 b4 06 00 00       	jmp    1028f8 <__alltraps>

00102244 <vector108>:
.globl vector108
vector108:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $108
  102246:	6a 6c                	push   $0x6c
  jmp __alltraps
  102248:	e9 ab 06 00 00       	jmp    1028f8 <__alltraps>

0010224d <vector109>:
.globl vector109
vector109:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $109
  10224f:	6a 6d                	push   $0x6d
  jmp __alltraps
  102251:	e9 a2 06 00 00       	jmp    1028f8 <__alltraps>

00102256 <vector110>:
.globl vector110
vector110:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $110
  102258:	6a 6e                	push   $0x6e
  jmp __alltraps
  10225a:	e9 99 06 00 00       	jmp    1028f8 <__alltraps>

0010225f <vector111>:
.globl vector111
vector111:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $111
  102261:	6a 6f                	push   $0x6f
  jmp __alltraps
  102263:	e9 90 06 00 00       	jmp    1028f8 <__alltraps>

00102268 <vector112>:
.globl vector112
vector112:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $112
  10226a:	6a 70                	push   $0x70
  jmp __alltraps
  10226c:	e9 87 06 00 00       	jmp    1028f8 <__alltraps>

00102271 <vector113>:
.globl vector113
vector113:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $113
  102273:	6a 71                	push   $0x71
  jmp __alltraps
  102275:	e9 7e 06 00 00       	jmp    1028f8 <__alltraps>

0010227a <vector114>:
.globl vector114
vector114:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $114
  10227c:	6a 72                	push   $0x72
  jmp __alltraps
  10227e:	e9 75 06 00 00       	jmp    1028f8 <__alltraps>

00102283 <vector115>:
.globl vector115
vector115:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $115
  102285:	6a 73                	push   $0x73
  jmp __alltraps
  102287:	e9 6c 06 00 00       	jmp    1028f8 <__alltraps>

0010228c <vector116>:
.globl vector116
vector116:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $116
  10228e:	6a 74                	push   $0x74
  jmp __alltraps
  102290:	e9 63 06 00 00       	jmp    1028f8 <__alltraps>

00102295 <vector117>:
.globl vector117
vector117:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $117
  102297:	6a 75                	push   $0x75
  jmp __alltraps
  102299:	e9 5a 06 00 00       	jmp    1028f8 <__alltraps>

0010229e <vector118>:
.globl vector118
vector118:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $118
  1022a0:	6a 76                	push   $0x76
  jmp __alltraps
  1022a2:	e9 51 06 00 00       	jmp    1028f8 <__alltraps>

001022a7 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $119
  1022a9:	6a 77                	push   $0x77
  jmp __alltraps
  1022ab:	e9 48 06 00 00       	jmp    1028f8 <__alltraps>

001022b0 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $120
  1022b2:	6a 78                	push   $0x78
  jmp __alltraps
  1022b4:	e9 3f 06 00 00       	jmp    1028f8 <__alltraps>

001022b9 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $121
  1022bb:	6a 79                	push   $0x79
  jmp __alltraps
  1022bd:	e9 36 06 00 00       	jmp    1028f8 <__alltraps>

001022c2 <vector122>:
.globl vector122
vector122:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $122
  1022c4:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022c6:	e9 2d 06 00 00       	jmp    1028f8 <__alltraps>

001022cb <vector123>:
.globl vector123
vector123:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $123
  1022cd:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022cf:	e9 24 06 00 00       	jmp    1028f8 <__alltraps>

001022d4 <vector124>:
.globl vector124
vector124:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $124
  1022d6:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022d8:	e9 1b 06 00 00       	jmp    1028f8 <__alltraps>

001022dd <vector125>:
.globl vector125
vector125:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $125
  1022df:	6a 7d                	push   $0x7d
  jmp __alltraps
  1022e1:	e9 12 06 00 00       	jmp    1028f8 <__alltraps>

001022e6 <vector126>:
.globl vector126
vector126:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $126
  1022e8:	6a 7e                	push   $0x7e
  jmp __alltraps
  1022ea:	e9 09 06 00 00       	jmp    1028f8 <__alltraps>

001022ef <vector127>:
.globl vector127
vector127:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $127
  1022f1:	6a 7f                	push   $0x7f
  jmp __alltraps
  1022f3:	e9 00 06 00 00       	jmp    1028f8 <__alltraps>

001022f8 <vector128>:
.globl vector128
vector128:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $128
  1022fa:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1022ff:	e9 f4 05 00 00       	jmp    1028f8 <__alltraps>

00102304 <vector129>:
.globl vector129
vector129:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $129
  102306:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10230b:	e9 e8 05 00 00       	jmp    1028f8 <__alltraps>

00102310 <vector130>:
.globl vector130
vector130:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $130
  102312:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102317:	e9 dc 05 00 00       	jmp    1028f8 <__alltraps>

0010231c <vector131>:
.globl vector131
vector131:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $131
  10231e:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102323:	e9 d0 05 00 00       	jmp    1028f8 <__alltraps>

00102328 <vector132>:
.globl vector132
vector132:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $132
  10232a:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10232f:	e9 c4 05 00 00       	jmp    1028f8 <__alltraps>

00102334 <vector133>:
.globl vector133
vector133:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $133
  102336:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10233b:	e9 b8 05 00 00       	jmp    1028f8 <__alltraps>

00102340 <vector134>:
.globl vector134
vector134:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $134
  102342:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102347:	e9 ac 05 00 00       	jmp    1028f8 <__alltraps>

0010234c <vector135>:
.globl vector135
vector135:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $135
  10234e:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102353:	e9 a0 05 00 00       	jmp    1028f8 <__alltraps>

00102358 <vector136>:
.globl vector136
vector136:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $136
  10235a:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10235f:	e9 94 05 00 00       	jmp    1028f8 <__alltraps>

00102364 <vector137>:
.globl vector137
vector137:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $137
  102366:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10236b:	e9 88 05 00 00       	jmp    1028f8 <__alltraps>

00102370 <vector138>:
.globl vector138
vector138:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $138
  102372:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102377:	e9 7c 05 00 00       	jmp    1028f8 <__alltraps>

0010237c <vector139>:
.globl vector139
vector139:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $139
  10237e:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102383:	e9 70 05 00 00       	jmp    1028f8 <__alltraps>

00102388 <vector140>:
.globl vector140
vector140:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $140
  10238a:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10238f:	e9 64 05 00 00       	jmp    1028f8 <__alltraps>

00102394 <vector141>:
.globl vector141
vector141:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $141
  102396:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10239b:	e9 58 05 00 00       	jmp    1028f8 <__alltraps>

001023a0 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $142
  1023a2:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023a7:	e9 4c 05 00 00       	jmp    1028f8 <__alltraps>

001023ac <vector143>:
.globl vector143
vector143:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $143
  1023ae:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023b3:	e9 40 05 00 00       	jmp    1028f8 <__alltraps>

001023b8 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $144
  1023ba:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023bf:	e9 34 05 00 00       	jmp    1028f8 <__alltraps>

001023c4 <vector145>:
.globl vector145
vector145:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $145
  1023c6:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023cb:	e9 28 05 00 00       	jmp    1028f8 <__alltraps>

001023d0 <vector146>:
.globl vector146
vector146:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $146
  1023d2:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023d7:	e9 1c 05 00 00       	jmp    1028f8 <__alltraps>

001023dc <vector147>:
.globl vector147
vector147:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $147
  1023de:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1023e3:	e9 10 05 00 00       	jmp    1028f8 <__alltraps>

001023e8 <vector148>:
.globl vector148
vector148:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $148
  1023ea:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1023ef:	e9 04 05 00 00       	jmp    1028f8 <__alltraps>

001023f4 <vector149>:
.globl vector149
vector149:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $149
  1023f6:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1023fb:	e9 f8 04 00 00       	jmp    1028f8 <__alltraps>

00102400 <vector150>:
.globl vector150
vector150:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $150
  102402:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102407:	e9 ec 04 00 00       	jmp    1028f8 <__alltraps>

0010240c <vector151>:
.globl vector151
vector151:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $151
  10240e:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102413:	e9 e0 04 00 00       	jmp    1028f8 <__alltraps>

00102418 <vector152>:
.globl vector152
vector152:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $152
  10241a:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10241f:	e9 d4 04 00 00       	jmp    1028f8 <__alltraps>

00102424 <vector153>:
.globl vector153
vector153:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $153
  102426:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10242b:	e9 c8 04 00 00       	jmp    1028f8 <__alltraps>

00102430 <vector154>:
.globl vector154
vector154:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $154
  102432:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102437:	e9 bc 04 00 00       	jmp    1028f8 <__alltraps>

0010243c <vector155>:
.globl vector155
vector155:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $155
  10243e:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102443:	e9 b0 04 00 00       	jmp    1028f8 <__alltraps>

00102448 <vector156>:
.globl vector156
vector156:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $156
  10244a:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10244f:	e9 a4 04 00 00       	jmp    1028f8 <__alltraps>

00102454 <vector157>:
.globl vector157
vector157:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $157
  102456:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10245b:	e9 98 04 00 00       	jmp    1028f8 <__alltraps>

00102460 <vector158>:
.globl vector158
vector158:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $158
  102462:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102467:	e9 8c 04 00 00       	jmp    1028f8 <__alltraps>

0010246c <vector159>:
.globl vector159
vector159:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $159
  10246e:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102473:	e9 80 04 00 00       	jmp    1028f8 <__alltraps>

00102478 <vector160>:
.globl vector160
vector160:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $160
  10247a:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10247f:	e9 74 04 00 00       	jmp    1028f8 <__alltraps>

00102484 <vector161>:
.globl vector161
vector161:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $161
  102486:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10248b:	e9 68 04 00 00       	jmp    1028f8 <__alltraps>

00102490 <vector162>:
.globl vector162
vector162:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $162
  102492:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102497:	e9 5c 04 00 00       	jmp    1028f8 <__alltraps>

0010249c <vector163>:
.globl vector163
vector163:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $163
  10249e:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024a3:	e9 50 04 00 00       	jmp    1028f8 <__alltraps>

001024a8 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $164
  1024aa:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024af:	e9 44 04 00 00       	jmp    1028f8 <__alltraps>

001024b4 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $165
  1024b6:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024bb:	e9 38 04 00 00       	jmp    1028f8 <__alltraps>

001024c0 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $166
  1024c2:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024c7:	e9 2c 04 00 00       	jmp    1028f8 <__alltraps>

001024cc <vector167>:
.globl vector167
vector167:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $167
  1024ce:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024d3:	e9 20 04 00 00       	jmp    1028f8 <__alltraps>

001024d8 <vector168>:
.globl vector168
vector168:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $168
  1024da:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1024df:	e9 14 04 00 00       	jmp    1028f8 <__alltraps>

001024e4 <vector169>:
.globl vector169
vector169:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $169
  1024e6:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1024eb:	e9 08 04 00 00       	jmp    1028f8 <__alltraps>

001024f0 <vector170>:
.globl vector170
vector170:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $170
  1024f2:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1024f7:	e9 fc 03 00 00       	jmp    1028f8 <__alltraps>

001024fc <vector171>:
.globl vector171
vector171:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $171
  1024fe:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102503:	e9 f0 03 00 00       	jmp    1028f8 <__alltraps>

00102508 <vector172>:
.globl vector172
vector172:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $172
  10250a:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10250f:	e9 e4 03 00 00       	jmp    1028f8 <__alltraps>

00102514 <vector173>:
.globl vector173
vector173:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $173
  102516:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10251b:	e9 d8 03 00 00       	jmp    1028f8 <__alltraps>

00102520 <vector174>:
.globl vector174
vector174:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $174
  102522:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102527:	e9 cc 03 00 00       	jmp    1028f8 <__alltraps>

0010252c <vector175>:
.globl vector175
vector175:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $175
  10252e:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102533:	e9 c0 03 00 00       	jmp    1028f8 <__alltraps>

00102538 <vector176>:
.globl vector176
vector176:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $176
  10253a:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10253f:	e9 b4 03 00 00       	jmp    1028f8 <__alltraps>

00102544 <vector177>:
.globl vector177
vector177:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $177
  102546:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10254b:	e9 a8 03 00 00       	jmp    1028f8 <__alltraps>

00102550 <vector178>:
.globl vector178
vector178:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $178
  102552:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102557:	e9 9c 03 00 00       	jmp    1028f8 <__alltraps>

0010255c <vector179>:
.globl vector179
vector179:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $179
  10255e:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102563:	e9 90 03 00 00       	jmp    1028f8 <__alltraps>

00102568 <vector180>:
.globl vector180
vector180:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $180
  10256a:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10256f:	e9 84 03 00 00       	jmp    1028f8 <__alltraps>

00102574 <vector181>:
.globl vector181
vector181:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $181
  102576:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10257b:	e9 78 03 00 00       	jmp    1028f8 <__alltraps>

00102580 <vector182>:
.globl vector182
vector182:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $182
  102582:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102587:	e9 6c 03 00 00       	jmp    1028f8 <__alltraps>

0010258c <vector183>:
.globl vector183
vector183:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $183
  10258e:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102593:	e9 60 03 00 00       	jmp    1028f8 <__alltraps>

00102598 <vector184>:
.globl vector184
vector184:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $184
  10259a:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10259f:	e9 54 03 00 00       	jmp    1028f8 <__alltraps>

001025a4 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $185
  1025a6:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025ab:	e9 48 03 00 00       	jmp    1028f8 <__alltraps>

001025b0 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $186
  1025b2:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025b7:	e9 3c 03 00 00       	jmp    1028f8 <__alltraps>

001025bc <vector187>:
.globl vector187
vector187:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $187
  1025be:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025c3:	e9 30 03 00 00       	jmp    1028f8 <__alltraps>

001025c8 <vector188>:
.globl vector188
vector188:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $188
  1025ca:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025cf:	e9 24 03 00 00       	jmp    1028f8 <__alltraps>

001025d4 <vector189>:
.globl vector189
vector189:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $189
  1025d6:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025db:	e9 18 03 00 00       	jmp    1028f8 <__alltraps>

001025e0 <vector190>:
.globl vector190
vector190:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $190
  1025e2:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1025e7:	e9 0c 03 00 00       	jmp    1028f8 <__alltraps>

001025ec <vector191>:
.globl vector191
vector191:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $191
  1025ee:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1025f3:	e9 00 03 00 00       	jmp    1028f8 <__alltraps>

001025f8 <vector192>:
.globl vector192
vector192:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $192
  1025fa:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1025ff:	e9 f4 02 00 00       	jmp    1028f8 <__alltraps>

00102604 <vector193>:
.globl vector193
vector193:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $193
  102606:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10260b:	e9 e8 02 00 00       	jmp    1028f8 <__alltraps>

00102610 <vector194>:
.globl vector194
vector194:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $194
  102612:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102617:	e9 dc 02 00 00       	jmp    1028f8 <__alltraps>

0010261c <vector195>:
.globl vector195
vector195:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $195
  10261e:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102623:	e9 d0 02 00 00       	jmp    1028f8 <__alltraps>

00102628 <vector196>:
.globl vector196
vector196:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $196
  10262a:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10262f:	e9 c4 02 00 00       	jmp    1028f8 <__alltraps>

00102634 <vector197>:
.globl vector197
vector197:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $197
  102636:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10263b:	e9 b8 02 00 00       	jmp    1028f8 <__alltraps>

00102640 <vector198>:
.globl vector198
vector198:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $198
  102642:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102647:	e9 ac 02 00 00       	jmp    1028f8 <__alltraps>

0010264c <vector199>:
.globl vector199
vector199:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $199
  10264e:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102653:	e9 a0 02 00 00       	jmp    1028f8 <__alltraps>

00102658 <vector200>:
.globl vector200
vector200:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $200
  10265a:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10265f:	e9 94 02 00 00       	jmp    1028f8 <__alltraps>

00102664 <vector201>:
.globl vector201
vector201:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $201
  102666:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10266b:	e9 88 02 00 00       	jmp    1028f8 <__alltraps>

00102670 <vector202>:
.globl vector202
vector202:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $202
  102672:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102677:	e9 7c 02 00 00       	jmp    1028f8 <__alltraps>

0010267c <vector203>:
.globl vector203
vector203:
  pushl $0
  10267c:	6a 00                	push   $0x0
  pushl $203
  10267e:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102683:	e9 70 02 00 00       	jmp    1028f8 <__alltraps>

00102688 <vector204>:
.globl vector204
vector204:
  pushl $0
  102688:	6a 00                	push   $0x0
  pushl $204
  10268a:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10268f:	e9 64 02 00 00       	jmp    1028f8 <__alltraps>

00102694 <vector205>:
.globl vector205
vector205:
  pushl $0
  102694:	6a 00                	push   $0x0
  pushl $205
  102696:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10269b:	e9 58 02 00 00       	jmp    1028f8 <__alltraps>

001026a0 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026a0:	6a 00                	push   $0x0
  pushl $206
  1026a2:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026a7:	e9 4c 02 00 00       	jmp    1028f8 <__alltraps>

001026ac <vector207>:
.globl vector207
vector207:
  pushl $0
  1026ac:	6a 00                	push   $0x0
  pushl $207
  1026ae:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026b3:	e9 40 02 00 00       	jmp    1028f8 <__alltraps>

001026b8 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026b8:	6a 00                	push   $0x0
  pushl $208
  1026ba:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026bf:	e9 34 02 00 00       	jmp    1028f8 <__alltraps>

001026c4 <vector209>:
.globl vector209
vector209:
  pushl $0
  1026c4:	6a 00                	push   $0x0
  pushl $209
  1026c6:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026cb:	e9 28 02 00 00       	jmp    1028f8 <__alltraps>

001026d0 <vector210>:
.globl vector210
vector210:
  pushl $0
  1026d0:	6a 00                	push   $0x0
  pushl $210
  1026d2:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026d7:	e9 1c 02 00 00       	jmp    1028f8 <__alltraps>

001026dc <vector211>:
.globl vector211
vector211:
  pushl $0
  1026dc:	6a 00                	push   $0x0
  pushl $211
  1026de:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1026e3:	e9 10 02 00 00       	jmp    1028f8 <__alltraps>

001026e8 <vector212>:
.globl vector212
vector212:
  pushl $0
  1026e8:	6a 00                	push   $0x0
  pushl $212
  1026ea:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1026ef:	e9 04 02 00 00       	jmp    1028f8 <__alltraps>

001026f4 <vector213>:
.globl vector213
vector213:
  pushl $0
  1026f4:	6a 00                	push   $0x0
  pushl $213
  1026f6:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1026fb:	e9 f8 01 00 00       	jmp    1028f8 <__alltraps>

00102700 <vector214>:
.globl vector214
vector214:
  pushl $0
  102700:	6a 00                	push   $0x0
  pushl $214
  102702:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102707:	e9 ec 01 00 00       	jmp    1028f8 <__alltraps>

0010270c <vector215>:
.globl vector215
vector215:
  pushl $0
  10270c:	6a 00                	push   $0x0
  pushl $215
  10270e:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102713:	e9 e0 01 00 00       	jmp    1028f8 <__alltraps>

00102718 <vector216>:
.globl vector216
vector216:
  pushl $0
  102718:	6a 00                	push   $0x0
  pushl $216
  10271a:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10271f:	e9 d4 01 00 00       	jmp    1028f8 <__alltraps>

00102724 <vector217>:
.globl vector217
vector217:
  pushl $0
  102724:	6a 00                	push   $0x0
  pushl $217
  102726:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10272b:	e9 c8 01 00 00       	jmp    1028f8 <__alltraps>

00102730 <vector218>:
.globl vector218
vector218:
  pushl $0
  102730:	6a 00                	push   $0x0
  pushl $218
  102732:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102737:	e9 bc 01 00 00       	jmp    1028f8 <__alltraps>

0010273c <vector219>:
.globl vector219
vector219:
  pushl $0
  10273c:	6a 00                	push   $0x0
  pushl $219
  10273e:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102743:	e9 b0 01 00 00       	jmp    1028f8 <__alltraps>

00102748 <vector220>:
.globl vector220
vector220:
  pushl $0
  102748:	6a 00                	push   $0x0
  pushl $220
  10274a:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10274f:	e9 a4 01 00 00       	jmp    1028f8 <__alltraps>

00102754 <vector221>:
.globl vector221
vector221:
  pushl $0
  102754:	6a 00                	push   $0x0
  pushl $221
  102756:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10275b:	e9 98 01 00 00       	jmp    1028f8 <__alltraps>

00102760 <vector222>:
.globl vector222
vector222:
  pushl $0
  102760:	6a 00                	push   $0x0
  pushl $222
  102762:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102767:	e9 8c 01 00 00       	jmp    1028f8 <__alltraps>

0010276c <vector223>:
.globl vector223
vector223:
  pushl $0
  10276c:	6a 00                	push   $0x0
  pushl $223
  10276e:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102773:	e9 80 01 00 00       	jmp    1028f8 <__alltraps>

00102778 <vector224>:
.globl vector224
vector224:
  pushl $0
  102778:	6a 00                	push   $0x0
  pushl $224
  10277a:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10277f:	e9 74 01 00 00       	jmp    1028f8 <__alltraps>

00102784 <vector225>:
.globl vector225
vector225:
  pushl $0
  102784:	6a 00                	push   $0x0
  pushl $225
  102786:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10278b:	e9 68 01 00 00       	jmp    1028f8 <__alltraps>

00102790 <vector226>:
.globl vector226
vector226:
  pushl $0
  102790:	6a 00                	push   $0x0
  pushl $226
  102792:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102797:	e9 5c 01 00 00       	jmp    1028f8 <__alltraps>

0010279c <vector227>:
.globl vector227
vector227:
  pushl $0
  10279c:	6a 00                	push   $0x0
  pushl $227
  10279e:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027a3:	e9 50 01 00 00       	jmp    1028f8 <__alltraps>

001027a8 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027a8:	6a 00                	push   $0x0
  pushl $228
  1027aa:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027af:	e9 44 01 00 00       	jmp    1028f8 <__alltraps>

001027b4 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027b4:	6a 00                	push   $0x0
  pushl $229
  1027b6:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027bb:	e9 38 01 00 00       	jmp    1028f8 <__alltraps>

001027c0 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027c0:	6a 00                	push   $0x0
  pushl $230
  1027c2:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027c7:	e9 2c 01 00 00       	jmp    1028f8 <__alltraps>

001027cc <vector231>:
.globl vector231
vector231:
  pushl $0
  1027cc:	6a 00                	push   $0x0
  pushl $231
  1027ce:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027d3:	e9 20 01 00 00       	jmp    1028f8 <__alltraps>

001027d8 <vector232>:
.globl vector232
vector232:
  pushl $0
  1027d8:	6a 00                	push   $0x0
  pushl $232
  1027da:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1027df:	e9 14 01 00 00       	jmp    1028f8 <__alltraps>

001027e4 <vector233>:
.globl vector233
vector233:
  pushl $0
  1027e4:	6a 00                	push   $0x0
  pushl $233
  1027e6:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1027eb:	e9 08 01 00 00       	jmp    1028f8 <__alltraps>

001027f0 <vector234>:
.globl vector234
vector234:
  pushl $0
  1027f0:	6a 00                	push   $0x0
  pushl $234
  1027f2:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1027f7:	e9 fc 00 00 00       	jmp    1028f8 <__alltraps>

001027fc <vector235>:
.globl vector235
vector235:
  pushl $0
  1027fc:	6a 00                	push   $0x0
  pushl $235
  1027fe:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102803:	e9 f0 00 00 00       	jmp    1028f8 <__alltraps>

00102808 <vector236>:
.globl vector236
vector236:
  pushl $0
  102808:	6a 00                	push   $0x0
  pushl $236
  10280a:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10280f:	e9 e4 00 00 00       	jmp    1028f8 <__alltraps>

00102814 <vector237>:
.globl vector237
vector237:
  pushl $0
  102814:	6a 00                	push   $0x0
  pushl $237
  102816:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10281b:	e9 d8 00 00 00       	jmp    1028f8 <__alltraps>

00102820 <vector238>:
.globl vector238
vector238:
  pushl $0
  102820:	6a 00                	push   $0x0
  pushl $238
  102822:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102827:	e9 cc 00 00 00       	jmp    1028f8 <__alltraps>

0010282c <vector239>:
.globl vector239
vector239:
  pushl $0
  10282c:	6a 00                	push   $0x0
  pushl $239
  10282e:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102833:	e9 c0 00 00 00       	jmp    1028f8 <__alltraps>

00102838 <vector240>:
.globl vector240
vector240:
  pushl $0
  102838:	6a 00                	push   $0x0
  pushl $240
  10283a:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10283f:	e9 b4 00 00 00       	jmp    1028f8 <__alltraps>

00102844 <vector241>:
.globl vector241
vector241:
  pushl $0
  102844:	6a 00                	push   $0x0
  pushl $241
  102846:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10284b:	e9 a8 00 00 00       	jmp    1028f8 <__alltraps>

00102850 <vector242>:
.globl vector242
vector242:
  pushl $0
  102850:	6a 00                	push   $0x0
  pushl $242
  102852:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102857:	e9 9c 00 00 00       	jmp    1028f8 <__alltraps>

0010285c <vector243>:
.globl vector243
vector243:
  pushl $0
  10285c:	6a 00                	push   $0x0
  pushl $243
  10285e:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102863:	e9 90 00 00 00       	jmp    1028f8 <__alltraps>

00102868 <vector244>:
.globl vector244
vector244:
  pushl $0
  102868:	6a 00                	push   $0x0
  pushl $244
  10286a:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10286f:	e9 84 00 00 00       	jmp    1028f8 <__alltraps>

00102874 <vector245>:
.globl vector245
vector245:
  pushl $0
  102874:	6a 00                	push   $0x0
  pushl $245
  102876:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10287b:	e9 78 00 00 00       	jmp    1028f8 <__alltraps>

00102880 <vector246>:
.globl vector246
vector246:
  pushl $0
  102880:	6a 00                	push   $0x0
  pushl $246
  102882:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102887:	e9 6c 00 00 00       	jmp    1028f8 <__alltraps>

0010288c <vector247>:
.globl vector247
vector247:
  pushl $0
  10288c:	6a 00                	push   $0x0
  pushl $247
  10288e:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102893:	e9 60 00 00 00       	jmp    1028f8 <__alltraps>

00102898 <vector248>:
.globl vector248
vector248:
  pushl $0
  102898:	6a 00                	push   $0x0
  pushl $248
  10289a:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10289f:	e9 54 00 00 00       	jmp    1028f8 <__alltraps>

001028a4 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028a4:	6a 00                	push   $0x0
  pushl $249
  1028a6:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028ab:	e9 48 00 00 00       	jmp    1028f8 <__alltraps>

001028b0 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028b0:	6a 00                	push   $0x0
  pushl $250
  1028b2:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028b7:	e9 3c 00 00 00       	jmp    1028f8 <__alltraps>

001028bc <vector251>:
.globl vector251
vector251:
  pushl $0
  1028bc:	6a 00                	push   $0x0
  pushl $251
  1028be:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028c3:	e9 30 00 00 00       	jmp    1028f8 <__alltraps>

001028c8 <vector252>:
.globl vector252
vector252:
  pushl $0
  1028c8:	6a 00                	push   $0x0
  pushl $252
  1028ca:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028cf:	e9 24 00 00 00       	jmp    1028f8 <__alltraps>

001028d4 <vector253>:
.globl vector253
vector253:
  pushl $0
  1028d4:	6a 00                	push   $0x0
  pushl $253
  1028d6:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028db:	e9 18 00 00 00       	jmp    1028f8 <__alltraps>

001028e0 <vector254>:
.globl vector254
vector254:
  pushl $0
  1028e0:	6a 00                	push   $0x0
  pushl $254
  1028e2:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1028e7:	e9 0c 00 00 00       	jmp    1028f8 <__alltraps>

001028ec <vector255>:
.globl vector255
vector255:
  pushl $0
  1028ec:	6a 00                	push   $0x0
  pushl $255
  1028ee:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1028f3:	e9 00 00 00 00       	jmp    1028f8 <__alltraps>

001028f8 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1028f8:	1e                   	push   %ds
    pushl %es
  1028f9:	06                   	push   %es
    pushl %fs
  1028fa:	0f a0                	push   %fs
    pushl %gs
  1028fc:	0f a8                	push   %gs
    pushal
  1028fe:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1028ff:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102904:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102906:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102908:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102909:	e8 60 f5 ff ff       	call   101e6e <trap>

    # pop the pushed stack pointer
    popl %esp
  10290e:	5c                   	pop    %esp

0010290f <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10290f:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102910:	0f a9                	pop    %gs
    popl %fs
  102912:	0f a1                	pop    %fs
    popl %es
  102914:	07                   	pop    %es
    popl %ds
  102915:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102916:	83 c4 08             	add    $0x8,%esp
    iret
  102919:	cf                   	iret   

0010291a <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10291a:	55                   	push   %ebp
  10291b:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10291d:	8b 45 08             	mov    0x8(%ebp),%eax
  102920:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102923:	b8 23 00 00 00       	mov    $0x23,%eax
  102928:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10292a:	b8 23 00 00 00       	mov    $0x23,%eax
  10292f:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102931:	b8 10 00 00 00       	mov    $0x10,%eax
  102936:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102938:	b8 10 00 00 00       	mov    $0x10,%eax
  10293d:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10293f:	b8 10 00 00 00       	mov    $0x10,%eax
  102944:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102946:	ea 4d 29 10 00 08 00 	ljmp   $0x8,$0x10294d
}
  10294d:	90                   	nop
  10294e:	5d                   	pop    %ebp
  10294f:	c3                   	ret    

00102950 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102950:	f3 0f 1e fb          	endbr32 
  102954:	55                   	push   %ebp
  102955:	89 e5                	mov    %esp,%ebp
  102957:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10295a:	b8 20 09 11 00       	mov    $0x110920,%eax
  10295f:	05 00 04 00 00       	add    $0x400,%eax
  102964:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  102969:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  102970:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102972:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102979:	68 00 
  10297b:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102980:	0f b7 c0             	movzwl %ax,%eax
  102983:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  102989:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  10298e:	c1 e8 10             	shr    $0x10,%eax
  102991:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  102996:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10299d:	24 f0                	and    $0xf0,%al
  10299f:	0c 09                	or     $0x9,%al
  1029a1:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029a6:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029ad:	0c 10                	or     $0x10,%al
  1029af:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029b4:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029bb:	24 9f                	and    $0x9f,%al
  1029bd:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029c2:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029c9:	0c 80                	or     $0x80,%al
  1029cb:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029d0:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029d7:	24 f0                	and    $0xf0,%al
  1029d9:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029de:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029e5:	24 ef                	and    $0xef,%al
  1029e7:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029ec:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029f3:	24 df                	and    $0xdf,%al
  1029f5:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029fa:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a01:	0c 40                	or     $0x40,%al
  102a03:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a08:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a0f:	24 7f                	and    $0x7f,%al
  102a11:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a16:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a1b:	c1 e8 18             	shr    $0x18,%eax
  102a1e:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102a23:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a2a:	24 ef                	and    $0xef,%al
  102a2c:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a31:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102a38:	e8 dd fe ff ff       	call   10291a <lgdt>
  102a3d:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a43:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a47:	0f 00 d8             	ltr    %ax
}
  102a4a:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a4b:	90                   	nop
  102a4c:	c9                   	leave  
  102a4d:	c3                   	ret    

00102a4e <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a4e:	f3 0f 1e fb          	endbr32 
  102a52:	55                   	push   %ebp
  102a53:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a55:	e8 f6 fe ff ff       	call   102950 <gdt_init>
}
  102a5a:	90                   	nop
  102a5b:	5d                   	pop    %ebp
  102a5c:	c3                   	ret    

00102a5d <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a5d:	f3 0f 1e fb          	endbr32 
  102a61:	55                   	push   %ebp
  102a62:	89 e5                	mov    %esp,%ebp
  102a64:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a67:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a6e:	eb 03                	jmp    102a73 <strlen+0x16>
        cnt ++;
  102a70:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102a73:	8b 45 08             	mov    0x8(%ebp),%eax
  102a76:	8d 50 01             	lea    0x1(%eax),%edx
  102a79:	89 55 08             	mov    %edx,0x8(%ebp)
  102a7c:	0f b6 00             	movzbl (%eax),%eax
  102a7f:	84 c0                	test   %al,%al
  102a81:	75 ed                	jne    102a70 <strlen+0x13>
    }
    return cnt;
  102a83:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102a86:	c9                   	leave  
  102a87:	c3                   	ret    

00102a88 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102a88:	f3 0f 1e fb          	endbr32 
  102a8c:	55                   	push   %ebp
  102a8d:	89 e5                	mov    %esp,%ebp
  102a8f:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a92:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a99:	eb 03                	jmp    102a9e <strnlen+0x16>
        cnt ++;
  102a9b:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102aa1:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102aa4:	73 10                	jae    102ab6 <strnlen+0x2e>
  102aa6:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa9:	8d 50 01             	lea    0x1(%eax),%edx
  102aac:	89 55 08             	mov    %edx,0x8(%ebp)
  102aaf:	0f b6 00             	movzbl (%eax),%eax
  102ab2:	84 c0                	test   %al,%al
  102ab4:	75 e5                	jne    102a9b <strnlen+0x13>
    }
    return cnt;
  102ab6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ab9:	c9                   	leave  
  102aba:	c3                   	ret    

00102abb <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102abb:	f3 0f 1e fb          	endbr32 
  102abf:	55                   	push   %ebp
  102ac0:	89 e5                	mov    %esp,%ebp
  102ac2:	57                   	push   %edi
  102ac3:	56                   	push   %esi
  102ac4:	83 ec 20             	sub    $0x20,%esp
  102ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  102aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102acd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad0:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102ad3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ad6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ad9:	89 d1                	mov    %edx,%ecx
  102adb:	89 c2                	mov    %eax,%edx
  102add:	89 ce                	mov    %ecx,%esi
  102adf:	89 d7                	mov    %edx,%edi
  102ae1:	ac                   	lods   %ds:(%esi),%al
  102ae2:	aa                   	stos   %al,%es:(%edi)
  102ae3:	84 c0                	test   %al,%al
  102ae5:	75 fa                	jne    102ae1 <strcpy+0x26>
  102ae7:	89 fa                	mov    %edi,%edx
  102ae9:	89 f1                	mov    %esi,%ecx
  102aeb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102aee:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102af1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102af7:	83 c4 20             	add    $0x20,%esp
  102afa:	5e                   	pop    %esi
  102afb:	5f                   	pop    %edi
  102afc:	5d                   	pop    %ebp
  102afd:	c3                   	ret    

00102afe <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102afe:	f3 0f 1e fb          	endbr32 
  102b02:	55                   	push   %ebp
  102b03:	89 e5                	mov    %esp,%ebp
  102b05:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b08:	8b 45 08             	mov    0x8(%ebp),%eax
  102b0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b0e:	eb 1e                	jmp    102b2e <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102b10:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b13:	0f b6 10             	movzbl (%eax),%edx
  102b16:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b19:	88 10                	mov    %dl,(%eax)
  102b1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b1e:	0f b6 00             	movzbl (%eax),%eax
  102b21:	84 c0                	test   %al,%al
  102b23:	74 03                	je     102b28 <strncpy+0x2a>
            src ++;
  102b25:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102b28:	ff 45 fc             	incl   -0x4(%ebp)
  102b2b:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102b2e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b32:	75 dc                	jne    102b10 <strncpy+0x12>
    }
    return dst;
  102b34:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b37:	c9                   	leave  
  102b38:	c3                   	ret    

00102b39 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b39:	f3 0f 1e fb          	endbr32 
  102b3d:	55                   	push   %ebp
  102b3e:	89 e5                	mov    %esp,%ebp
  102b40:	57                   	push   %edi
  102b41:	56                   	push   %esi
  102b42:	83 ec 20             	sub    $0x20,%esp
  102b45:	8b 45 08             	mov    0x8(%ebp),%eax
  102b48:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b51:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b54:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b57:	89 d1                	mov    %edx,%ecx
  102b59:	89 c2                	mov    %eax,%edx
  102b5b:	89 ce                	mov    %ecx,%esi
  102b5d:	89 d7                	mov    %edx,%edi
  102b5f:	ac                   	lods   %ds:(%esi),%al
  102b60:	ae                   	scas   %es:(%edi),%al
  102b61:	75 08                	jne    102b6b <strcmp+0x32>
  102b63:	84 c0                	test   %al,%al
  102b65:	75 f8                	jne    102b5f <strcmp+0x26>
  102b67:	31 c0                	xor    %eax,%eax
  102b69:	eb 04                	jmp    102b6f <strcmp+0x36>
  102b6b:	19 c0                	sbb    %eax,%eax
  102b6d:	0c 01                	or     $0x1,%al
  102b6f:	89 fa                	mov    %edi,%edx
  102b71:	89 f1                	mov    %esi,%ecx
  102b73:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b76:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b79:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102b7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102b7f:	83 c4 20             	add    $0x20,%esp
  102b82:	5e                   	pop    %esi
  102b83:	5f                   	pop    %edi
  102b84:	5d                   	pop    %ebp
  102b85:	c3                   	ret    

00102b86 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102b86:	f3 0f 1e fb          	endbr32 
  102b8a:	55                   	push   %ebp
  102b8b:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b8d:	eb 09                	jmp    102b98 <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102b8f:	ff 4d 10             	decl   0x10(%ebp)
  102b92:	ff 45 08             	incl   0x8(%ebp)
  102b95:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b98:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b9c:	74 1a                	je     102bb8 <strncmp+0x32>
  102b9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba1:	0f b6 00             	movzbl (%eax),%eax
  102ba4:	84 c0                	test   %al,%al
  102ba6:	74 10                	je     102bb8 <strncmp+0x32>
  102ba8:	8b 45 08             	mov    0x8(%ebp),%eax
  102bab:	0f b6 10             	movzbl (%eax),%edx
  102bae:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bb1:	0f b6 00             	movzbl (%eax),%eax
  102bb4:	38 c2                	cmp    %al,%dl
  102bb6:	74 d7                	je     102b8f <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102bb8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bbc:	74 18                	je     102bd6 <strncmp+0x50>
  102bbe:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc1:	0f b6 00             	movzbl (%eax),%eax
  102bc4:	0f b6 d0             	movzbl %al,%edx
  102bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bca:	0f b6 00             	movzbl (%eax),%eax
  102bcd:	0f b6 c0             	movzbl %al,%eax
  102bd0:	29 c2                	sub    %eax,%edx
  102bd2:	89 d0                	mov    %edx,%eax
  102bd4:	eb 05                	jmp    102bdb <strncmp+0x55>
  102bd6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102bdb:	5d                   	pop    %ebp
  102bdc:	c3                   	ret    

00102bdd <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102bdd:	f3 0f 1e fb          	endbr32 
  102be1:	55                   	push   %ebp
  102be2:	89 e5                	mov    %esp,%ebp
  102be4:	83 ec 04             	sub    $0x4,%esp
  102be7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bea:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102bed:	eb 13                	jmp    102c02 <strchr+0x25>
        if (*s == c) {
  102bef:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf2:	0f b6 00             	movzbl (%eax),%eax
  102bf5:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102bf8:	75 05                	jne    102bff <strchr+0x22>
            return (char *)s;
  102bfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfd:	eb 12                	jmp    102c11 <strchr+0x34>
        }
        s ++;
  102bff:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c02:	8b 45 08             	mov    0x8(%ebp),%eax
  102c05:	0f b6 00             	movzbl (%eax),%eax
  102c08:	84 c0                	test   %al,%al
  102c0a:	75 e3                	jne    102bef <strchr+0x12>
    }
    return NULL;
  102c0c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c11:	c9                   	leave  
  102c12:	c3                   	ret    

00102c13 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c13:	f3 0f 1e fb          	endbr32 
  102c17:	55                   	push   %ebp
  102c18:	89 e5                	mov    %esp,%ebp
  102c1a:	83 ec 04             	sub    $0x4,%esp
  102c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c20:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c23:	eb 0e                	jmp    102c33 <strfind+0x20>
        if (*s == c) {
  102c25:	8b 45 08             	mov    0x8(%ebp),%eax
  102c28:	0f b6 00             	movzbl (%eax),%eax
  102c2b:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c2e:	74 0f                	je     102c3f <strfind+0x2c>
            break;
        }
        s ++;
  102c30:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c33:	8b 45 08             	mov    0x8(%ebp),%eax
  102c36:	0f b6 00             	movzbl (%eax),%eax
  102c39:	84 c0                	test   %al,%al
  102c3b:	75 e8                	jne    102c25 <strfind+0x12>
  102c3d:	eb 01                	jmp    102c40 <strfind+0x2d>
            break;
  102c3f:	90                   	nop
    }
    return (char *)s;
  102c40:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c43:	c9                   	leave  
  102c44:	c3                   	ret    

00102c45 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c45:	f3 0f 1e fb          	endbr32 
  102c49:	55                   	push   %ebp
  102c4a:	89 e5                	mov    %esp,%ebp
  102c4c:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c4f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c56:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c5d:	eb 03                	jmp    102c62 <strtol+0x1d>
        s ++;
  102c5f:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c62:	8b 45 08             	mov    0x8(%ebp),%eax
  102c65:	0f b6 00             	movzbl (%eax),%eax
  102c68:	3c 20                	cmp    $0x20,%al
  102c6a:	74 f3                	je     102c5f <strtol+0x1a>
  102c6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6f:	0f b6 00             	movzbl (%eax),%eax
  102c72:	3c 09                	cmp    $0x9,%al
  102c74:	74 e9                	je     102c5f <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102c76:	8b 45 08             	mov    0x8(%ebp),%eax
  102c79:	0f b6 00             	movzbl (%eax),%eax
  102c7c:	3c 2b                	cmp    $0x2b,%al
  102c7e:	75 05                	jne    102c85 <strtol+0x40>
        s ++;
  102c80:	ff 45 08             	incl   0x8(%ebp)
  102c83:	eb 14                	jmp    102c99 <strtol+0x54>
    }
    else if (*s == '-') {
  102c85:	8b 45 08             	mov    0x8(%ebp),%eax
  102c88:	0f b6 00             	movzbl (%eax),%eax
  102c8b:	3c 2d                	cmp    $0x2d,%al
  102c8d:	75 0a                	jne    102c99 <strtol+0x54>
        s ++, neg = 1;
  102c8f:	ff 45 08             	incl   0x8(%ebp)
  102c92:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102c99:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c9d:	74 06                	je     102ca5 <strtol+0x60>
  102c9f:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ca3:	75 22                	jne    102cc7 <strtol+0x82>
  102ca5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca8:	0f b6 00             	movzbl (%eax),%eax
  102cab:	3c 30                	cmp    $0x30,%al
  102cad:	75 18                	jne    102cc7 <strtol+0x82>
  102caf:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb2:	40                   	inc    %eax
  102cb3:	0f b6 00             	movzbl (%eax),%eax
  102cb6:	3c 78                	cmp    $0x78,%al
  102cb8:	75 0d                	jne    102cc7 <strtol+0x82>
        s += 2, base = 16;
  102cba:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102cbe:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102cc5:	eb 29                	jmp    102cf0 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102cc7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ccb:	75 16                	jne    102ce3 <strtol+0x9e>
  102ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd0:	0f b6 00             	movzbl (%eax),%eax
  102cd3:	3c 30                	cmp    $0x30,%al
  102cd5:	75 0c                	jne    102ce3 <strtol+0x9e>
        s ++, base = 8;
  102cd7:	ff 45 08             	incl   0x8(%ebp)
  102cda:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102ce1:	eb 0d                	jmp    102cf0 <strtol+0xab>
    }
    else if (base == 0) {
  102ce3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ce7:	75 07                	jne    102cf0 <strtol+0xab>
        base = 10;
  102ce9:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102cf0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf3:	0f b6 00             	movzbl (%eax),%eax
  102cf6:	3c 2f                	cmp    $0x2f,%al
  102cf8:	7e 1b                	jle    102d15 <strtol+0xd0>
  102cfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfd:	0f b6 00             	movzbl (%eax),%eax
  102d00:	3c 39                	cmp    $0x39,%al
  102d02:	7f 11                	jg     102d15 <strtol+0xd0>
            dig = *s - '0';
  102d04:	8b 45 08             	mov    0x8(%ebp),%eax
  102d07:	0f b6 00             	movzbl (%eax),%eax
  102d0a:	0f be c0             	movsbl %al,%eax
  102d0d:	83 e8 30             	sub    $0x30,%eax
  102d10:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d13:	eb 48                	jmp    102d5d <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d15:	8b 45 08             	mov    0x8(%ebp),%eax
  102d18:	0f b6 00             	movzbl (%eax),%eax
  102d1b:	3c 60                	cmp    $0x60,%al
  102d1d:	7e 1b                	jle    102d3a <strtol+0xf5>
  102d1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d22:	0f b6 00             	movzbl (%eax),%eax
  102d25:	3c 7a                	cmp    $0x7a,%al
  102d27:	7f 11                	jg     102d3a <strtol+0xf5>
            dig = *s - 'a' + 10;
  102d29:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2c:	0f b6 00             	movzbl (%eax),%eax
  102d2f:	0f be c0             	movsbl %al,%eax
  102d32:	83 e8 57             	sub    $0x57,%eax
  102d35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d38:	eb 23                	jmp    102d5d <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d3a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3d:	0f b6 00             	movzbl (%eax),%eax
  102d40:	3c 40                	cmp    $0x40,%al
  102d42:	7e 3b                	jle    102d7f <strtol+0x13a>
  102d44:	8b 45 08             	mov    0x8(%ebp),%eax
  102d47:	0f b6 00             	movzbl (%eax),%eax
  102d4a:	3c 5a                	cmp    $0x5a,%al
  102d4c:	7f 31                	jg     102d7f <strtol+0x13a>
            dig = *s - 'A' + 10;
  102d4e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d51:	0f b6 00             	movzbl (%eax),%eax
  102d54:	0f be c0             	movsbl %al,%eax
  102d57:	83 e8 37             	sub    $0x37,%eax
  102d5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d60:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d63:	7d 19                	jge    102d7e <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102d65:	ff 45 08             	incl   0x8(%ebp)
  102d68:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d6b:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d6f:	89 c2                	mov    %eax,%edx
  102d71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d74:	01 d0                	add    %edx,%eax
  102d76:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102d79:	e9 72 ff ff ff       	jmp    102cf0 <strtol+0xab>
            break;
  102d7e:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102d7f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d83:	74 08                	je     102d8d <strtol+0x148>
        *endptr = (char *) s;
  102d85:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d88:	8b 55 08             	mov    0x8(%ebp),%edx
  102d8b:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102d8d:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102d91:	74 07                	je     102d9a <strtol+0x155>
  102d93:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d96:	f7 d8                	neg    %eax
  102d98:	eb 03                	jmp    102d9d <strtol+0x158>
  102d9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102d9d:	c9                   	leave  
  102d9e:	c3                   	ret    

00102d9f <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102d9f:	f3 0f 1e fb          	endbr32 
  102da3:	55                   	push   %ebp
  102da4:	89 e5                	mov    %esp,%ebp
  102da6:	57                   	push   %edi
  102da7:	83 ec 24             	sub    $0x24,%esp
  102daa:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dad:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102db0:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102db4:	8b 45 08             	mov    0x8(%ebp),%eax
  102db7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102dba:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102dbd:	8b 45 10             	mov    0x10(%ebp),%eax
  102dc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102dc3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102dc6:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102dca:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102dcd:	89 d7                	mov    %edx,%edi
  102dcf:	f3 aa                	rep stos %al,%es:(%edi)
  102dd1:	89 fa                	mov    %edi,%edx
  102dd3:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dd6:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102dd9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102ddc:	83 c4 24             	add    $0x24,%esp
  102ddf:	5f                   	pop    %edi
  102de0:	5d                   	pop    %ebp
  102de1:	c3                   	ret    

00102de2 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102de2:	f3 0f 1e fb          	endbr32 
  102de6:	55                   	push   %ebp
  102de7:	89 e5                	mov    %esp,%ebp
  102de9:	57                   	push   %edi
  102dea:	56                   	push   %esi
  102deb:	53                   	push   %ebx
  102dec:	83 ec 30             	sub    $0x30,%esp
  102def:	8b 45 08             	mov    0x8(%ebp),%eax
  102df2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102df5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102df8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102dfb:	8b 45 10             	mov    0x10(%ebp),%eax
  102dfe:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e04:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e07:	73 42                	jae    102e4b <memmove+0x69>
  102e09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e12:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e15:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e18:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e1e:	c1 e8 02             	shr    $0x2,%eax
  102e21:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e23:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e26:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e29:	89 d7                	mov    %edx,%edi
  102e2b:	89 c6                	mov    %eax,%esi
  102e2d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e2f:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e32:	83 e1 03             	and    $0x3,%ecx
  102e35:	74 02                	je     102e39 <memmove+0x57>
  102e37:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e39:	89 f0                	mov    %esi,%eax
  102e3b:	89 fa                	mov    %edi,%edx
  102e3d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e40:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e43:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102e49:	eb 36                	jmp    102e81 <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e4e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e51:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e54:	01 c2                	add    %eax,%edx
  102e56:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e59:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e5f:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e62:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e65:	89 c1                	mov    %eax,%ecx
  102e67:	89 d8                	mov    %ebx,%eax
  102e69:	89 d6                	mov    %edx,%esi
  102e6b:	89 c7                	mov    %eax,%edi
  102e6d:	fd                   	std    
  102e6e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e70:	fc                   	cld    
  102e71:	89 f8                	mov    %edi,%eax
  102e73:	89 f2                	mov    %esi,%edx
  102e75:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e78:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e7b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102e7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102e81:	83 c4 30             	add    $0x30,%esp
  102e84:	5b                   	pop    %ebx
  102e85:	5e                   	pop    %esi
  102e86:	5f                   	pop    %edi
  102e87:	5d                   	pop    %ebp
  102e88:	c3                   	ret    

00102e89 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102e89:	f3 0f 1e fb          	endbr32 
  102e8d:	55                   	push   %ebp
  102e8e:	89 e5                	mov    %esp,%ebp
  102e90:	57                   	push   %edi
  102e91:	56                   	push   %esi
  102e92:	83 ec 20             	sub    $0x20,%esp
  102e95:	8b 45 08             	mov    0x8(%ebp),%eax
  102e98:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ea1:	8b 45 10             	mov    0x10(%ebp),%eax
  102ea4:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ea7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eaa:	c1 e8 02             	shr    $0x2,%eax
  102ead:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102eaf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eb5:	89 d7                	mov    %edx,%edi
  102eb7:	89 c6                	mov    %eax,%esi
  102eb9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ebb:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ebe:	83 e1 03             	and    $0x3,%ecx
  102ec1:	74 02                	je     102ec5 <memcpy+0x3c>
  102ec3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ec5:	89 f0                	mov    %esi,%eax
  102ec7:	89 fa                	mov    %edi,%edx
  102ec9:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ecc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102ecf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102ed5:	83 c4 20             	add    $0x20,%esp
  102ed8:	5e                   	pop    %esi
  102ed9:	5f                   	pop    %edi
  102eda:	5d                   	pop    %ebp
  102edb:	c3                   	ret    

00102edc <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102edc:	f3 0f 1e fb          	endbr32 
  102ee0:	55                   	push   %ebp
  102ee1:	89 e5                	mov    %esp,%ebp
  102ee3:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102ee6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102eec:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eef:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102ef2:	eb 2e                	jmp    102f22 <memcmp+0x46>
        if (*s1 != *s2) {
  102ef4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ef7:	0f b6 10             	movzbl (%eax),%edx
  102efa:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102efd:	0f b6 00             	movzbl (%eax),%eax
  102f00:	38 c2                	cmp    %al,%dl
  102f02:	74 18                	je     102f1c <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f04:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f07:	0f b6 00             	movzbl (%eax),%eax
  102f0a:	0f b6 d0             	movzbl %al,%edx
  102f0d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f10:	0f b6 00             	movzbl (%eax),%eax
  102f13:	0f b6 c0             	movzbl %al,%eax
  102f16:	29 c2                	sub    %eax,%edx
  102f18:	89 d0                	mov    %edx,%eax
  102f1a:	eb 18                	jmp    102f34 <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102f1c:	ff 45 fc             	incl   -0x4(%ebp)
  102f1f:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f22:	8b 45 10             	mov    0x10(%ebp),%eax
  102f25:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f28:	89 55 10             	mov    %edx,0x10(%ebp)
  102f2b:	85 c0                	test   %eax,%eax
  102f2d:	75 c5                	jne    102ef4 <memcmp+0x18>
    }
    return 0;
  102f2f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f34:	c9                   	leave  
  102f35:	c3                   	ret    

00102f36 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f36:	f3 0f 1e fb          	endbr32 
  102f3a:	55                   	push   %ebp
  102f3b:	89 e5                	mov    %esp,%ebp
  102f3d:	83 ec 58             	sub    $0x58,%esp
  102f40:	8b 45 10             	mov    0x10(%ebp),%eax
  102f43:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f46:	8b 45 14             	mov    0x14(%ebp),%eax
  102f49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f4c:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f4f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f52:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f55:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f58:	8b 45 18             	mov    0x18(%ebp),%eax
  102f5b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f61:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f64:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f67:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f70:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f74:	74 1c                	je     102f92 <printnum+0x5c>
  102f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f79:	ba 00 00 00 00       	mov    $0x0,%edx
  102f7e:	f7 75 e4             	divl   -0x1c(%ebp)
  102f81:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f84:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f87:	ba 00 00 00 00       	mov    $0x0,%edx
  102f8c:	f7 75 e4             	divl   -0x1c(%ebp)
  102f8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f92:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f95:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f98:	f7 75 e4             	divl   -0x1c(%ebp)
  102f9b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f9e:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fa1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fa4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fa7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102faa:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fad:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fb0:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fb3:	8b 45 18             	mov    0x18(%ebp),%eax
  102fb6:	ba 00 00 00 00       	mov    $0x0,%edx
  102fbb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102fbe:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102fc1:	19 d1                	sbb    %edx,%ecx
  102fc3:	72 4c                	jb     103011 <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fc5:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102fc8:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fcb:	8b 45 20             	mov    0x20(%ebp),%eax
  102fce:	89 44 24 18          	mov    %eax,0x18(%esp)
  102fd2:	89 54 24 14          	mov    %edx,0x14(%esp)
  102fd6:	8b 45 18             	mov    0x18(%ebp),%eax
  102fd9:	89 44 24 10          	mov    %eax,0x10(%esp)
  102fdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fe0:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fe3:	89 44 24 08          	mov    %eax,0x8(%esp)
  102fe7:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102feb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fee:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ff2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff5:	89 04 24             	mov    %eax,(%esp)
  102ff8:	e8 39 ff ff ff       	call   102f36 <printnum>
  102ffd:	eb 1b                	jmp    10301a <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102fff:	8b 45 0c             	mov    0xc(%ebp),%eax
  103002:	89 44 24 04          	mov    %eax,0x4(%esp)
  103006:	8b 45 20             	mov    0x20(%ebp),%eax
  103009:	89 04 24             	mov    %eax,(%esp)
  10300c:	8b 45 08             	mov    0x8(%ebp),%eax
  10300f:	ff d0                	call   *%eax
        while (-- width > 0)
  103011:	ff 4d 1c             	decl   0x1c(%ebp)
  103014:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103018:	7f e5                	jg     102fff <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10301a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10301d:	05 70 3d 10 00       	add    $0x103d70,%eax
  103022:	0f b6 00             	movzbl (%eax),%eax
  103025:	0f be c0             	movsbl %al,%eax
  103028:	8b 55 0c             	mov    0xc(%ebp),%edx
  10302b:	89 54 24 04          	mov    %edx,0x4(%esp)
  10302f:	89 04 24             	mov    %eax,(%esp)
  103032:	8b 45 08             	mov    0x8(%ebp),%eax
  103035:	ff d0                	call   *%eax
}
  103037:	90                   	nop
  103038:	c9                   	leave  
  103039:	c3                   	ret    

0010303a <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10303a:	f3 0f 1e fb          	endbr32 
  10303e:	55                   	push   %ebp
  10303f:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103041:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103045:	7e 14                	jle    10305b <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  103047:	8b 45 08             	mov    0x8(%ebp),%eax
  10304a:	8b 00                	mov    (%eax),%eax
  10304c:	8d 48 08             	lea    0x8(%eax),%ecx
  10304f:	8b 55 08             	mov    0x8(%ebp),%edx
  103052:	89 0a                	mov    %ecx,(%edx)
  103054:	8b 50 04             	mov    0x4(%eax),%edx
  103057:	8b 00                	mov    (%eax),%eax
  103059:	eb 30                	jmp    10308b <getuint+0x51>
    }
    else if (lflag) {
  10305b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10305f:	74 16                	je     103077 <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  103061:	8b 45 08             	mov    0x8(%ebp),%eax
  103064:	8b 00                	mov    (%eax),%eax
  103066:	8d 48 04             	lea    0x4(%eax),%ecx
  103069:	8b 55 08             	mov    0x8(%ebp),%edx
  10306c:	89 0a                	mov    %ecx,(%edx)
  10306e:	8b 00                	mov    (%eax),%eax
  103070:	ba 00 00 00 00       	mov    $0x0,%edx
  103075:	eb 14                	jmp    10308b <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  103077:	8b 45 08             	mov    0x8(%ebp),%eax
  10307a:	8b 00                	mov    (%eax),%eax
  10307c:	8d 48 04             	lea    0x4(%eax),%ecx
  10307f:	8b 55 08             	mov    0x8(%ebp),%edx
  103082:	89 0a                	mov    %ecx,(%edx)
  103084:	8b 00                	mov    (%eax),%eax
  103086:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10308b:	5d                   	pop    %ebp
  10308c:	c3                   	ret    

0010308d <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  10308d:	f3 0f 1e fb          	endbr32 
  103091:	55                   	push   %ebp
  103092:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103094:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103098:	7e 14                	jle    1030ae <getint+0x21>
        return va_arg(*ap, long long);
  10309a:	8b 45 08             	mov    0x8(%ebp),%eax
  10309d:	8b 00                	mov    (%eax),%eax
  10309f:	8d 48 08             	lea    0x8(%eax),%ecx
  1030a2:	8b 55 08             	mov    0x8(%ebp),%edx
  1030a5:	89 0a                	mov    %ecx,(%edx)
  1030a7:	8b 50 04             	mov    0x4(%eax),%edx
  1030aa:	8b 00                	mov    (%eax),%eax
  1030ac:	eb 28                	jmp    1030d6 <getint+0x49>
    }
    else if (lflag) {
  1030ae:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030b2:	74 12                	je     1030c6 <getint+0x39>
        return va_arg(*ap, long);
  1030b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b7:	8b 00                	mov    (%eax),%eax
  1030b9:	8d 48 04             	lea    0x4(%eax),%ecx
  1030bc:	8b 55 08             	mov    0x8(%ebp),%edx
  1030bf:	89 0a                	mov    %ecx,(%edx)
  1030c1:	8b 00                	mov    (%eax),%eax
  1030c3:	99                   	cltd   
  1030c4:	eb 10                	jmp    1030d6 <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1030c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c9:	8b 00                	mov    (%eax),%eax
  1030cb:	8d 48 04             	lea    0x4(%eax),%ecx
  1030ce:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d1:	89 0a                	mov    %ecx,(%edx)
  1030d3:	8b 00                	mov    (%eax),%eax
  1030d5:	99                   	cltd   
    }
}
  1030d6:	5d                   	pop    %ebp
  1030d7:	c3                   	ret    

001030d8 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030d8:	f3 0f 1e fb          	endbr32 
  1030dc:	55                   	push   %ebp
  1030dd:	89 e5                	mov    %esp,%ebp
  1030df:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1030e2:	8d 45 14             	lea    0x14(%ebp),%eax
  1030e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1030e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030eb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030ef:	8b 45 10             	mov    0x10(%ebp),%eax
  1030f2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103100:	89 04 24             	mov    %eax,(%esp)
  103103:	e8 03 00 00 00       	call   10310b <vprintfmt>
    va_end(ap);
}
  103108:	90                   	nop
  103109:	c9                   	leave  
  10310a:	c3                   	ret    

0010310b <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  10310b:	f3 0f 1e fb          	endbr32 
  10310f:	55                   	push   %ebp
  103110:	89 e5                	mov    %esp,%ebp
  103112:	56                   	push   %esi
  103113:	53                   	push   %ebx
  103114:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103117:	eb 17                	jmp    103130 <vprintfmt+0x25>
            if (ch == '\0') {
  103119:	85 db                	test   %ebx,%ebx
  10311b:	0f 84 c0 03 00 00    	je     1034e1 <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  103121:	8b 45 0c             	mov    0xc(%ebp),%eax
  103124:	89 44 24 04          	mov    %eax,0x4(%esp)
  103128:	89 1c 24             	mov    %ebx,(%esp)
  10312b:	8b 45 08             	mov    0x8(%ebp),%eax
  10312e:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103130:	8b 45 10             	mov    0x10(%ebp),%eax
  103133:	8d 50 01             	lea    0x1(%eax),%edx
  103136:	89 55 10             	mov    %edx,0x10(%ebp)
  103139:	0f b6 00             	movzbl (%eax),%eax
  10313c:	0f b6 d8             	movzbl %al,%ebx
  10313f:	83 fb 25             	cmp    $0x25,%ebx
  103142:	75 d5                	jne    103119 <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103144:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103148:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10314f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103152:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103155:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10315c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10315f:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103162:	8b 45 10             	mov    0x10(%ebp),%eax
  103165:	8d 50 01             	lea    0x1(%eax),%edx
  103168:	89 55 10             	mov    %edx,0x10(%ebp)
  10316b:	0f b6 00             	movzbl (%eax),%eax
  10316e:	0f b6 d8             	movzbl %al,%ebx
  103171:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103174:	83 f8 55             	cmp    $0x55,%eax
  103177:	0f 87 38 03 00 00    	ja     1034b5 <vprintfmt+0x3aa>
  10317d:	8b 04 85 94 3d 10 00 	mov    0x103d94(,%eax,4),%eax
  103184:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103187:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  10318b:	eb d5                	jmp    103162 <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10318d:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103191:	eb cf                	jmp    103162 <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103193:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10319a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10319d:	89 d0                	mov    %edx,%eax
  10319f:	c1 e0 02             	shl    $0x2,%eax
  1031a2:	01 d0                	add    %edx,%eax
  1031a4:	01 c0                	add    %eax,%eax
  1031a6:	01 d8                	add    %ebx,%eax
  1031a8:	83 e8 30             	sub    $0x30,%eax
  1031ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031ae:	8b 45 10             	mov    0x10(%ebp),%eax
  1031b1:	0f b6 00             	movzbl (%eax),%eax
  1031b4:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031b7:	83 fb 2f             	cmp    $0x2f,%ebx
  1031ba:	7e 38                	jle    1031f4 <vprintfmt+0xe9>
  1031bc:	83 fb 39             	cmp    $0x39,%ebx
  1031bf:	7f 33                	jg     1031f4 <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  1031c1:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1031c4:	eb d4                	jmp    10319a <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031c6:	8b 45 14             	mov    0x14(%ebp),%eax
  1031c9:	8d 50 04             	lea    0x4(%eax),%edx
  1031cc:	89 55 14             	mov    %edx,0x14(%ebp)
  1031cf:	8b 00                	mov    (%eax),%eax
  1031d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031d4:	eb 1f                	jmp    1031f5 <vprintfmt+0xea>

        case '.':
            if (width < 0)
  1031d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031da:	79 86                	jns    103162 <vprintfmt+0x57>
                width = 0;
  1031dc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031e3:	e9 7a ff ff ff       	jmp    103162 <vprintfmt+0x57>

        case '#':
            altflag = 1;
  1031e8:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1031ef:	e9 6e ff ff ff       	jmp    103162 <vprintfmt+0x57>
            goto process_precision;
  1031f4:	90                   	nop

        process_precision:
            if (width < 0)
  1031f5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031f9:	0f 89 63 ff ff ff    	jns    103162 <vprintfmt+0x57>
                width = precision, precision = -1;
  1031ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103202:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103205:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  10320c:	e9 51 ff ff ff       	jmp    103162 <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103211:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  103214:	e9 49 ff ff ff       	jmp    103162 <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103219:	8b 45 14             	mov    0x14(%ebp),%eax
  10321c:	8d 50 04             	lea    0x4(%eax),%edx
  10321f:	89 55 14             	mov    %edx,0x14(%ebp)
  103222:	8b 00                	mov    (%eax),%eax
  103224:	8b 55 0c             	mov    0xc(%ebp),%edx
  103227:	89 54 24 04          	mov    %edx,0x4(%esp)
  10322b:	89 04 24             	mov    %eax,(%esp)
  10322e:	8b 45 08             	mov    0x8(%ebp),%eax
  103231:	ff d0                	call   *%eax
            break;
  103233:	e9 a4 02 00 00       	jmp    1034dc <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103238:	8b 45 14             	mov    0x14(%ebp),%eax
  10323b:	8d 50 04             	lea    0x4(%eax),%edx
  10323e:	89 55 14             	mov    %edx,0x14(%ebp)
  103241:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103243:	85 db                	test   %ebx,%ebx
  103245:	79 02                	jns    103249 <vprintfmt+0x13e>
                err = -err;
  103247:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103249:	83 fb 06             	cmp    $0x6,%ebx
  10324c:	7f 0b                	jg     103259 <vprintfmt+0x14e>
  10324e:	8b 34 9d 54 3d 10 00 	mov    0x103d54(,%ebx,4),%esi
  103255:	85 f6                	test   %esi,%esi
  103257:	75 23                	jne    10327c <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  103259:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  10325d:	c7 44 24 08 81 3d 10 	movl   $0x103d81,0x8(%esp)
  103264:	00 
  103265:	8b 45 0c             	mov    0xc(%ebp),%eax
  103268:	89 44 24 04          	mov    %eax,0x4(%esp)
  10326c:	8b 45 08             	mov    0x8(%ebp),%eax
  10326f:	89 04 24             	mov    %eax,(%esp)
  103272:	e8 61 fe ff ff       	call   1030d8 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103277:	e9 60 02 00 00       	jmp    1034dc <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  10327c:	89 74 24 0c          	mov    %esi,0xc(%esp)
  103280:	c7 44 24 08 8a 3d 10 	movl   $0x103d8a,0x8(%esp)
  103287:	00 
  103288:	8b 45 0c             	mov    0xc(%ebp),%eax
  10328b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10328f:	8b 45 08             	mov    0x8(%ebp),%eax
  103292:	89 04 24             	mov    %eax,(%esp)
  103295:	e8 3e fe ff ff       	call   1030d8 <printfmt>
            break;
  10329a:	e9 3d 02 00 00       	jmp    1034dc <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  10329f:	8b 45 14             	mov    0x14(%ebp),%eax
  1032a2:	8d 50 04             	lea    0x4(%eax),%edx
  1032a5:	89 55 14             	mov    %edx,0x14(%ebp)
  1032a8:	8b 30                	mov    (%eax),%esi
  1032aa:	85 f6                	test   %esi,%esi
  1032ac:	75 05                	jne    1032b3 <vprintfmt+0x1a8>
                p = "(null)";
  1032ae:	be 8d 3d 10 00       	mov    $0x103d8d,%esi
            }
            if (width > 0 && padc != '-') {
  1032b3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032b7:	7e 76                	jle    10332f <vprintfmt+0x224>
  1032b9:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032bd:	74 70                	je     10332f <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032c6:	89 34 24             	mov    %esi,(%esp)
  1032c9:	e8 ba f7 ff ff       	call   102a88 <strnlen>
  1032ce:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032d1:	29 c2                	sub    %eax,%edx
  1032d3:	89 d0                	mov    %edx,%eax
  1032d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032d8:	eb 16                	jmp    1032f0 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  1032da:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032de:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032e1:	89 54 24 04          	mov    %edx,0x4(%esp)
  1032e5:	89 04 24             	mov    %eax,(%esp)
  1032e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032eb:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032ed:	ff 4d e8             	decl   -0x18(%ebp)
  1032f0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032f4:	7f e4                	jg     1032da <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032f6:	eb 37                	jmp    10332f <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  1032f8:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1032fc:	74 1f                	je     10331d <vprintfmt+0x212>
  1032fe:	83 fb 1f             	cmp    $0x1f,%ebx
  103301:	7e 05                	jle    103308 <vprintfmt+0x1fd>
  103303:	83 fb 7e             	cmp    $0x7e,%ebx
  103306:	7e 15                	jle    10331d <vprintfmt+0x212>
                    putch('?', putdat);
  103308:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10330f:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103316:	8b 45 08             	mov    0x8(%ebp),%eax
  103319:	ff d0                	call   *%eax
  10331b:	eb 0f                	jmp    10332c <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  10331d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103320:	89 44 24 04          	mov    %eax,0x4(%esp)
  103324:	89 1c 24             	mov    %ebx,(%esp)
  103327:	8b 45 08             	mov    0x8(%ebp),%eax
  10332a:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10332c:	ff 4d e8             	decl   -0x18(%ebp)
  10332f:	89 f0                	mov    %esi,%eax
  103331:	8d 70 01             	lea    0x1(%eax),%esi
  103334:	0f b6 00             	movzbl (%eax),%eax
  103337:	0f be d8             	movsbl %al,%ebx
  10333a:	85 db                	test   %ebx,%ebx
  10333c:	74 27                	je     103365 <vprintfmt+0x25a>
  10333e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103342:	78 b4                	js     1032f8 <vprintfmt+0x1ed>
  103344:	ff 4d e4             	decl   -0x1c(%ebp)
  103347:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10334b:	79 ab                	jns    1032f8 <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  10334d:	eb 16                	jmp    103365 <vprintfmt+0x25a>
                putch(' ', putdat);
  10334f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103352:	89 44 24 04          	mov    %eax,0x4(%esp)
  103356:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10335d:	8b 45 08             	mov    0x8(%ebp),%eax
  103360:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  103362:	ff 4d e8             	decl   -0x18(%ebp)
  103365:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103369:	7f e4                	jg     10334f <vprintfmt+0x244>
            }
            break;
  10336b:	e9 6c 01 00 00       	jmp    1034dc <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103370:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103373:	89 44 24 04          	mov    %eax,0x4(%esp)
  103377:	8d 45 14             	lea    0x14(%ebp),%eax
  10337a:	89 04 24             	mov    %eax,(%esp)
  10337d:	e8 0b fd ff ff       	call   10308d <getint>
  103382:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103385:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103388:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10338b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10338e:	85 d2                	test   %edx,%edx
  103390:	79 26                	jns    1033b8 <vprintfmt+0x2ad>
                putch('-', putdat);
  103392:	8b 45 0c             	mov    0xc(%ebp),%eax
  103395:	89 44 24 04          	mov    %eax,0x4(%esp)
  103399:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a3:	ff d0                	call   *%eax
                num = -(long long)num;
  1033a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033ab:	f7 d8                	neg    %eax
  1033ad:	83 d2 00             	adc    $0x0,%edx
  1033b0:	f7 da                	neg    %edx
  1033b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033b5:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033b8:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033bf:	e9 a8 00 00 00       	jmp    10346c <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033c7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033cb:	8d 45 14             	lea    0x14(%ebp),%eax
  1033ce:	89 04 24             	mov    %eax,(%esp)
  1033d1:	e8 64 fc ff ff       	call   10303a <getuint>
  1033d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033d9:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033dc:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033e3:	e9 84 00 00 00       	jmp    10346c <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1033e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033ef:	8d 45 14             	lea    0x14(%ebp),%eax
  1033f2:	89 04 24             	mov    %eax,(%esp)
  1033f5:	e8 40 fc ff ff       	call   10303a <getuint>
  1033fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033fd:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103400:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103407:	eb 63                	jmp    10346c <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  103409:	8b 45 0c             	mov    0xc(%ebp),%eax
  10340c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103410:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103417:	8b 45 08             	mov    0x8(%ebp),%eax
  10341a:	ff d0                	call   *%eax
            putch('x', putdat);
  10341c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10341f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103423:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  10342a:	8b 45 08             	mov    0x8(%ebp),%eax
  10342d:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10342f:	8b 45 14             	mov    0x14(%ebp),%eax
  103432:	8d 50 04             	lea    0x4(%eax),%edx
  103435:	89 55 14             	mov    %edx,0x14(%ebp)
  103438:	8b 00                	mov    (%eax),%eax
  10343a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10343d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103444:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  10344b:	eb 1f                	jmp    10346c <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10344d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103450:	89 44 24 04          	mov    %eax,0x4(%esp)
  103454:	8d 45 14             	lea    0x14(%ebp),%eax
  103457:	89 04 24             	mov    %eax,(%esp)
  10345a:	e8 db fb ff ff       	call   10303a <getuint>
  10345f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103462:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103465:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  10346c:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103470:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103473:	89 54 24 18          	mov    %edx,0x18(%esp)
  103477:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10347a:	89 54 24 14          	mov    %edx,0x14(%esp)
  10347e:	89 44 24 10          	mov    %eax,0x10(%esp)
  103482:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103485:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103488:	89 44 24 08          	mov    %eax,0x8(%esp)
  10348c:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103490:	8b 45 0c             	mov    0xc(%ebp),%eax
  103493:	89 44 24 04          	mov    %eax,0x4(%esp)
  103497:	8b 45 08             	mov    0x8(%ebp),%eax
  10349a:	89 04 24             	mov    %eax,(%esp)
  10349d:	e8 94 fa ff ff       	call   102f36 <printnum>
            break;
  1034a2:	eb 38                	jmp    1034dc <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034ab:	89 1c 24             	mov    %ebx,(%esp)
  1034ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b1:	ff d0                	call   *%eax
            break;
  1034b3:	eb 27                	jmp    1034dc <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034bc:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c6:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034c8:	ff 4d 10             	decl   0x10(%ebp)
  1034cb:	eb 03                	jmp    1034d0 <vprintfmt+0x3c5>
  1034cd:	ff 4d 10             	decl   0x10(%ebp)
  1034d0:	8b 45 10             	mov    0x10(%ebp),%eax
  1034d3:	48                   	dec    %eax
  1034d4:	0f b6 00             	movzbl (%eax),%eax
  1034d7:	3c 25                	cmp    $0x25,%al
  1034d9:	75 f2                	jne    1034cd <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  1034db:	90                   	nop
    while (1) {
  1034dc:	e9 36 fc ff ff       	jmp    103117 <vprintfmt+0xc>
                return;
  1034e1:	90                   	nop
        }
    }
}
  1034e2:	83 c4 40             	add    $0x40,%esp
  1034e5:	5b                   	pop    %ebx
  1034e6:	5e                   	pop    %esi
  1034e7:	5d                   	pop    %ebp
  1034e8:	c3                   	ret    

001034e9 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1034e9:	f3 0f 1e fb          	endbr32 
  1034ed:	55                   	push   %ebp
  1034ee:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1034f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f3:	8b 40 08             	mov    0x8(%eax),%eax
  1034f6:	8d 50 01             	lea    0x1(%eax),%edx
  1034f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034fc:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1034ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  103502:	8b 10                	mov    (%eax),%edx
  103504:	8b 45 0c             	mov    0xc(%ebp),%eax
  103507:	8b 40 04             	mov    0x4(%eax),%eax
  10350a:	39 c2                	cmp    %eax,%edx
  10350c:	73 12                	jae    103520 <sprintputch+0x37>
        *b->buf ++ = ch;
  10350e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103511:	8b 00                	mov    (%eax),%eax
  103513:	8d 48 01             	lea    0x1(%eax),%ecx
  103516:	8b 55 0c             	mov    0xc(%ebp),%edx
  103519:	89 0a                	mov    %ecx,(%edx)
  10351b:	8b 55 08             	mov    0x8(%ebp),%edx
  10351e:	88 10                	mov    %dl,(%eax)
    }
}
  103520:	90                   	nop
  103521:	5d                   	pop    %ebp
  103522:	c3                   	ret    

00103523 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103523:	f3 0f 1e fb          	endbr32 
  103527:	55                   	push   %ebp
  103528:	89 e5                	mov    %esp,%ebp
  10352a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10352d:	8d 45 14             	lea    0x14(%ebp),%eax
  103530:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103533:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103536:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10353a:	8b 45 10             	mov    0x10(%ebp),%eax
  10353d:	89 44 24 08          	mov    %eax,0x8(%esp)
  103541:	8b 45 0c             	mov    0xc(%ebp),%eax
  103544:	89 44 24 04          	mov    %eax,0x4(%esp)
  103548:	8b 45 08             	mov    0x8(%ebp),%eax
  10354b:	89 04 24             	mov    %eax,(%esp)
  10354e:	e8 08 00 00 00       	call   10355b <vsnprintf>
  103553:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103556:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103559:	c9                   	leave  
  10355a:	c3                   	ret    

0010355b <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10355b:	f3 0f 1e fb          	endbr32 
  10355f:	55                   	push   %ebp
  103560:	89 e5                	mov    %esp,%ebp
  103562:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103565:	8b 45 08             	mov    0x8(%ebp),%eax
  103568:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10356b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10356e:	8d 50 ff             	lea    -0x1(%eax),%edx
  103571:	8b 45 08             	mov    0x8(%ebp),%eax
  103574:	01 d0                	add    %edx,%eax
  103576:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103579:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103580:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103584:	74 0a                	je     103590 <vsnprintf+0x35>
  103586:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103589:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10358c:	39 c2                	cmp    %eax,%edx
  10358e:	76 07                	jbe    103597 <vsnprintf+0x3c>
        return -E_INVAL;
  103590:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103595:	eb 2a                	jmp    1035c1 <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103597:	8b 45 14             	mov    0x14(%ebp),%eax
  10359a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10359e:	8b 45 10             	mov    0x10(%ebp),%eax
  1035a1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035a5:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035a8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035ac:	c7 04 24 e9 34 10 00 	movl   $0x1034e9,(%esp)
  1035b3:	e8 53 fb ff ff       	call   10310b <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035bb:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035be:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035c1:	c9                   	leave  
  1035c2:	c3                   	ret    
