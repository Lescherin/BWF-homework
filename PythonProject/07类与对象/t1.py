import time

class Student:
    # 类属性传入字典，用于存储所有学生的信息
    students = {}      # 格式：{1: 'Mike', 2: 'Kate', 3: 'Linda' }

    @classmethod
    # 类方法：添加学生 如果学生已存在，提示添加失败
    #student为类属性，引用该属性格式：cls.students
    def add_stu(cls,sid,name):  
        if sid not in cls.students:
            cls.students[sid] = name
            print(f'添加学生 {sid}:{cls.students[sid]} 成功')
        else:
            print(f'添加学生 {sid} 失败，该学生已存在')



    @classmethod
    # 类方法：修改学生信息
    def update_stu(cls,sid,name):
        if sid in cls.students:
            cls.students[sid] = name
            print(f'修改学生 {sid}:{cls.students[sid]} 成功')
        else:
            print(f'修改学生 {sid} 失败，学生不存在')

    @classmethod
    # 类方法：删除学生信息
    def delete_stu(cls,sid):
        if sid in cls.students:
                print(f'删除学生 {sid}:{cls.students[sid]} 成功')
                del cls.students[sid]
        else:
            print(f'删除学生 {sid} 失败，该学生不存在')

    @classmethod
    # 类方法：查询学生信息 
    def select_stu(cls):       
        print('查询学生信息...')
        # 遍历字典，展示所有学生的信息 使用双循环遍历sid,name:sid为键，name为值
        # .items()方法返回字典的所有键值对
        # 等价于：for sid in cls.students:
        #            name = cls.students[sid]
        for sid,name in cls.students.items(): #重点
            print(f'{sid}:{name}')
            time.sleep(1)
        print('查询完成...')


if __name__ == '__main__':
    Student.add_stu(1,'Mike')
    time.sleep(1)
    Student.add_stu(2,'Kate')
    time.sleep(1)
    Student.add_stu(3,'Linda')  
    time.sleep(1)
    Student.add_stu(4,'Jack')
    time.sleep(1)
    Student.select_stu()   # 展示4个学生的信息
    time.sleep(2)
    Student.update_stu(1,'Darcy')
    time.sleep(2)
    Student.delete_stu(1)  # 展示4个学生信息，其中，第一个学生信息被修改
    time.sleep(2)
    Student.select_stu()   # 展示后3个学生信息