# ��ϰ0
---
��ǰ��û�ù����diff��patch�Ĺ��ߣ�����ֱ��ʹ��svn������git����ؿͻ��˹��ߣ�����ʹ����һ�£�����������Ҳ�Ǻܲ���ģ�������Ϊ��֮ǰ���˽⣬����ֻ��ʹ����һ�»����Ĺ������������Ǹо��ظ������������˱ȽϵĶ�ģ�
�����ٲ鿴�ø���ݵĲ������߽ű��������������ڴ󲿷����ֹ�����ģ����Ժ����кõķ������ٽ��е�����

��ô����˵һ���ҵ�������

���ȣ�����ֱ�ӱȽ���kern�ļ��������в�ͬ���ļ�����Ϊ��lab1������Ҫ�޸ĵľ���kern�µĴ��룻��Ϊ�ļ����»������ļ��У���������Ҫ���õݹ�ķ�ʽ�����е��ã�������Ҫ����-r�������������£�
```
prompt# diff -r lab2/kern/ lab1/kern/ > changelist
```
���У���Ҫע��������������Ƿ�����/lab2/kern/��lab1/kern/��**�����ļ��ľ������ݲ��**�����ֻ�����ȡ���������ļ�������Щ�ļ��в����ô��Ҫ���`--brief`��������������Ҫ�ر����������ļ�������Щ�ļ���ͬ������������£�
```
prompt# diff -r --brief lab2/kern/ lab1/kern/ > changelist
```

�����ͻὫkern�ļ����µ����в�ͬ���ļ���������������ǽ���Щ��ͬ���ļ���������һ��������������Ƕ����õ�changelist�У�����Ĳ������
```
Files lab1/kern/debug/kdebug.c and lab2/kern/debug/kdebug.c differ
Only in lab2/kern/debug: kdebug.c.orig
Only in lab2/kern/debug: kdebug.c.rej
Files lab1/kern/debug/kdebug.h and lab2/kern/debug/kdebug.h differ
Files lab1/kern/debug/kmonitor.c and lab2/kern/debug/kmonitor.c differ
Files lab1/kern/debug/kmonitor.h and lab2/kern/debug/kmonitor.h differ
Files lab1/kern/driver/console.c and lab2/kern/driver/console.c differ
Only in lab2/kern/init: entry.S
Files lab1/kern/init/init.c and lab2/kern/init/init.c differ
Files lab1/kern/libs/readline.c and lab2/kern/libs/readline.c differ
Only in lab2/kern/mm: default_pmm.c
Only in lab2/kern/mm: default_pmm.h
Files lab1/kern/mm/memlayout.h and lab2/kern/mm/memlayout.h differ
Files lab1/kern/mm/mmu.h and lab2/kern/mm/mmu.h differ
Files lab1/kern/mm/pmm.c and lab2/kern/mm/pmm.c differ
Files lab1/kern/mm/pmm.h and lab2/kern/mm/pmm.h differ
Only in lab2/kern/: sync
Files lab1/kern/trap/trap.c and lab2/kern/trap/trap.c differ
Files lab1/kern/trap/trap.h and lab2/kern/trap/trap.h differ
```
�������ǾͿ���ͨ���������ı�������Щ�ļ��ǲ�ͬ�ģ�������������Լ���������������Ҫ��lab1������ӵĴ�����뵽lab2�У��������Щֻ����lab2�еĲ�ͬ���ǾͲ��ù����ˣ���������ı���ʾ�����ǿ��Է���kdebug.c����ļ������ǲ�ͬ�ģ���ô���ǿ���diffһ���������ļ�����������ʲô��ͬ��
```
6,9d5
< #include <sync.h>
< #include <sync.h>
< #include <kmonitor.h>
< #include <assert.h>
11,12d6
< #include <kmonitor.h>
< #include <assert.h>
310a305,341
> 	//print the important info of register ebp and esp
> 	uint32_t ebp_value;	//the value is the address of ebp register
> 	uint32_t eip_value;
> 	uint32_t argu_count = 4;
> 
> 	ebp_value = read_ebp();
> 	eip_value = read_eip(); 
> 	
> 	uint32_t i, j;
> 
> 	for (i = 0; i < STACKFRAME_DEPTH; i++)
> 	{
> 		cprintf("ebp:0x%08x eip:0x%08x ", ebp_value, eip_value);
> 		//using the uint32_t in order to simulated the addres of 32-bit
> 		//after the ebp register is [return address], and then calling function's arguments
> 		cprintf("args: ");
> 		uint32_t *argu_addr = (uint32_t*)ebp_value + 2;
> 		for (j = 0; j < argu_count; j++)	
> 		{
> 			cprintf("0x%08x ", argu_addr[j]);	
> 		}
> 		cprintf("\n");
> 		print_debuginfo(eip_value - 1);
> 		
> 		//to resolve the [error: invalid type argument of unary ��*��] problem: convert the type of eip_value/ebp_value to [uint32_t*]
> 		eip_value = *((uint32_t*)ebp_value + 1);//when the eip points to the return address, [pop arguments] will exec;
> 		ebp_value = *(uint32_t*)ebp_value; 
> 		//eip_value = ((uint32_t*)ebp_value)[1];		//because the value of ebp_value is address, so we can use uin32_t* to convert
> 		//ebp_value = ((uint32_t*)ebp_value)[0];
> 
> 
> 		cprintf("ebp:0x%08x ", ebp_value);
> 		cprintf("eip:0x%08x \n", eip_value);
> 	}
> 
> 
> 	return;

```
������Ҫ����һ����ǣ�������ʹ��diff�����ʱ���������ͨ��patch����a���b����ô��diff��ʱ���ʹ��`diff a b > delta`������delta�оͻش洢�����ļ��Ĳ�ͬ��֮����ʹ��`patch a delta`ʱ�Ϳ�����aͨ������delta���b���˽������diff��patch�в���λ�ô����ľ���Ч�������ǾͿ���ͨ�����ַ��������lab1�к��еĵ���lab2�в����еĴ����ˣ�

��Ϊ��������lab2�к���lab1ӵ�еĴ��룬��ô��ʵ�Ϳ��������������ò��ִ�����lab1�е����ӣ���Ϊ���Ǿ���Ҫ�������н�����`diff a b`��`a`��λ���滻��`lab2/kern/debug/kdebug.c`����`b`�е�λ���滻��`lab1/kern/debug/kdebug.c`��������ͬ�����delta�ļ��У�delta�ļ��д�ŵľ�����һ�����������ʾ�����ݣ�

��ϸ�۲����ǿ��Է��֣�lab1�µ�����ļ���������ȫ��lan2�µ�����ļ���ģ�kdebug-lab2�а����˸����ͷ�ļ���Ϣ���������ǲ����ܽ����delta�����ָ��������ļ�����Ϊ�����Ļ�patch��֮�����һ��������kdebug-lab1�ˣ���lab2�����ĺܶ�����û���ˣ�������patchû�����壻��Ϊ���ǽ�delta�ļ��У�kdebug-lab2����ӵ�е��ǲ���ȥ���������ĵ�`6,9d5`��`11,12d6`�����Ӧ�Ĵ���ȥ��������ʣ�µľ���kdebug-lab1�б�kdebug-lab2����ȫ�����Ķ��������ʱ��ִ���������
```
prompt# patch lab2/kern/debug/kdebug.c delta
```
�Ϳ��Խ�kdebug-lab1�������Ĵ��붼patch��kdebug-lab2�ϣ�
ʣ�µ������ļ����������ַ������о�������΢�е㱿׾����

----
# ��ϰһ

(*�����е�ʱ����Ҫ�����ܽ��Ե�˼�������ҵ�ӡ��ʼ��е�ƪ����Щ���ң�����һ�����report����һ��blog����д����Ҫ��¼һ����ѧϰ�����е�һЩ˼·*)

�������ǿ�������Ϥ�����ʻ㣬һ��free block��ʵ����һ���������ڴ�飻ÿ���������ڴ��block��ʵ���ж��pages�ģ�
��ô�����ڷ����ڴ�ʱ��Ҫ����һ��block���еģ�һ��block�к�������page��

�ڲ���ϵͳ��ʼ���Ĺ����У��Ǿ��������漸���������ù���`kern_init()-->pmm_init()-->init_pmm_manager`��Ҳ�����ڳ�ʼ���Ĺ�������������Ҫ��ʼ�������ڴ����Ȼ���ٳ�ʼ����ʽ�ڴ����/ҳʽ�ڴ����/��ҳʽ�ڴ������Ϊ������ʹ��ҳʽ�ڴ����ʱ��Ȼһ��ֻҪ�����ϵͳ����һ��page��С���ڴ棬����Ҳ��һ���������ڴ�����Ҳ����Ҫ���������ڴ����

�������ڴ�������У�����ѧϰ����first fit��best fit��worst fit��buddy system��������Ҳ�����˽�Ϊ�򵥵�first fit�ķ��䷽�������������ۿ���֪��first fit��block�ǰ��յ�ַ�ɴ�С�������򣻵�������lab2���Ѿ����˲��ִ�����Ϣ���������ڲ鿴�����ʱ���������صĴ�����⣬��֮ǰ����block������ͼ��ʾ����ά���ģ�


������ʵ��������ͼ����ά���ģ��������Ժ���һ�󣬺���Ҳ�����˵ڶ��ַ�����


��Ϊ����㷨���ǱȽϼ򵥵ģ�û���ر�Ҫ˵�Ķ��������Ծ���ϸ�ڿ��Բ鿴�ҵ��ύ�Ĵ���:)

����lab1����һ�����⣺
> ���first fit�㷨�Ƿ��н�һ���ĸĽ��ռ�

�Ҿ����ҵ��㷨û��ʲô�Ľ����ˣ�Ψһ��һ��**����**��Ҫ�Ľ��ĵط������ҵ�`default_free_pages`��������ж�Ҫ���յ�block������pages������һ��loop���ָ�ÿ��page֮ǰû�б������ȥʱ��״̬�����������ڷ����ȥ֮��ֻ��head page��������Ա��޸��ˣ�����page������û�б��޸ģ�������Ϊ�Ҳ�֪�������ȥ֮�����������Ա�������Ҿ�loop��һ�Σ������Ҳ鿴��һ��labcodes_answer�е���ش��룬�����Ǹ�����û����д��**��Ч**���ڷ���ռ�ʱ����һ��pageһ��page��ȥ������

   ����һ��һ��page�����ķ����ͻ����ÿ�η��������ڴ�ռ�ʱ�������O(n)��ʱ�临�Ӷȣ�������ʵ����ʱ����Ҫ���е���page��loop����Ϊÿ��block��head page�е�property���Զ�����ֵ�ģ����ǿ������ȱ�����Щhead page��һ��head page�е�property�ֶα�Ҫ�����Ŀռ��ʱ�����ǾͿ��Խ���block�е�pages���в�֣���֮�����head page�е�property��Ҫ�����Ŀռ�Сʱ����ֱ��������һ��head page����(*����head_page + head_page->property�ķ���ֱ��������һ��head_page��*)����Ҫ���ǾͲ�������Щhead page���common page�����ٽ����ж��ˣ���ȫû�б�Ҫ����������Ϊlabcodes_answer���Ը��Ƶĵط���
   
---
# ��ϰ��

���Ȳ�����ϰ�����������ļ������ѵ㣺

1.get_pte�����ĵ��ù�ϵ����ͨ����ϰָ�����в鿴������ʱ��ȡ���������ڴ涼���ڽ�0x00000000������ΪҲ�����ں�ռ�õ������ڴ�������Ϊ��ȡ���������ڴ�֮�����ֱ��ͨ��`page2kva(pg_tbl)`����ȡ������linear address��
2.����֪����page table entry�д洢����`physical address | flags`����ʵpage directory entry�д洢��Ҳ��`physical address | flags`ֻ����page directory entry�е�physical address��ĳһ��page table��physical address;
3.����page table��˵��������Щpage table�����ں˻���ʣ������û�̬Ҳ����ʣ�������Ǿ���Ҫ��page directory�е�page directory entry����ӱ�־λ���PTE_U�ֶΣ�

������˵�����Ŀ���ǱȽϼ򵥵ģ���Ҫ�����ȴ�page directory���ҵ�virtual address��Ӧ��page directory entry��������page directory entry��������(����PTE_Pλû��ʹ�ܣ���ǰpage directory entry������)��ô���Ǿ���Ҫ�������ڴ����ó�һ��page����page table���������page table��page directory entry�����(�����ķ�����ʹpage directory entry�д洢��**page table�������ַ����Ӧ�ı�־λ**)��
һ����ȡ�������page table����ô���ǾͿ���ͨ��virtual address��page directory+page table�Ĺ�ϵ����ȡ����virtual address��page directory+page table֮��Ĺ�ϵ(**��ʵ���ֶ�Ӧ��ϵ�Ǻܼ򵥵ģ�һ��virtual address��ǰ10λ��Ӧpage directory entry index���м�10λ��Ӧpage table entry index�����12λ��Ӧ0-4096�ĵ���pageƫ�ƣ������Ϳ��Ա�֤��һ������pageƫ�ƶ�Ӧһ���߼�pageƫ��**)��

���������˼·������(��ʵ�������д���ˣ�ֻ�ǳٳ�û�и��±ʼǣ��ʼ��������պ�������˼�������䣬���Խ��첹��,XD)

�����ҳʽ�ڴ�����е��ڴ�ӳ�估��ʽ/ҳʽ�ڴ������Ч���ƽ���һ���Ƚ���ϸ��˵���뽲�⣬�����Լ��պ���估�������˼��(�����ͬѧ�����˱��沢�ܶ�����������Ǿ͸��ò����ˣ�ͬʱ���д���ӭָ��)��

* ���ȣ���bootloader�׶Σ����Ƚ�����Ӧ�ļĴ�����ʼ����ʹ��A20��load GDT��̽�������ڴ棻��Ҫ˵��һ�������load GDT֮��virutal address��linear address֮����һһӳ��Ĺ�ϵ��������Կ���bootstrap GDT���룺


```
.data                                                                                                                                                                                        
# Bootstrap GDT                                                                  
.p2align 2                                          # force 4 byte alignment     
gdt:                                                                             
    SEG_NULLASM                                     # null seg                   
    SEG_ASM(STA_X|STA_R, 0x0, 0xffffffff)           # code seg for bootloader and kernel
    SEG_ASM(STA_W, 0x0, 0xffffffff)                 # data seg for bootloader and kernel
                                                                                 
gdtdesc:                                                                         
    .word 0x17                                      # sizeof(gdt) - 1            
    .long gdt                                       # address gdt  
```

��ʱ����ֻ���趨��һ��gdt�����Ա�����ڴ������д����ʱ����͸����μĴ�����ʵ��û�й�ϵ�ģ���Щ�˻���ΪֻҪ�������gdt���ҽ�����`lgdt`������˶�ӳ��(**��ʵ��仰��˵�����Լ�����==**)��bootloader��������gdt֮�󣬻�Ҫ���öμĴ�����ֵ����ֵָ��gdt��ĳ��������������ȫ���Ķ�ʽ�ڴ�������µĴ�����Ƿֱ𽫴���μĴ��������ݶμĴ����ֱ�������ֵ����ָ��֮ǰloaded��gdt���������������ȫ���Ķ�ʽ�ڴ����

```
    ljmp $PROT_MODE_CSEG, $protcseg                 # ����ljmp����PROT_MODE_CSEG��ֵ������μĴ���CS                                                                                             
    
.code32                                             # Assemble for 32-bit mode   
protcseg:                                                                        
    # Set up the protected-mode data segment registers
    # ��PROT_MODE_DSEG��ֵ�����ݶμĴ���
    movw $PROT_MODE_DSEG, %ax                       # Our data segment selector  
    movw %ax, %ds                                   # -> DS: Data Segment        
    movw %ax, %es                                   # -> ES: Extra Segment       
    movw %ax, %fs                                   # -> FS                      
    movw %ax, %gs                                   # -> GS                      
    movw %ax, %ss                                   # -> SS: Stack Segment  
```
ͨ���������indexֵ�������ݶκʹ���μĴ���֮�󣬾������������ҳʽ�ڴ����CD:IP�Ϳ���ͨ��CS��ֵ����gdt��index����ȡbase address���˽׶���0x0����Ȼ���IP��offset�����Ϊ����virtual address�����ݶε�ֵͬ��

