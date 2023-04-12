/* 
Cho một mảng nums chứa các số nguyên, hãy tìm giá trị lớn thứ ba trong mảng.
Nếu không có giá trị lớn thứ ba, trả về giá trị lớn nhất trong mảng.
 */



import 'dart:math';   // cái này để xử lí cái max ở hàng 15

int findThirdMax(List<int> nums) {           // bước 1, em khai báo hàm và list num và thực hiện một số thao tác ban đầu
  Set<int> setNums = nums.toSet();    // tại đây dùng toSet() để loại bỏ các phần tử trùng lặp, tạo ra một Set mới từ nums
  List<int> uniqueNums = setNums.toList();   // em chuyển set vừa loại các phần tử trùng lặp thành list uniqueNums để dễ xử lí ở các bước sau
  
  if (uniqueNums.length < 3) {   // nếu số phần tử trong uniqueNums mà nhỏ hơn 3 --> theo như đề bài (hàng 3), nếu k có gtri lớn thứ 3 thì trả về giá trị lớn nhất
    return uniqueNums.reduce(max);  // để trả về giá trị nhất, em dùng phương thức reduce(max)
  } else {
    uniqueNums.sort();     // phương thức sort dùng để sắp xếp list uniqueNums theo thứ tự tăng dần
    return uniqueNums[uniqueNums.length - 3];    // trả về phần tử ở vị trí uniqueNums.length - 3.
                                                // Vì uniqueNums đã được sắp xếp theo thứ tự tăng dần, nên phần tử này sẽ đứng ở vị trí thứ ba trong mảng.
  }
}
void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  int thirdMax = findThirdMax(nums);
  print('Giá trị lớn thứ ba trong mảng là: $thirdMax'); // In ra: Giá trị lớn thứ ba trong mảng là: 4
  
  List<int> nums2 = [1, 2];
  int thirdMax2 = findThirdMax(nums2);
  print('Giá trị lớn thứ ba trong mảng là: $thirdMax2'); // In ra: Giá trị lớn thứ ba trong mảng là: 2
}
