# lab5
---
# ��ϰ0
---
�������ں�����������ñȽ϶࣬�Ѿ����ʺ���`diff`��`patch`�������������򲹶��ˣ�ֱ��ʹ��meldͼ�λ����ߣ������ݣ��Ͼ����۶Կ��ӻ��Ĺ��߸�����Ӧ��

---


---
# ��
---

��ε�ʵ�鼸���ⶼ�ǱȽϼ򵥵ģ���������˵�û����̵��л��Ǽ򵥵ģ�����ƽʱ�����Լ�˼��һ��һ���û�����������л�������һ�����̵Ĳ��۲��޸Ĵ���������֪ʶ��ʵ��ֻ��ͨ��һ���򵥵ķ������ұ�����ϵͳ"�����Դ�"��

����ʵ��5��д��һ�´���������֮������˱��������������ǰ����ʵ����û����ô���֣�������ͦ��ϧ��εĲ�Bug���ᣬ���ҵ�˼·������(��ʵ���Bug��ͷ��������ͦ�򵥵ġ�������)

��д��lab5֮�������в���core֮����������µĴ���:

```
Special kernel symbols:
  entry  0xc010002a (phys)
  etext  0xc010be7b (phys)
  edata  0xc019bf2a (phys)
  end    0xc019f0b8 (phys)
Kernel executable memory footprint: 637KB
ebp:0xc0129f38 eip:0xc0100af1 args: 0x00010094 0x00000000 0xc0129f68 0xc01000d3 
    kern/debug/kdebug.c:358: print_stackframe+28
ebp:0xc0129f48 eip:0xc0100e0f 
ebp:0xc0129f48 eip:0xc0100e0f args: 0x00000000 0x00000000 0x00000000 0xc0129fb8 
    kern/debug/kmonitor.c:129: mon_backtrace+10
ebp:0xc0129f68 eip:0xc01000d3 
ebp:0xc0129f68 eip:0xc01000d3 args: 0x00000000 0xc0129f90 0xffff0000 0xc0129f94 
    kern/init/init.c:58: grade_backtrace2+33
ebp:0xc0129f88 eip:0xc01000fc 
ebp:0xc0129f88 eip:0xc01000fc args: 0x00000000 0xffff0000 0xc0129fb4 0x0000002a 
    kern/init/init.c:63: grade_backtrace1+38
ebp:0xc0129fa8 eip:0xc010011a 
ebp:0xc0129fa8 eip:0xc010011a args: 0x00000000 0xc010002a 0xffff0000 0x0000001d 
    kern/init/init.c:68: grade_backtrace0+23
ebp:0xc0129fc8 eip:0xc010013f 
ebp:0xc0129fc8 eip:0xc010013f args: 0xc010be9c 0xc010be80 0x0000318e 0x00000000 
    kern/init/init.c:73: grade_backtrace+34
ebp:0xc0129ff8 eip:0xc010007f 
ebp:0xc0129ff8 eip:0xc010007f args: 0x00000000 0x00000000 0x0000ffff 0x40cf9a00 
    kern/init/init.c:33: kern_init+84
ebp:0x00000000 eip:0xc0100028 
ebp:0x00000000 eip:0xc0100028 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    kern/init/entry.S:27: <unknown>+0
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
ebp:0x00000000 eip:0x00000000 args: 0x00000000 0x00000000 0x00000000 0x00000000 
    <unknow>: -- 0xffffffff --
ebp:0x00000000 eip:0x00000000 
memory management: default_pmm_manager
e820map:
  memory: 0009fc00, [00000000, 0009fbff], type = 1.
  memory: 00000400, [0009fc00, 0009ffff], type = 2.
  memory: 00010000, [000f0000, 000fffff], type = 2.
  memory: 07efe000, [00100000, 07ffdfff], type = 1.
  memory: 00002000, [07ffe000, 07ffffff], type = 2.
  memory: 00040000, [fffc0000, ffffffff], type = 2.
check_alloc_page() succeeded!
Can not get the pte.
check_pgdir() succeeded!
check_boot_pgdir() succeeded!
-------------------- BEGIN --------------------
PDE(0e0) c0000000-f8000000 38000000 urw
  |-- PTE(38000) c0000000-f8000000 38000000 -rw
PDE(001) fac00000-fb000000 00400000 -rw
  |-- PTE(000e0) faf00000-fafe0000 000e0000 urw
  |-- PTE(00001) fafeb000-fafec000 00001000 -rw
--------------------- END ---------------------
use SLOB allocator
kmalloc_init() succeeded!
check_vma_struct() succeeded!
page fault at 0x00000100: K/W [no page found].
check_pgfault() succeeded!
check_vmm() succeeded.
not valid addr 9e, and  can not find it in vma
trapframe at 0xc0129e94
  edi  0x00000001
  esi  0x00000000
  ebp  0xc0129ef8
  oesp 0xc0129eb4
  ebx  0x00010094
  edx  0xc0382090
  ecx  0x00000016
  eax  0x0000002a
  ds   0x----0010
  es   0x----0010
  fs   0x----0023
  gs   0x----0023
  trap 0x0000000e Page Fault
  err  0x00000002
  eip  0xc010971a
  cs   0x----0008
  flag 0x00000002 IOPL=0
kernel panic at kern/trap/trap.c:222:
    handle pgfault failed in kernel mode. ret=-3
```

