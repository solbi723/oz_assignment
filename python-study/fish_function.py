stock = {"팥붕어빵" : 10,
         "슈크림붕어빵": 6,
         "초코붕어빵": 5}

price = {"팥붕어빵" : 1000,
         "슈크림붕어빵" : 1200,
         "초코붕어빵" : 1500}

sales = {"팥붕어빵" : 0,
         "슈크림붕어빵": 0,
         "초코붕어빵": 0}

def main():

    while True:
        mode = input("원하는 모드를 선택해주세요(주문, 관리자, 종료 : ")
        if mode == "종료":
            break
        if mode == "주문":
           order_bread()
        if mode == "관리자":
            manage_stock()
        print("기능을 종료합니다.")
        #total_sales()


def order_bread(): #주문을 받는 기능 입니다.
    while True:
        bread_type = input("붕어빵 종류를 입력해주세요(팥붕어빵, 슈크림붕어빵, 초코붕어빵 중 하나를 선택해주세요) 뒤로 돌아가길 원하시면 돌아가기를 입력해주세요")
        if bread_type == "돌아가기":  # bread_type에는 초코붕어빵
            break
        bread_count = int(input("주문할 붕어빵 개수를 입력해주세요 : "))
        if stock[bread_type] >= bread_count:
            stock[bread_type] -= bread_count  # stock["초코붕어빵"] = 5-3
            print(f'{bread_type} {bread_count}개를 판매했습니다')
        else:
            print("현재 주문한 붕어빵의 개수보다 적어 판매가 불가합니다.")
def manage_stock(): #관리자 기능 입니다.
            while True:
                bread_type = input("추가할 붕어빵 종류를 입력해줒세요(팥붕어빵, 슈크림붕어빵, 초코붕어빵 중 하나를 선택해주세요) 뒤로 돌아가길 원하시면 돌아가기를 입력해주세요")
                if bread_type == "돌아가기": # bread_type에는 초코붕어빵
                    break
                bread_count = int(input("추가할 붕어빵 개수를 입력하세요: "))
                stock[bread_type] += bread_count # stock["초코붕어빵"] 5 + bred_count 10 => 15 => stock["초코붕어빵"] = 15
                print(f'{bread_type}의 재고가 {bread_count}개 추가되었습니다.')

def total_sales():
    total_sales = sum(sales[bread] * price[bread] for bread in sales)
    print((f'총 매출:  {total_sales}원'))
    #함수를 실행 => 호출

main()

