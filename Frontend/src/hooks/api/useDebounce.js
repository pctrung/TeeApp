import { useEffect, useState } from 'react'

const DEBOUNCE_TIME = 1000;
export function useDebounce(value, delay = DEBOUNCE_TIME) {
    const [debouncedValue, setDebouncedValue] = useState(value)

    useEffect(() => {
        const timer = setTimeout(() => setDebouncedValue(value), delay || DEBOUNCE_TIME)

        return () => {
            clearTimeout(timer)
        }
    }, [value, delay])

    return debouncedValue
}

