# lab4
---

*(���˵���䣬��������ϵ�����ö࣬���·���ҵ��ѧϰ��ʱ�䲻���ر�Ķ࣬��������α˫�ݣ�)*

---
# ��ϰ0
---
�������ں�����������ñȽ϶࣬�Ѿ����ʺ���`diff`��`patch`�������������򲹶��ˣ�ֱ��ʹ��meldͼ�λ����ߣ������ݣ��Ͼ����۶Կ��ӻ��Ĺ��߸�����Ӧ��

---

# ��ϰ1

������Ҫ��Ҫ�����ǳ�ʼ��һ���������ݽṹ����ʵ�������һ�����̵�**Ψһ��ʶ**(��ô˵�������֣��Ͼ�һ�����̵������ַ�ռ�ͼĴ�����ջ�ռ䶼����������ݽṹ���й���ģ�kernel�о����ɸ����ݽṹ����)������������������ݽṹ����ɣ�
```
struct proc_struct {                                                                                                                                                                         
    enum proc_state state;                      // Process state                    
    int pid;                                    // Process ID                       
    int runs;                                   // the running times of Proces   
    uintptr_t kstack;                           // Process kernel stack             
    volatile bool need_resched;                 // bool value: need to be rescheduled to release CPU?
    struct proc_struct *parent;                 // the parent process               
    struct mm_struct *mm;                       // Process's memory management field
    struct context context;                     // Switch here to run process       
    struct trapframe *tf;                       // Trap frame for current interrupt
    uintptr_t cr3;                              // CR3 register: the base addr of Page Directroy Table(PDT)
    uint32_t flags;                             // Process flag                     
    char name[PROC_NAME_LEN + 1];               // Process name                     
    list_entry_t list_link;                     // Process link list                
    list_entry_t hash_link;                     // Process hash list                
};                  
```

��������������ݽṹ(��ʵ������֮ǰ�ڲ���ϵͳ���г���������PCB��process control block ���̿��ƿ�)����ʵ����Ѿ���һ���������˱Ƚ����������ˣ�������ͣ���ڡ������ϵĶ��塱�Ĳ�Ρ�

���������ǽ���һ�¸������ݳ�Ա��

* state: ���̵�ǰ��״̬(uninit,runnable,sleeping,zombie)������֪��һ����������Ҫ������״̬�ֱ���**����**��**����**��**����**����Ȼһ�������������е�ʱ���ǲ���Ҫ����״̬��ǵ�(��Ϊ��һ������`curr_proc`��ָ���������еĳ���)��������ĸ�״̬���������˽��̴Ӵ������˳�������״̬��
* pid�� process id������Ͳ��ý�����
* runs ��������ռ�õ�ʱ��Ƭ������һ��Ӧ���ڽ��̵����У�
* need_resched : ��ǰ�������еĽ����Ƿ���Ҫ���������ͷ�ռ�õ�CPU��Դ��
* parent �������̣����Ҳ����Ҫ��˵��
* mm �� �������ÿ�����̵������ַ�ڿռ�(��ʵ�����������Ѿ�ѧϰ����)������������ݳ�Ա֮��ÿ�����̶�������Ϊ�Լ�������������������ڴ�ռ䣻����˼��ǳ��ã�����һ�����̲���ȥ����Ĺ�ע�ڴ�ֲ������Ϣ��ֻ��Ҫ��ע���������ڶ���bitλ��CPU���ڴ��ϾͿ��ԣ�**�����γ�ͳһ�ײ���������ǲ���ϵͳ�ĺ���˼��**��
* context �������ģ���Ϊ�ڳ����л���������������Ҫ���õĲ��֣�����Ҫ����������ϸ�Ľ��⣺

    ```
    struct context {                                                                    
        uint32_t eip;                                                                   
        uint32_t esp;                                                                   
        uint32_t ebx;                                                                   
        uint32_t ecx;                                                    
        uint32_t edx;                                                   
        uint32_t esi;                                                                   
        uint32_t edi;                                                                   
        uint32_t ebp;                                                                                                                                                                            
    };  
    ```
