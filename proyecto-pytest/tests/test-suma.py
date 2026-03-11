import pytest

def suma(a, b):
    #Funcion que suma dos numeros
    return a + b

def test_suma():
    assert suma(1, 2) == 3
    assert suma(-1, 1) == 0
    assert suma(-1, -1) == -2

def test_suma_error():
    assert suma(1, 2) == 4
    assert suma(12, 2) == 4

