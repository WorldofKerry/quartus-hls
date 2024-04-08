from python2verilog import verilogify

@verilogify
def seven_seg(n):
    """
    Decimal digit to 7 segment display
    0 means on, 1 means off
    """
    if n == 0:
        return 192
    elif n == 1:
        return 249
    elif n == 2:
        return 164
    elif n == 3:
        return 176
    elif n == 4:
        return 153
    elif n == 5:
        return 146
    elif n == 6:
        return 130
    elif n == 7:
        return 248
    elif n == 8:
        return 128
    elif n == 9:
        return 144
    else:
        return 0

seven_seg(9)

@verilogify
def fib(n):
    a = 0
    b = 1
    count = 0
    while count < n:
        temp = seven_seg(a)
        yield temp
        a, b = b, a + b
        count += 1

fib(10)