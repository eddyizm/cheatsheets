# set property
mock = MagicMock()
mock.configure_mock(name='my_name')
mock.name
# returns 'my_name'

# mocking with MagicMock to avoid error: TypeError: 'Mock' object is not subscriptable
from unittest.mock import MagicMock

mock = MagicMock()

mock[0] = 'First'
mock[2] = 'second'

mock.__getitem__.return_value = 'new'

print(mock[0])  # 👉️ new
print(mock[:2])  # 👉️ new

# set return value
mock = Mock(return_value=3)
mock.return_value
# returns 3
mock()
# returns 3
