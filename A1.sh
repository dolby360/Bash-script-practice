#!/bin/bash

dig_pow(){
    myVar="$1"
    toPow="$2"
    store=0
    ten=10
    arr[0]=0
    counter=0
    while [ "$myVar" -ne 0 ];do
        #Take the last number every time.
        arr["$counter"]=$((myVar%ten))
        counter=$((counter+1))
        myVar=$((myVar/ten))
    done
    counter=$((counter-1))
    #Calculate the last power.
    endPow=$((toPow+counter))
    calcNum=0
    for i in "${arr[@]}";do
        store=$((i**endPow))
        endPow=$((endPow-1))
        calcNum=$((calcNum+store))
    done
    iter=0
    findNum=0
    theVar="$1"
    while [ "$calcNum" -gt "$findNum"  ];do
        findNum=$((theVar*iter))
        if [ "$calcNum" == "$findNum"  ]
        then
            echo "$iter"
            return "$iter"
        fi
        iter=$((iter+1))
    done
    #echo "$iter"
    echo "-1"
    return -1
}
dig_pow "$1" "$2"
