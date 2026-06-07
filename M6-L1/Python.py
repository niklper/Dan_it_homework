site = "https://jsonplaceholder.typicode.com"
import requests

command1 = requests.get(site + "/users")
command2 = requests.get(site + "/posts")

#-------------------Task 1
# def task1():
#     command1 = requests.get(site + "/users")
#     #print(command1.text)
#     #print(command1.status_code)
#     data1 = command1.json()
#     for item in data1:
#         print(item['username'] + '-' + item['name'] + '-' + item['email'])

# task1()

#-------------------Task 2

# def getuser_posts(userid):
#     counter = 0    
#     for item in posts:
#             if item["userId"] == userid:
#                 counter = counter + 1     
#     # print("Counter = ", end = ' ')
#     # print(counter)
#     return counter

# def task2():
#     list_counter = []
#     dic_name = []
#     user_dict = {}
#     posts = command2.json()

#     for item in range(1, 11):
#         list_counter.append(getuser_posts(item)) #enter ID user for to display user`s data

#     data1 = command1.json()
#     for item in data1:
#         dic_name.append(item['username'])

#     user_dict = dict(zip(dic_name, list_counter))
#     print(user_dict)

#     # Сортируем словарь по убыванию значений
#     sorted_user_dic = dict(sorted(user_dict.items(), key=lambda item: item[1], reverse=True))
#     print(sorted_user_dic)

# task2()

#-------------------Task 3

# def getuser_name(userid):
#     command1 = requests.get(site + "/users")
#     data1 = command1.json()
#     for item in data1:
#         if item["id"] == userid:
#               user_name = item["username"]
#     return user_name

# def user_post_output(userid):
#     for item in posts:
#             if item["userId"] == userid:
#                 print(f"Post`s ID: < {item["id"]} >")
#                 print(f"Title: < {item["title"]} >")
#                 print(f"Content: < {item["body"]} >", end = "\n\n")
             
# posts = command2.json()
# userID = int(input("Enter user`s ID (1 - 10): "))

# print("------------------------------")
# print(f"User: < {getuser_name(userID)} > with user ID: < {userID} >")
# print("------------------------------")
# user_post_output(userID)

#-------------------Task 4
# def task4():
#     posts = command2.json()
#     filtered_data = {}

#     for massage in posts:
#         user = massage["userId"]
#         title = massage["title"]
#         body = massage["body"]
        
#         if title.startswith("do") or body.startswith("do"):
#             if user not in filtered_data:
#                 filtered_data[user] = []
#             filtered_data[user].append(massage)

#     for user, user_messages in filtered_data.items():
#         file_name = rf"C:\Users\koly0\OneDrive\Рабочий стол\Dan_it_homework\M6-L1\user_{user}.txt"
        
#         with open(file_name, "w", encoding="utf-8") as file:
#             for message in user_messages:
#                 print(message, file=file)

# task4()

#-------------------Task 5
def task5():
    command5 = requests.get(site + "/users")
    GEO_API_KEY = "69fb13dbb1590198246276wkb54354b"
    #print(command5.text)
    #print(command5.status_code)
    data5 = command5.json()
    for item in data5:
        lat = item['address']['geo']['lat']
        lng = item['address']['geo']['lng']
        API = requests.get(f"https://geocode.maps.co/reverse?lat={lat}&lon={lng}&api_key=" + GEO_API_KEY)
        print(f"{item["username"]} -> {API.text}")

task5()