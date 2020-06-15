class APIController:
    def hello(self, name: str) -> str:
        return 'Hello {}'.format(name.title())
