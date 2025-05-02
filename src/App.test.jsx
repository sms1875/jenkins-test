/* eslint-env vitest */
import React from 'react'
import { render, fireEvent } from '@testing-library/react'
import App from './App.jsx'

test('버튼 클릭 시 카운트가 증가해야 한다', () => {
  const { getByText } = render(<App />)
  const button = getByText(/count is/i)
  expect(button.textContent).toBe('count is 0')
  fireEvent.click(button)
  expect(button.textContent).toBe('count is 1')
})