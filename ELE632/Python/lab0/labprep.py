def labprep(x):

    x2 = str(x)  # convert student number to string
    # corresponding letters for student number digits
    x2na = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']

    for i in range(len(x2)):
        print(x2na[i] + ' - ' + x2[i])

    # sum all the digits in the student number to end up with one digit
    sum = x % 9
    if sum == 0:
        sum = 9

    print('\nS -', sum)


studentNum = int(input("Enter Student Number: "))
labprep(studentNum)
