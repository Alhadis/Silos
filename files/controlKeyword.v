// 输出小于4的奇数
fn main(){
    for i:=0; i < 5; i++ {
        if i % 2 ==0{
            // 跳过当前循环
            continue
        }else{
            println(i)
        }
        if i == 4 {
            // 结束循环
            break
        }
    }
}