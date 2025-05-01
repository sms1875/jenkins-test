// tests/example.test.js
test('adds 1 + 2 to equal 3', () => {
  expect(1 + 2).toBe(3);
});

test('intentional failure 1', () => {
  expect(true).toBe(false);
});

test('intentional failure 2', () => {
  expect(5).toBe(10);
});