�������Ĵ��������ǿ��Է���`not valid addr 9e, and  can not find it in vma`�����־��Ϣ���ҳ�ʼ�Ŀ������п����ҷ�����vma֮��������ַ�ռ䣬���������ں���`do_pgfault`�е������Ϣ��������һЩ��־��Ϣ�����������ڷ��ʵ��߼���ַ��`0x11111`�����������������ַ�߼���`0x000000`~`0x10000`�У�����ҽ�`do_pgfault`�е����´���������޸ģ�
```
   if (vma == NULL || vma->vm_start > addr) 
   {
        cprintf("not valid addr %x, and  can not find it in vma\n", addr);
   }
```

�������Ĵ�����΢�޸�һ�£�
```
   if (vma == NULL || vma->vm_start > addr || vma->vm_end < addr) 
   {
        cprintf("not valid addr %x, and  can not find it in vma range[%x~%x]\n", 
                addr, vma->vm_start, vma->vm_end);
   }
```
����ʹ�������Ĵ�������޸�ʱ���ֲ�û�����������仰�����Ǳ�ջ�ˣ����˵����ʵ������addr���������vma���Ǵ�������ģ������˵������PCB�Ǵ�������ģ����������л��Ĺ��̲����˴���(**��ʱ������ȷ���˵�~**)��

����ƽʱ��ʹ��qemu����ģ�⣬��ôqemu�ṩ�˲鿴backtrace�Ĺ��ܣ�����lab5_err.log�洢�����ˣ�������������£�
```
K> backtrace
ebp:0xc0129d48 eip:0xc0100af1 args: 0x00000000 0x00000001 0xc0129dc8 0xc0100d0d 
    kern/debug/kdebug.c:358: print_stackframe+28
ebp:0xc0129d58 eip:0xc0100e0f 
ebp:0xc0129d58 eip:0xc0100e0f args: 0x00000000 0xc0129d7c 0x00000000 0x00000000 
    kern/debug/kmonitor.c:129: mon_backtrace+10
ebp:0xc0129dc8 eip:0xc0100d0d 
ebp:0xc0129dc8 eip:0xc0100d0d args: 0xc019bf60 0x00000000 0xc010c576 0xc0129e40 
    kern/debug/kmonitor.c:75: runcmd+137
ebp:0xc0129df8 eip:0xc0100d8b 
ebp:0xc0129df8 eip:0xc0100d8b args: 0x00000000 0xc0129e3c 0x000000de 0xc010134a 
    kern/debug/kmonitor.c:96: kmonitor+85
ebp:0xc0129e28 eip:0xc0100e80 
ebp:0xc0129e28 eip:0xc0100e80 args: 0xc010c500 0x000000de 0xc010c548 0xfffffffd 
    kern/debug/panic.c:30: __panic+105
ebp:0xc0129e58 eip:0xc01028bd 
ebp:0xc0129e58 eip:0xc01028bd args: 0xc0129e94 0xc01a7084 0x00000001 0xc01a708c 
    kern/trap/trap.c:222: trap_dispatch+242
ebp:0xc0129e88 eip:0xc0102af0 
ebp:0xc0129e88 eip:0xc0102af0 args: 0xc0129e94 0x00000001 0x00000000 0xc0129ef8 
    kern/trap/trap.c:319: trap+74
ebp:0xc0129ef8 eip:0xc0102b45 
ebp:0xc0129ef8 eip:0xc0102b45 args: 0xc0382090 0x00000000 0xc0129f44 0xc012aa00 
    kern/trap/trapentry.S:24: <unknown>+0
ebp:0xc0129f28 eip:0xc0109ee8 
ebp:0xc0129f28 eip:0xc0109ee8 args: 0x00000100 0x00000000 0xc0129f44 0xc0382000 
    kern/process/proc.c:463: do_fork+241
ebp:0xc0129f98 eip:0xc0109ad1 
ebp:0xc0129f98 eip:0xc0109ad1 args: 0xc010ab2f 0x00000000 0x00000000 0x00007c7c 
    kern/process/proc.c:272: kernel_thread+111
ebp:0xc0129fc8 eip:0xc010adb5 
ebp:0xc0129fc8 eip:0xc010adb5 args: 0xc010be9c 0xc010be80 0x0000318e 0x00000000 
    kern/process/proc.c:909: proc_init+255
ebp:0xc0129ff8 eip:0xc0100098 
ebp:0xc0129ff8 eip:0xc0100098 args: 0x00000000 0x00000000 0x0000ffff 0x40cf9a00 
    kern/init/init.c:41: kern_init+109
```

���Կ���`do_fork`���д������쳣��������ط������ӽ��̺͸����̽������ӹ�ϵʱ�������⣬���ǿ���ͨ��GDB����λ��do_fork�����Ϊ���ʱ��ҳʽ�ڴ�����Ѿ����������ˣ����Բ���Ҫ�������ַ�ϴ�ϵ��ˣ�����ֱ���ں����ϴ�ϵ㣻GDB����ucore�ķ������Կ��ҵ�lab1��report.md��

����λ��set_link֮���ҹ۲���һ��current_proc��proc�ĸ�����Ա��
```
(gdb) p *current
$1 = {state = PROC_RUNNABLE, pid = 0, runs = 0, kstack = 3222437888, need_resched = 1, 
  parent = 0x0, mm = 0x0, context = {eip = 0, esp = 0, ebx = 0, ecx = 0, edx = 0, esi = 0, 
    edi = 0, ebp = 0}, tf = 0x0, cr3 = 2752512, flags = 0, name = "idle\000create ini", 
  list_link = {prev = 0xc0382008, next = 0xc0382040}, hash_link = {prev = 0x20, 
    next = 0xc0382ca8}, exit_code = -1070063608, wait_state = 40, cptr = 0x2a, yptr = 0x0, 
  optr = 0xc0382008}
(gdb) p *proc
$2 = {state = PROC_UNINIT, pid = 1, runs = 0, kstack = 3224907776, need_resched = 0, 
  parent = 0xc0382008, mm = 0x0, context = {eip = 3222313283, esp = 3224915892, ebx = 0, 
    ecx = 0, edx = 0, esi = 0, edi = 0, ebp = 0}, tf = 0xc0384fb4, cr3 = 2752512, flags =
0, 
  name = '\000' <repeats 15 times>, list_link = {prev = 0x10, next = 0xc0382ca8}, 
  hash_link = {prev = 0xc019e360 <hash_list+5056>, next = 0xc019e360 <hash_list+5056>}, 
  exit_code = 22, wait_state = 0, cptr = 0xc0382008, yptr = 0xc03820e0, optr = 0xc}
```

���ҹ۲쵽`current`�����ݳ�Ա`cptr`Ϊ`0x2a`ʱ���Ҿ�֪������������==�������Ƕ�struct proc�����������ݳ�Ա���ǳ�ʼ���ˡ�

����struct proc�����������ݳ�Ա���г�ʼ��֮��ucore�Ϳ������������ˣ�������ҵ�һ�ε���ucore����ͨ������
