# ��ϰ0
---
��ϰ0�Ĵ���ϳɷ������ǲ����������diff��patch�ķ������������������ǱȽϸ����ˣ�����Խ������Խ���ô���
һ��������п��ӻ������linuxϵͳ�Ļ������Ƽ�ʹ��meld��Ч��Ҫ��һЩ�����Ƕ����޷�ʹ�õĿ��ӻ��Ĺ��ߵ���������ǿ���ʹ��һ�´��ӵ�`diff`��`patch`����Ӧ��һ�¡�

---

# ��ϰ1

�����ϰ����Ҫ��Ϊ�˲������û������г���ҳ�����ж�ʱӦ��ν��д���(�������ڶ������ں��н���ģ���)��
����`do_pgfault`������΢�ŵ㳤��ֱ�Ӱڳ�����Ӱ���Ķ�Ч�����ҽ��߲����߶Դ�����з�����

������ҳ����ʱ��֤����������ʵ�����ҳ�ǲ����ڵģ�Ҳ����page table�е�page table entry�е�ֵ�������ƶϳ�һ������ҳ�Ĵ��ڣ���ʱ��pte�����������������
* `uintptr_t` pte = 0����page table entry����û�����ݵģ���ô��˵��**�����ڴ�ҳ**��û������������������(���֮ǰ�����������ô���pte����һ��swap entry);��ʱ�Ĳ�����ֱ������һ�������ڴ�ҳ������pte������ɡ��������£�
```
if (0 == *ptep) {                                                            
        if (NULL == pgdir_alloc_page(mm->pgdir, addr, perm))                     
        {                                                                        
           cprintf("call pgdir_alloc_page failed in do_pgfault.\n");             
           goto failed;                                                          
        }                                                                        
    }
```

* `uintptr_t` pte != 0,��page table entry�������ݣ����ǲ�������ҳ�������ַ;**��ô���pte�д洢����ʲôֵ�أ�**����洢����swap entry�е����ݣ�����ӳ�佻�������д洢��ָ��������ݡ��������£�
```
    else {                                                                       
        if (swap_init_ok) {                                                      
            struct Page *page = NULL;                                            
            //uintptr_t phy_addr;                                                
            ret = swap_in(mm, addr, &page);                                      
            if (0 != ret)                                                        
            {                                                                    
                cprintf("call swap_in failed in do_pgfault.\n");                 
                goto failed;                                                     
            }                                                                    
                                                                                 
            //now the page table entry is converted to real page table entry from
            //swap_entry                                                         
            //phy_addr = page2pa(page);                                          
            page_insert(mm->pgdir, page, addr, perm);                            
            //*ptep = phy_addr | PTE_P | perm;                                   
                                                                                 
            swap_map_swappable(mm, addr, page, 0);                               
        }                                                                        
        else {                                                                   
            cprintf("no swap_init_ok but ptep is %x, failed\n, *ptep");          
        }                                                                        
    }       
```

ͨ��ÿ�����̽���һ��page directory��ά��һ�������ַ�ռ䣬���ĳ�������ַ���η��ʵ�ʱ����`page fault`����ô��ֱ�Ӵ���һ������ҳ�����pte����Ӧ�Ŀ���ɣ����ĳ�������ַ���ʳ���`page fault`������linear address��Ӧ��pte��ʵ����ֵ�ģ���ô���ֵ����**swap entry**��������Ϊ���ǲ��������ڴ��������Ҫ��ʱ�ؽ�ĳЩ��ʱ��ʹ�õ������ڴ�ҳ��������ϵͳ������Ϊ�˺��ڻ��ܼ���ʹ���������ҳ�ϵ�����(�Ͼ�һ�������ָ��������ݶ��ǿ��Բ������ظ�ʹ�õ�)�����Ǿͽ��������ҳ�ϵ�������ʱ����ڴ��̿ռ��ϡ�

���Ƿ��õ���������֮����ô�������´ο��Կ��ٵ��ҵ����ҳ�����������أ����ʱ���**Ҫ�ظ�����һ��pte��**,Ϊ���´����linear address����`page fault`ʱ���Լ�����ȡԭ�������ݣ��������Ǽٶ�������ݵ�ʱʱ�洢���˽���������`n~n+7`��sector�ϣ���Ϊһ��ҳΪ4KB��һ��sectorΪ512B�����һ��ҳ�൱��8��sector����������pte�д洢�������������`n`ֵ���´���ȱҳʱͨ�����pte�ϵ�offsetֵ�Ϳ���ֱ��׼ȷ�ؽ����ݴӴ�����д�������ڴ��ϣ�

�����л���һ�����⣺
> ���ucore��ȱҳ����������ִ�й����з����ڴ棬������ҳ�����쳣������Ӳ��Ҫ����Щ���飿

���ȳ�����ҳ�쳣����CPU��ȡ�����ڴ�ʱ���ִ������ʱ���жϿ��������������Ϸ����ж��źţ�CPU��ִ����һ��ָ���ʼ��ȡ�ж��źţ���ȡ���ж�index����Ӧ��error code��Ϣ�ȣ���������CPU�Ὣ��Ӧ��error code���Ĵ���״̬�ȴ洢��trapframe�У��������쳣��Ӧ����ֵȥIDT��Ѱ���ж����������ж��������д洢���ж����̶�Ӧ��selector��offset��ͨ��������ֵ��CS��EIP��λ���жϷ��������ϣ�Ҳ�������ǵ�`do_pgfault`�Ͻ��к�������

��ʵ������֮ǰ���ǽ����ж�֪ʶ�йأ�

---
# ��ϰ2

��ϰ2��ʵҲ����ԱȽϼ򵥵ģ�ͨ�����FIFO�㷨�����������ַ�ռ�������ڴ�����룬ʹ�����ͷţ�

�������û�������Ҫ����һ�������ڴ�ҳʱ�����ǲ���Ҫ����`page directory entry`��`struct Page`�����ݽṹ����س�Ա������Ҫ���������ڴ�ҳӦ�õ�page replace algorithm�У���������ʵ���в��õľ��Ǽ򵥵�FIFO�㷨���������Ǿͽ�����ҳ�򵥵ع���`mm_struct`�е�`sm_priv`�У�

����˵��һ�£�����`list_entry_t`������һ��˫������ṹ�����˳ʱ��/��ʱ�뷽���еģ���������������Ϊ˳ʱ�뷽����һ�����е��������������ʱ�뷽����һ�����е����������ǿ��Եģ�ֻҪ��֤��ȡ��һ������ҳʱ���뵽����β�����ͷ�һ��ҳ��ʱ�Ӷ���ͷ���ų��ͺã�

��������Ҫ˵��һ����`_fifo_swap_out_victim`�����д��ڵ�һ��ע��`set the addr of addr of this page to ptr_page`,���������Щ�����ԣ���ʵ��ϸ˼��һ�¾Ϳ������������ʵ����ı��β�`*ptr_page`��ָ������ָ��Ҫ�ͷų�����page;
����֪��Ҫ�ں������޸�һ��ָ�����͵�ʵ�ξͱ��뽫���ָ��ĵ�ַ���뵽�������У�ͨ�����ַ�ʽ���ܶ��ں������޸����������ָ�����⣻�������ע�͸�׼ȷ��Ӧ����`set the addr of addr of this page to ptr_page`;�������ע������Ϊ����ʮ����**����**�ģ�

���ڻش�һ����ϰ2�еļ������⣺


> �ʣ����Ҫ��ucore��ʵ��"extended clockҳ�滻�㷨"��������Ʒ��������е�swap_manager����Ƿ�����֧����ucore��ʵ�ִ��㷨��

