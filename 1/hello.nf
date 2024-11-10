process sayHello {
    output:
    path 'hello.txt'

    script:
    """
    echo 'Hello world!' > hello.txt
    """
}
