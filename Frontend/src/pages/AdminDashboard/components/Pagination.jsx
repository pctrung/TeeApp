import { useCallback, useState } from "react";

function Button({ content, onClick, active, disabled }) {
    return (
        <button
            className={`flex flex-col cursor-pointer items-center justify-center w-9 h-9 shadow-[0_4px_10px_rgba(0,0,0,0.03)] text-sm font-normal transition-colors rounded-lg
      ${active ? "bg-green-500 text-white" : "text-green-500"}
      ${!disabled
                    ? "bg-white hover:bg-green-500 hover:text-white"
                    : "text-green-300 bg-white cursor-not-allowed"
                }
      `}
            onClick={onClick}
            disabled={disabled}
        >
            {content}
        </button>
    );
}

function Pagination({
    handlePageChange,
    hasPreviousPage,
    hasNextPage,
    pageCount,
    page,
}) {
    const renderPageLinks = useCallback(() => {
        if (pageCount === 0) return null;

        const pageIndex = page > 0 ? page - 1 : page;

        const visiblePageButtonCount = 5;
        let numberOfButtons = pageCount < visiblePageButtonCount ? pageCount : visiblePageButtonCount;
        const pageIndices = [pageIndex];
        numberOfButtons--;
        [...Array(numberOfButtons)].forEach((_item, itemIndex) => {
            const pageNumberBefore = pageIndices[0] - 1;
            const pageNumberAfter = pageIndices[pageIndices.length - 1] + 1;
            if (
                pageNumberBefore >= 0 &&
                (itemIndex < numberOfButtons / 2 || pageNumberAfter > pageCount - 1)
            ) {
                pageIndices.unshift(pageNumberBefore);
            } else {
                pageIndices.push(pageNumberAfter);
            }
        });
        return pageIndices.map((pageIndexToMap) => (
            <li key={pageIndexToMap}>
                <Button
                    content={pageIndexToMap + 1}
                    onClick={() => handlePageChange(pageIndexToMap + 1)}
                    active={pageIndex === pageIndexToMap}
                />
            </li>
        ));
    }, [pageCount, page]);
    return (
        <ul className="flex gap-2">
            <li>
                <Button
                    content={"|<"}
                    onClick={() => handlePageChange(1)}
                    disabled={!hasPreviousPage}
                />
            </li>
            {renderPageLinks()}
            <li>
                <Button
                    content={">|"}
                    onClick={() => handlePageChange(pageCount)}
                    disabled={!hasNextPage}
                />
            </li>
        </ul>
    );
}

export { Pagination };