* �������ǵڶ��׶Σ���`call bootmain`֮�������ϵ����ݶ�ȡ���ڴ���֮�󣬲�ִ�д�����ϵ�entry����(��kern_entry����)��
    
����ط���ʵ�Ƚ�����˼�������׼ȷ����kern_entry����򵽶ϵ㲢�ҳ�������ʱ����ֹͣ�������˵����������֪��֮ǰ��ʽ�ڴ�����bases addressΪ`0x00000000`����������һ��������һ�£�
��������qemu��ģ�����ϵͳ�������̣�����ȥ�ҵ�lab1��report�в��Ҹ÷��������ǿ�����kern_entry�����һ���ϵ㣬Ȼ����������һ���ط���һ���ϵ㣬������ʾ��

```
The target architecture is assumed to be i8086                                               
(gdb) target remote 127.0.0.1:1234                                                  
Remote debugging using 127.0.0.1:1234                                               
0x0000fff0 in ?? ()                                                                 
(gdb) file ./bin/kernel                                                             
A program is being debugged already.                                                
Are you sure you want to change the file? (y or n) y                                
Reading symbols from ./bin/kernel...done.                                           
(gdb) b kern_entry                                                                  
Breakpoint 1 at 0xc0100000: file kern/init/entry.S, line 11.                        
(gdb) b *0x00100000                                                                 
Breakpoint 2 at 0x100000                                                            
(gdb) continue                                                                      
Continuing.                                                                         
                                                                                    
Breakpoint 2, 0x00100000 in ?? ()                                                   
(gdb) x /10i $pc                                                                    
=> 0x100000:    lgdtw  (%di)                                                        
   0x100003:    sbb    %dh,0x11(%bx,%si)                                            
   0x100006:    add    %bh,0x10(%bx,%si)                                            
   0x10000a:    add    %al,(%bx,%si)                                                
   0x10000c:    mov    %ax,%ds                                                      
   0x10000e:    mov    %ax,%es                                                      
   0x100010:    mov    %ax,%ss                                                      
   0x100012:    ljmp   $0xc010,$0x19                                                
   0x100017:    or     %al,(%bx,%si)                                                
   0x100019:    mov    $0x0,%bp                                                     
(gdb)
```
�������ǿ��Կ�����gdb��Ȼ��2�Ŷϵ���ֹͣ�ˣ���2�Ŷϵ��1�Ŷϵ���߼���ַλ�þ��������`0xc0000000`������Ϊʲô�أ�

**��Ҫʱ��Ϊ��ʱ�Ķ�ʽ�ڴ������õ�base address��Ȼʱ0x00000000������bootloader�ڷ��ô���κ����ݶε�ʱ��Ļ�����ʼ�����ַ��0x00000000������0xc0000000������������virtual address��0x00100000�ϴ�ϵ�ʱ�����൱���������ַ��0x00100000�ϴ����˶ϵ������congtinueʱ�ͻ�ֹͣ����֮����û����0xc0100000��ֹͣʱ��Ϊ����β�û���������ڴ�0xc0100000�����κδ��룬Ҳ�Ͳ���ֹͣ**

�ڽ���kern_entry����һ�ν����˺Ͳ���1��һ����load global descriptor table�Ķ�����ֻ����gdt��������µ����ӣ�

```
.align 4                                                                            
__gdt:                                                                              
    SEG_NULL                                                                        
    SEG_ASM(STA_X | STA_R, - KERNBASE, 0xFFFFFFFF)      # code segment              
    SEG_ASM(STA_W, - KERNBASE, 0xFFFFFFFF)              # data segment              
__gdtdesc:                                                                          
    .word 0x17                                          # sizeof(__gdt) - 1         
    .long REALLOC(__gdt) 
```
���Կ������ǵ�base address�������`-0xc0000000`�ˣ������ȫ����ҳʽ�ڴ����֮����ͨ��virtual address����ϵ�Ļ��Ϳ���׼ȷ��ֹͣ�ˣ���ʱ������ַ֮���ӳ���ϵΪ`vitrual address - 0xc0000000 == linear address == pyhsical address`�ˣ�

* �����׶μ�������ҳӳ���ϵ����Ч��

�����ȴ���һ��page directory��Ȼ�����linear address��physical address֮���ӳ�䣬����Ĵ������£�
```
    boot_map_segment(boot_pgdir, KERNBASE, KMEMSIZE, 0, PTE_W);
```
����������Ҫ�ǹ���`KERNBASE~KMEMSIZE`֮��������ַ�������ַ֮���ӳ�䣬ӳ��������ַΪ:`0~KERNMEMSIZE-KERNBASE`��֮��������ӳ����ʵ��Ϊ�˵�ִ�е����εĶ�ʽ����ʱ(�����ζ�ʽ����֮��base addressΪ0����ôvirtual address��inear address���ں���ʵ��ַ����0xc0000000),ҳʽ�ڴ����Ϳ���ͨ����ε�ҳʽ����ӳ���linear addressֱ��ӳ�䵽physical address�ϣ�

������Ҫ˵�����ǣ���ʱ�����������������ֱ����Чҳʽ�ڴ����Ļ�����ô�ڶ��Ƕ�ʽ�ڴ����Ľ�����Ǵ��ڵģ���virtual address��Ҫ`-0xc0000000`֮��Ż���linear address,Ȼ���ʱ��û����Ч��ҳʽӳ��(��Ч��ҳʽӳ����KERNBASE~KERNMEMSIZE����linear address��0x00000000~0x10000000֮��)����ôҳʽӳ��ͻ�������Բ���Ҫһ����ʱ��ҳʽ�ڴ�ӳ�䣬���£�
```
    boot_pgdir[0] = boot_pgdir[PDX(KERNBASE)]; 
```
�����ʱ��ҳʽ�ڴ�ӳ����Ա�֤��ҳʽ������Ч�󵽵����ζ�ʽ������Чǰ�����Խ�linear address׼ȷ��ӳ�䵽physical address��(��Ϊ��ǰ�Ĵ���ε�linear address������0~4M֮��)����һ����˼����ʮ����Ҫ�ģ�
�����ҳʽӳ�估��ʱӳ��֮��Ϳ�����Чҳʽ�ڴ�����ˣ����������CR0�Ĵ�������Ӧ��־λ��Ч��
����
* ����һ��������Ч������ҳʽ�ڴ������Ӧ�ĺ�����`gdt_init`����������3����ʱ��ҳʽӳ�����٣�����`boot_pgdir[0] = 0;`�����˶�ҳʽ�ڴ����ȫ����ɣ���֤��`virtual address == linear address == physical address + 0xc0000000`���ڶ�ʽ�ڴ����û�а취����������£�����Ӱ�������С��

---
# ��ϰ��

��ϰ��ûʲô��˵�ģ���Ҫ�������һ��pte����ʹ�õĻ�����Ҫ��ո�pte�е����ݣ���pte������page�����referenceλ0����˵����pageû����ʹ�ã���ôӦ�û���ȥ��ͬʱ�������ĳ��linear address��Ӧ��pte���������������������linearʹ�ã�

��ʱ�ع˸���Ŀ��ʱ����һ�������벻�����ˣ�����˼�����ִ����ֽ��ù۵�����һ�£������ڽ������Ŀʱʹ����һ���꣬���£�
```
    #define PTE_ADDR(pte)   ((uintptr_t)(pte) & ~0xFFF)
```

Ϊʲô����12bit����Ϊ0�Ϳ��Ի�ȡ����pte�д洢������ҳ�ĵ�ֵַ���أ�
��**������Ϊ�洢��pte�е��������ַҳ�ĺ�12bit��ʵ����Ϊ0�ģ���Ϊ���Ǵ洢��ʱ���Ǹ���һ��ҳһ��ҳȥ�洢�ģ���ôÿ��ҳ����ʼ��ַ�϶���4096��������������ÿ��ҳ����ʼ��ַ�ĺ�12bit�϶����Ƕ�Ϊ0�ģ���˾Ϳ���ͨ��`& ~0xfff`�ķ�����ȡ��һ��pte�д洢�������ַҳ����ʼ��ַ��**

---
# challenge

�����challege���������Ǻ�����˼�ģ����������Ƚ����е�ʵ�鶼�������������challenge���֣����������ȷ���һ�£