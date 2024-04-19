/*
 * circluarBuffer.cc
 *
 *  Created on: 2024年1月13日
 *      Author: wu
 */
#include "headers.h"
#include "circularBuffer.h"

Queue* QueueCreate(int k) {
    //动态开辟结构体
    Queue* obj = (Queue*)malloc(sizeof(Queue));
    //设置容量
    obj->capacity = k;
    //动态开辟结构体中的数组，多开一个空间用于判满
    obj->arr = (u32*)malloc(sizeof(int)*(obj->capacity+1));
    obj->front = obj->rear = 0;


    return obj;
}


bool QueueIsEmpty(Queue* obj) {
    return obj->front == obj->rear;


}


bool QueueIsFull(Queue* obj) {
    return (obj->rear+1)%(obj->capacity+1) == obj->front;
}


bool QueueEnQueue(Queue* obj, u32 value) {
    //当队列不满才插入
	assert(!QueueIsFull(obj));
    if(!QueueIsFull(obj)){
        obj->arr[obj->rear] = value;
        obj->rear = (obj->rear+1)%(obj->capacity+1);
        return true;
    }else{
        return false;
    }
}


bool QueueDeQueue(Queue* obj) {
    //当队列不为空才删除
	assert(!QueueIsEmpty(obj));
    if(!QueueIsEmpty(obj)){
        obj->front = (obj->front+1)%(obj->capacity+1);
        return true;
    }else{
        return false;
    }
}


u32 QueueFront(Queue* obj) {
    //当队列不为空获取，队为空返回-1
	assert(!QueueIsEmpty(obj));
    if(!QueueIsEmpty(obj)){
        return obj->arr[obj->front];
    }else{
        return -1;
    }
}


u32 QueueRear(Queue* obj) {
        //当队列不为空获取，队为空返回-1
	assert(!QueueIsEmpty(obj));
    if(!QueueIsEmpty(obj)){
        return obj->arr[(obj->rear+obj->capacity)%(obj->capacity+1)];
    }else{
        return -1;
    }
}



void QueueFree(Queue* obj) {
    free(obj->arr);
    free(obj);
}
