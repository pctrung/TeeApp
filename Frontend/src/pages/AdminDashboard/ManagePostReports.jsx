import {
    Card, CardBody, CardFooter, CardHeader, Dropdown,
    DropdownItem,
    NavbarInput
} from "@material-tailwind/react";
import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import Input from "components/Input";
import LoadingSpinner from "components/LoadingSpinner";
import { Pagination } from "./components/Pagination";
import useAccountApi from "hooks/api/useAccountApi";
import usePostApi from "hooks/api/usePostApi";
import usePostReportApi from "hooks/api/usePostReportApi";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { DefaultPagination } from "utils/Constants";

export default function ManagePostReports() {
    const [isOpenModal, setIsOpenModal] = useState(false);
    const [note, setNote] = useState("");
    const [selectedPostId, setSelectedPostId] = useState(0);
    const [postReports, setPostReports] = useState([]);
    const [filteredPostReports, setFilteredPostReports] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const [showUnhandledReportOnly, setShowUnhandledReportOnly] = useState(false);
    const [keyword, setKeyword] = useState("");
    const [pagination, setPagination] = useState({...DefaultPagination, limit: 10});

    const postApi = usePostApi();
    const postReportApi = usePostReportApi();
    const accountApi = useAccountApi();

    const fetchData = async () => {
        setIsLoading(true);
        const response = await postReportApi.getAll()
        setPostReports(response)
        setIsLoading(false);
    }

    useEffect(() => {
        fetchData();
    }, []);

    useEffect(() => {
        setFilteredPostReports(postReports.filter(report => {
            let isValid = true;
            if (showUnhandledReportOnly) {
                isValid = !report.isHandled;
            }
            if (keyword) {
                isValid = isValid && (report.content?.toLowerCase().includes(keyword?.toLowerCase()) ||
                    report.reportedPost?.creator?.userName?.toLowerCase()?.includes(keyword?.toLowerCase()) ||
                    report.reportedPost?.creator?.fullName?.toLowerCase()?.includes(keyword?.toLowerCase()) ||
                    report.reportedPost?.content?.toLowerCase()?.includes(keyword?.toLowerCase()));
            }
            return isValid;
        }))
    }, [postReports, showUnhandledReportOnly, keyword])

    useEffect(() => {
        setPagination({
            ...pagination,
            pageCount: Math.ceil(filteredPostReports.length / pagination.limit),
        })
    }, [filteredPostReports]);

    const getTextClass = (post) => {
        return post?.isHandled ? "text-gray-400" : ""
    }

    const onClickHidePost = (post) => {
        if (post?.isHideByAdmin) {
            showPost(post.id);
        } else {
            setSelectedPostId(post.id);
            setIsOpenModal(true)
        }
    }

    const hidePost = async () => {
        try {
            setIsOpenModal(false);
            await postApi.hide(selectedPostId, note);
            toast.success("Hide post succeeded!");
            await fetchData();
            setNote("");
        } catch (error) { }
    }

    const showPost = async (postId) => {
        try {
            setIsOpenModal(false);
            await postApi.show(postId, note);
            toast.success("Show post succeeded!")
            await fetchData();
        } catch (error) { }
    }

    const onClickLockButton = (post) => {
        if (isCreatorLocked(post)) {
            unlockCreator(post.creator?.userName);
        } else {
            lockCreator(post.creator?.userName);
        }
    }

    const lockCreator = async (userName) => {
        try {
            setIsOpenModal(false);
            await accountApi.lock(userName);
            toast.success("Account locked!");
            await fetchData();
        } catch (error) { }
    }

    const unlockCreator = async (userName) => {
        try {
            setIsOpenModal(false);
            await accountApi.unlock(userName);
            toast.success("Account unlocked!")
            await fetchData();
        } catch (error) { }
    }

    const clickHandleReport = async (report) => {
        report.isHandled = !report.isHandled;
        try {
            await postReportApi.update({ reportId: report.id, isHandled: report.isHandled, content: report.content });
            toast.success("Update report succeeded!");
            await fetchData();
        } catch (error) { }
    }

    const handlePageChange = (page) => {
        setPagination(pre => ({ ...pre, page }))
    }

    useEffect(() => {
        setPagination(pre => ({ ...pre, page: 1, keyword: keyword }))
    }, [keyword])

    return (
        <>
            <ToastContainer />
            <ConfirmModal
                isOpen={isOpenModal}
                closeAction={() => setIsOpenModal(false)}
                title="Are you sure?"
                content={<div className="w-full mt-4 space-y-3">
                    <label
                        htmlFor="fistName"
                        className="md:text-base text-sm dark:text-dark-txt"
                    >
                        Write your note to hide this post
                    </label>
                    <Input
                        id="firstName"
                        value={note}
                        onChange={(e) => setNote(e.target.value)}
                    />
                </div>}
                confirmButtonTitle="Hide post"
                confirmButtonAction={hidePost}
            />
            <div className="bg-green-500 px-3 md:px-8 h-36" />
            <div className="px-3 md:px-8 -mt-32">
                <div className="container mx-auto max-w-full">
                    <Card>
                        <CardHeader className="grid" size="sm" color="lightBlue" contentPosition="space-between">
                            <div className="flex justify-between">
                                <h2 className="text-white text-2xl">Report Management</h2>
                                <NavbarInput placeholder="Search" onChange={e => setKeyword(e?.target?.value)} />
                            </div>
                        </CardHeader>
                        <CardBody className="items-center w-full bg-transparent border-collapse">
                            <div className="flex justify-end">
                                <input type="checkbox" name="showUnhandled" id="showUnhandled" className="cursor-pointer"
                                    checked={showUnhandledReportOnly} onChange={(e) => setShowUnhandledReportOnly(e.target.checked)} />
                                <label onClick={() => {
                                    setShowUnhandledReportOnly(pre => !pre);
                                    setPagination({ ...pagination, page: 1 })
                                }} name="showUnhandled" className="cursor-pointer ml-2">Show unhandled report only</label>
                            </div>
                            <div className="grid grid-cols-12">
                                <HeaderCell>Report Id</HeaderCell>
                                <HeaderCell className="col-span-3">Report Content</HeaderCell>
                                <HeaderCell className="col-span-2">Creator</HeaderCell>
                                <HeaderCell className="col-span-3">Post Content</HeaderCell>
                                <HeaderCell className="col-span-2">Handled</HeaderCell>
                                <HeaderCell>Action</HeaderCell>
                            </div>
                            {isLoading
                                ? <div className="flex justify-center pt-10">
                                    <LoadingSpinner />
                                </div>
                                : <div className="overflow-x-hidden max-h-70vh">
                                    {filteredPostReports?.length > 0 ?
                                        filteredPostReports
                                            ?.slice((pagination.page - 1) * pagination.limit, pagination.page * pagination.limit)
                                            ?.map((report, index) => <div
                                                className={"border-b border-gray-200 grid grid-cols-12 " + getTextClass(report)}
                                                key={report?.id}>
                                                <TableCell>{report.id}</TableCell>
                                                <TableCell className="col-span-3 overflow-hidden overflow-ellipsis">{report.content}</TableCell>
                                                <TableCell className="col-span-2 overflow-hidden overflow-ellipsis">
                                                    <Link
                                                        className="font-semibold text-sm cursor-pointer hover:underline"
                                                        to={`/profile/${report.reportedPost?.creator?.userName}`}>
                                                        {report.reportedPost?.creator?.fullName}{isCreatorLocked(report.reportedPost) ? " (Locked)" : ""}
                                                    </Link>
                                                </TableCell>
                                                <TableCell className="col-span-3 whitespace-normal">{report.reportedPost?.content}</TableCell>
                                                <TableCell className="col-span-2">
                                                    {report.reportedPost?.isHideByAdmin ? <span className="p-1 text-xs bg-red-500 inline-block rounded text-white">Post Hidden</span> : ""}
                                                    {report.reportedPost?.isHideByAdmin && report.reportedPost?.hideByAdminNote && <div>Note: {report.reportedPost?.hideByAdminNote}</div>}
                                                    {isCreatorLocked(report.reportedPost) ?
                                                        <span className="p-1 text-xs bg-red-500 inline-block rounded text-white">Creator Locked</span> : ""}
                                                    {report.isHandled ? <span className="inline-block mt-1 p-1 text-sm text-white bg-green-500 rounded">Handled </span> : ""}
                                                </TableCell>
                                                <TableCell>
                                                    <Dropdown
                                                        color="transparent"
                                                        buttonText={
                                                            <ClickableIcon
                                                                secondMode
                                                                className="p-2"
                                                                iconClass="bx bx-dots-vertical-rounded"
                                                            />
                                                        }
                                                        rounded>
                                                        <DropdownItem onClick={() => onClickHidePost(report.reportedPost)} color="green">
                                                            {report.reportedPost?.isHideByAdmin ? "Show post" : "Hide post"}
                                                        </DropdownItem>
                                                        <DropdownItem color="green"
                                                            onClick={() => onClickLockButton(report.reportedPost)}>
                                                            {isCreatorLocked(report.reportedPost) ? "Unlock creator" : "Lock creator"}
                                                        </DropdownItem>
                                                        <DropdownItem color="green">
                                                            <Link target="_blank" to={`/posts/${report.reportedPost?.id}`}>
                                                                Go to post
                                                            </Link>
                                                        </DropdownItem>
                                                        <DropdownItem onClick={() => clickHandleReport(report)} color="green">
                                                            {report?.isHandled ? "Mark unhandled" : "Mark handled"}
                                                        </DropdownItem>
                                                    </Dropdown>
                                                </TableCell>
                                            </div>) : <div className="mt-8 flex justify-center">Not found any reports</div>}
                                </div>}
                        </CardBody>
                        <CardFooter>
                            <div className="flex justify-end">
                                <Pagination
                                    handlePageChange={handlePageChange}
                                    hasPreviousPage={pagination.page > 1}
                                    hasNextPage={pagination.page > pagination.pageCount}
                                    pageCount={pagination.pageCount}
                                    page={pagination.page} />
                            </div>
                        </CardFooter>
                    </Card>
                </div>
            </div>
        </>
    );
}

const isCreatorLocked = (post) => {
    return new Date(post?.creator?.lockoutEnd) > new Date();
}

const HeaderCell = ({ children, className }) => <span className={"px-2 text-purple-500 align-middle border-b border-solid border-gray-200 py-3 text-sm font-light text-left " + className ?? ""}>
    {children}
</span>

const TableCell = ({ children, className }) => <span className={"align-middle font-light text-sm px-2 py-4 text-left " + className ?? ""}>
    {children}
</span>