�����е�swap_manager����ǿ���֧��ucore��ʵ�ָ���ҳ���û��㷨�ġ�

ҳ���û��㷨�������µ��ص㣺
* �������µ�����ҳʱ���뵽�Լ������ݽṹ�У�
* ��ռ�õ�����ҳ̫��ʱ�ᱻ�滻��ȥ��

��swap_manage��ܾ��еľ���������ܣ���ôswap_manager�������ڱ���Ĺ�����ʹ�ò�ͬ��ҳ���û��㷨�أ�����ͨ������������ָ��`map_swappalbe`��`set_unswappable`��`swap_out_victim`�����ض���ҳ���û��㷨��Ӧ�ĺ������Ӷ���֤�������еĹؼ��������԰��վ����ҳ���û��㷨�����û���**���ǣ�ҳ���û��㷨ֻ�����㷨���ж�˭Ӧ�ñ��û�����ʱ�û�����ʱ������Щ�߼����ǰ���swap_manager����н��е�**��

> �ʣ�����ǣ��������ucore��ʵ��"extended clockҳ�滻�㷨"����Ʒ��������ش��������⣺1.��Ҫ��������ҳ��������ʲô��2.��ucore������жϾ�������������ҳ��3.��ʱ���л���ͻ���������

�����ʱ��ҳ���û��㷨�һ�������������������ϸ����ɲ�������Ӧ�ķ�������������ʱ���������XD��

---

---
# challenge 

��ս�⻹���ȷ����ڴˣ���ȫ����������ɺ���ȫ��һһ���ƣ�

---
# ˵��

��˵����Ҫ����������ʵ��1��ʵ��2֮����ֵ�����˵��������صĽ���취��

�����г��������ʵ��1��ʵ��2֮������`make qemu`ģ�����ϵͳ��������ʱ�����������⣺

```
ide 0:      10000(sectors), 'QEMU HARDDISK'.
ide 1:     262144(sectors), 'QEMU HARDDISK'.
SWAP: manager = fifo swap manager
BEGIN check_swap: count 31994, total 31994
setup Page Table for vaddr 0X1000, so alloc a page
setup Page Table vaddr 0~4MB OVER!
set up init env for check_swap begin!
page fault at 0x00001000: K/W [no page found].
page fault at 0x00002000: K/W [no page found].
page fault at 0x00003000: K/W [no page found].
page fault at 0x00004000: K/W [no page found].
set up init env for check_swap over!
write Virt Page c in fifo_check_swap
write Virt Page a in fifo_check_swap
write Virt Page d in fifo_check_swap
write Virt Page b in fifo_check_swap
write Virt Page e in fifo_check_swap
page fault at 0x00005000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x1000 to disk swap entry 2
write Virt Page b in fifo_check_swap
write Virt Page a in fifo_check_swap
page fault at 0x00001000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x2000 to disk swap entry 3
swap_in: load disk swap entry 2 with swap_page in vadr 0x1000
write Virt Page b in fifo_check_swap
page fault at 0x00002000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x3000 to disk swap entry 4
swap_in: load disk swap entry 3 with swap_page in vadr 0x2000
write Virt Page c in fifo_check_swap
page fault at 0x00003000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x4000 to disk swap entry 5
swap_in: load disk swap entry 4 with swap_page in vadr 0x3000
write Virt Page d in fifo_check_swap
page fault at 0x00004000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x5000 to disk swap entry 6
swap_in: load disk swap entry 5 with swap_page in vadr 0x4000
count is 7, total is 7
check_swap() succeeded!
++ setup timer interrupts
0: @ring 0
0:  cs = 8
0:  ds = 10
0:  es = 10
0:  ss = 10
+++ switch to  user  mode +++
trap in T_SWITCH_TOU.the value of tf_eip is c010020c
page fault at 0xc010020c: U/R [protection fault].
not valid addr c010020c, and  can not find it in vma
trapframe at 0xc011ffb4
  edi  0x00000001
  esi  0x00000000
  ebp  0xc011ffa8
  oesp 0xc011ffd4
  ebx  0x00010094
  edx  0xc0108de7
  ecx  0x00000000
  eax  0x0000001e
  ds   0x----0023
  es   0x----0023
  fs   0x----0023
  gs   0x----0023
  trap 0x0000000e Page Fault
  err  0x00000005
  eip  0xc010020c
  cs   0x----001b
  flag 0x00003286 PF,SF,IF,IOPL=3
  esp  0xc011ffa0
  ss   0x----0023
kernel panic at kern/trap/trap.c:197:
    handle pgfault failed. invalid parameter

Welcome to the kernel debug monitor!!
Type 'help' for a list of commands.
```

������ʵ���������ǿ��Կ�������`check_swap`�����Ѿ��ɹ��ˣ�����������ϵͳ���ǲ�����`panic`��������Ϊʲô�أ�
�����ǵĳ��������Ԥ��Ĳ�һ��ʱ����ʼ�ĵ��Լ�������Ϊ��Ҫ����**��־��Ϣ**��**�򵥵Ĵ����߼�����**����Ϊ�������ų�bug�Ĺ�����Ҫ��ǳ������п���һ��bug����ͨ���򵥵Ĵ����߼��ƶϻ�����ϵͳ��־����ȫ���Թ۲���������ÿ�ζ���GDB�ȵ��Թ��߽��е��ԵĻ������鷳��˵�����Һ͸�bug��ص��߼��ܶ�Ļ���Ҫ�����￪ʼ��ϵ�۲�����أ��������ǵ��Եķ�ʽһ��Ҫ��ǳ�����Ҫ������ʹ�ø��ֵ��Թ���(��Ȼ��core dump�Ļ�����˵��)

�ص����������������У��������ǿ��Կ�������`switch to user mode`�Ĺ����в�����panic���������`switch to user mode`����������lab1����д��`lab1_switch_test`�����Ĳ��ֹ��ܣ���ô�������ڿ��Զ���������ط����ˣ�

�������ȿ�����`not valid addr c010020c, and  can not find it in vma`���⺯���������̷��ʵ������ַ�ռ������⣻����֪������һ���û�̬�Ľ�����˵��ÿ�����̶������Լ��������ַ�ռ䡣�����ַ�ռ��ڲ���ϵͳ����ʹ��һ��`mm_struct`�Ľṹ����й���ģ�����`mm_struct`�ṹ���ϻ�������������ַ����Ҫʹ�õ�`vma_struct`�������û�̬����ִ��ʱ��Ҫ�������������ַ�ռ�飻��������������ṹ��һ���û�̬��������������ķǷ������ַ�Ļ����ͻ�����û���Ǹ���Ӧ��`vma_struct`�����������������е�`not valid addr c010020c, and  can not find it in vma`.

��ôΪʲô`switch to user mode`֮��ͻ������������أ�������Ϊ������д`lab1_switch_test`��ʱ����Ϊ�����trackframe��ǿ�иı�������ջ���ݣ������Ļ�trapframe�д洢��EIP�Ĵ�����ֵ��ʵ�����ں�ʱ��EIPֵ(��Ϊtrap�������ں�̬�У����Բ�����ջ�л�)���������ʱ������CS��EIP���Ѿ���trapframe�е����ˣ���ôCS:IP�������ڵ��߼��ռ䣻����������������Ȼ��ģ�������ַ�ռ䣬EIP�е�ֵһ������`mm_struct`�н�������������`not valid addr c010020c, and  can not find it in vma`;

���涼���ҵ��ƶϣ�Ȼ����������ucoreԴ�����д�ӡ��һ��EIP��ֵ���������`the value of tf_eip is c010020c`����ʾ�ģ���Ȼ������ʵ�`valid addr`��ͬ������ƶϺ���