��������Ҫʱά����ͨ�üĴ���(eax,ebx,ecx,edx��)����Ҫ��esp(��λ��ջ)��eip(��λָ��)��Ϣ���������ǾͿ��԰ѵ�ǰ�����ֳ�����������֮���Բ���ά��ss,es,cs�ȶμĴ�����Ϣ����Ϊ���Ǹ�������䣬����Ҫά����
������Ϊ�����ڽ����л�����ʱҪͨ��trapframe��eip�Ĵ�������ָ�����ָ���������ִ��ǰ������(������ں���Ľ��̴���--�л�--ִ��--�˳��л��ٴθ�������)��

* trapframe :�ж�֡�����������ۿε�ѧϰ��֪�����߳��л���Ҫ**������**��**��ջ**��������������Ϊ���л�ʱ���Իָ��ֳ�����ջ��Ϊ�˽��̲����ж�ʱ�洢trapframe���õģ�

 *����һ��PCB��Ϊʲô����Ҫtrapframe�أ�*
 ������Ϊ�����ڽ����л��Ĺ����У��л���ں����Ὣģ��һ���жϷ���(������ʵ�Ǻܹؼ���һ�㣬�����ὲ��)��������ǰ��esp��λ�����trapframe�ϣ������ڴ������жϵ�����Ϳ���ֱ�Ӵ����trapframe�лָ�������������esp��eip���Ӷ����������ĳ������У�
 
* cr3:����֪���ں��е�CR3�Ĵ����洢��ʱ`page directory table`�ĵ�ַ�����Ҳ��������ã�
* flags �� ���λ��eg�ó����Ƿ���жϣ�
* name �� ����˵����������֣�
* list_link �� �����̴��ɴ���
* hash_link ���е�ʱ���list_link�н��б����Ļ�Ч��̫���ˣ�����hash_link��úܶࣻ

---

# ��ϰ2

---

��ϰ2�Ǵ���һ��init�̣߳����Ǵ�������������Ǻʹ���һ�����̵����Ƶģ����Ǵ��п���ѧϰ����δ���һ�����̣�

�������`init`�߳��ǴӺ���`kernel_thread`��ʼ�ģ����ȴ���һ���ж�֡trapframe������ж�֡��Ϊ�˽����л���������жϷ���ʱ��������ִ�и��̵߳���ں��������Զ�trapframe���������µ����ã�

```
    struct trapframe tf;                                                            
    memset(&tf, 0, sizeof(struct trapframe));                                       
    tf.tf_cs = KERNEL_CS;                                                           
    tf.tf_ds = tf.tf_es = tf.tf_ss = KERNEL_DS;                                     
    tf.tf_regs.reg_ebx = (uint32_t)fn;                                              
    tf.tf_regs.reg_edx = (uint32_t)arg;                                             
    tf.tf_eip = (uint32_t)kernel_thread_entry;
```

���п��Կ���`tf_cs`��`tf_ds`��`tf_es`��`tf_ss`�����ó����ں˶�ѡ���ӣ��������жϷ���ʱ�Ϳ�����Ȼ���ں��У�`tf_eip`���ó��߳���ں���`kernel_thread_entry`������

Ȼ�����`do_fork`����(��ʵ�ú���Ӧ���Ǵ������̵ĺ��������������ں˽��̶��ǹ���һ���ڴ�ռ䣬ֻ�������ĺͶ�ջ��ͬ�����ԾͿ�����Ϊ�Ǵ����̵߳ĺ���)������Ŀ��Էֳ����¼�����

* ����PCB��
* �����ں�ջ��
* �����ڴ�ռ�(mm_struct);
* �����߳�����(��Ҫ�������ĺͺ��ں˶�ջ��trapfram����)��
* �����߳��б�(ԭ�Ӳ�����ucore�������������ж�)��
* �޸Ľ��̵�״̬(RUNNABLE)��׼�������ȣ�


