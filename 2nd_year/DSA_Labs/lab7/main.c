#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>

typedef struct Tree{
    int key;
    struct Tree *left, *right;
}Tree;

Tree *root;




void insertBin(int key){
    Tree *p, *q;
    p = (Tree*)malloc(sizeof(Tree));
    p->key = key;
    p->left = 0; p->right = 0;
    if(root==NULL) {
        root = p;
        return;
    }
    q = root;
    for(;;){
        if(key < q->key){
            if(q->left == 0){
                    q->left = p;
                    return;
            }
            else q = q->left;
        }
        else if(key > q->key){
            if(q->right == 0){
                q->right = p;
                return;
            }
            else q = q->right;
        }
        else{
            printf("cheie dubla");
            free(p);
            return;
        }
    }
}





void preorderBin(Tree *p, int level){
    int i;
    if(p!=0){
        for(i = 0; i <= level; i++) printf(" ");
        printf("%d\n", p->key);
        preorderBin(p->left, level+1);
        preorderBin(p->right, level+1);
    }
}

void inorder(Tree *p, int level){
    int i;
    if(p){
        inorder(p->left, level+1);
        for(i = 0; i <= level; i++) printf(" ");
        printf("%d\n", p->key);
        inorder(p->right, level+1);
    }

void preorder(Tree *p, int level){
    int i;
    if(p!=0){
        for(i = 0; i <= level; i++) printf(" ");
        printf("%d\n", p->key);
        preorder(p->left, level+1);
        preorder(p->right, level+1);
    }
}

}


void search(int key){
    Tree *p;
    if(root == 0 ){
            printf("arbore vid");
            return;
    }
    p = root;
    while(p){
        if(p->key == key){
                printf("da, nodul exista");
                return;
        }
        else if(key<p->key) p = p->left;
        else p = p->right;
    }
    printf("nodul nu exista");

}

void deleteNode(Tree *rad){
    if(rad!=0){
        deleteNode(rad->left);
        deleteNode(rad->right);
        free(rad);
    }
}

Tree* searchR(int key){
    Tree *p;
    if(root == 0 ){
            printf("arbore vid");
            return 0;
    }
    p = root;
    while(p){
        if(p->key == key){
                //printf("da, nodul exista");
                return p;
        }
        else if(key<p->key) p = p->left;
        else p = p->right;
    }
    printf("nodul nu exista");
    return 0;

}




int main()
{
    int opt,key;
    printf("\n Choose action \n1.Create\n2.Display in preorder\n");
    scanf("%d",&opt);
    while(opt)
    {

        switch(opt)
        {
        case 0:
            return 0;
            break;
        case 1:
            scanf("%d", &key);
            //printf("%d", key);
            insertBin(key);
            break;
        case 2:
            preorderBin(root, 0);
            break;
        case 3:
            scanf("%d", &key);
            search(key);
            break;
        case 4:
            inorder(root, 0);
            break;
        case 5:
            scanf("%d", &key);
            deleteNode(searchR(key));
            break;
        }
        printf("\n Choose action \n1.Create\n2.Display in preorder\n");
        scanf("%d",&opt);
    }
}
