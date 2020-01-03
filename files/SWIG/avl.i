%module avl
%{
     extern struct node *root;
     extern struct node *p;
%}

extern void insert(struct node* move,int item);
extern struct node* find_pos(int ,struct node *);
extern int height(struct node* );
extern int bal_fac(struct node* );
extern void rotate_right(struct node* ,struct node*);
extern void rotate_left(struct node*,struct node*);
extern void balance(struct node *);
extern void self_bal(struct node *);
extern void my_insert(int);
extern void inorder(struct node *);
extern void preorder(struct node *);
extern struct node* delete_replace(struct node*);
extern void parent_change(struct node* ,struct node* );
extern void p_delete(int );
extern void my_delete(int);
extern struct node* create_node(struct node*,int);
extern void traverse(int notation);
