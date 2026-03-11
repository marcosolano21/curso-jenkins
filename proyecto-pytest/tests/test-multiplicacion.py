import pytest

def multi(a ,b):
    # Funcion que multiplica
    return (a * b)


def test_multi():
    assert multi(1, 2) == 2
    assert multi(-1, -1) == 1
    assert multi(0, 100) == 0

