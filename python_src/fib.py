from python2verilog import verilogify

@verilogify
def fib(n):
    a = 0
    b = 1
    count = 0
    while count < n:
        yield a
        a, b = b, a + b
        count += 1

fib(10)

@verilogify
def seven_seg(n):
    """
    Seven segment display
    """
    if n == 0:
        return 63
    elif n == 1:
        return 6
    elif n == 2:
        return 91
    elif n == 3:
        return 79
    elif n == 4:
        return 102
    elif n == 5:
        return 109
    elif n == 6:
        return 125
    elif n == 7:
        return 7
    elif n == 8:
        return 127
    elif n == 9:
        return 111
    else:
        return 0

seven_seg(9)