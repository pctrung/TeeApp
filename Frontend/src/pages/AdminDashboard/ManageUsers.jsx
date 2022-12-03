import {
    Card, CardBody, CardFooter, CardHeader, Dropdown,
    DropdownItem,
    NavbarInput
} from "@material-tailwind/react";
import ClickableIcon from "components/ClickableIcon";
import LoadingSpinner from "components/LoadingSpinner";
import useAccountApi from "hooks/api/useAccountApi";
import { useDebounce } from "hooks/api/useDebounce";
import useUserApi from "hooks/api/useUserApi";
import _ from "lodash";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { Pagination } from "./components/Pagination";
import { GenderName } from "utils/Enums";
import { DefaultPagination } from "utils/Constants";

export default function ManageUsers() {
    const [pagination, setPagination] = useState({...DefaultPagination, limit: 10});
    const [users, setUsers] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const [hasMore, setHasMore] = useState(true);
    const [pageCount, setPageCount] = useState(0);
    const [keyword, setKeyword] = useState("");
    const debounceKeyword = useDebounce(keyword);

    const accountApi = useAccountApi();
    const userApi = useUserApi();

    useEffect(() => {
        (async () => {
            if (pagination) {
                setIsLoading(true);
                const response = await userApi.getUserList(pagination)
                setUsers(response.items)
                setHasMore(pagination.page < response.pageCount);
                setPageCount(response.pageCount)
                setIsLoading(false);
            }
        })();
    }, [pagination?.keyword, pagination?.page, pagination?.limit]);

    const getTextClass = (user) => {
        return isUserLocked(user) ? "text-gray-400" : ""
    }

    const onClickLockButton = (user) => {
        if (isUserLocked(user)) {
            unlockUser(user.userName);
        } else {
            lockUser(user.userName);
        }
    }

    const lockUser = async (userName) => {
        const index = users.findIndex(x => x.userName === userName);
        if (index < 0) {
            return;
        }
        const oldUsers = _.cloneDeep(users);
        const newUsers = [...users];
        newUsers[index].lockoutEnd = new Date(8640000000000000);
        setUsers(newUsers);

        try {
            await accountApi.lock(newUsers[index]?.userName);
            toast.success("Account locked!")
        } catch (error) {
            setUsers(oldUsers);
        }
    }

    const unlockUser = async (userName) => {
        const index = users.findIndex(x => x.userName === userName);
        if (index < 0) {
            return;
        }
        const oldUsers = _.cloneDeep(users);
        const newUsers = [...users];
        newUsers[index].lockoutEnd = new Date(-8640000000000000);
        setUsers(newUsers);

        try {
            await accountApi.unlock(newUsers[index]?.userName);
            toast.success("Account unlocked!")
        } catch (error) {
            setUsers(oldUsers);
        }
    }

    const handlePageChange = (page) => {
        setPagination(pre => ({ ...pre, page }))
    }

    useEffect(() => {
        setPagination(pre => ({ ...pre, page: 1, keyword: keyword }))
    }, [debounceKeyword])

    return (
        <>
            <ToastContainer />
            <div className="bg-green-500 px-3 md:px-8 h-36" />
            <div className="px-3 md:px-8 -mt-32">
                <div className="container mx-auto max-w-full">
                    <Card>
                        <CardHeader className="grid" size="sm" color="lightBlue" contentPosition="space-between">
                            <div className="flex justify-between">
                                <h2 className="text-white text-2xl">User Management</h2>
                                <NavbarInput placeholder="Search" onChange={e => setKeyword(e?.target?.value)} />
                            </div>
                        </CardHeader>
                        <CardBody className="items-center w-full bg-transparent border-collapse">
                            <div className="grid grid-cols-11">
                                <HeaderCell>No</HeaderCell>
                                <HeaderCell className="col-span-2">Name</HeaderCell>
                                <HeaderCell>Phone</HeaderCell>
                                <HeaderCell className="col-span-2">Email</HeaderCell>
                                <HeaderCell>UserName</HeaderCell>
                                <HeaderCell>Gender</HeaderCell>
                                <HeaderCell>Avatar</HeaderCell>
                                <HeaderCell>Status</HeaderCell>
                                <HeaderCell>Action</HeaderCell>
                            </div>
                            {isLoading
                                ? <div className="flex justify-center pt-10">
                                    <LoadingSpinner />
                                </div>
                                : <div className="overflow-x-hidden max-h-70vh">
                                    {users?.length > 0 ? users?.map((user, index) => {
                                        const orderNo = (pagination.limit * (pagination.page - 1)) + (index + 1);
                                        return <div className={"border-b border-gray-200 grid grid-cols-11 " + getTextClass(user)} key={user?.id}>
                                            <TableCell>{orderNo}</TableCell>
                                            <TableCell className="col-span-2 overflow-hidden overflow-ellipsis">{`${user.fullName} ${user.nickName ? ` (${user.nickName})` : ""}`}</TableCell>
                                            <TableCell>{user.phoneNumber}</TableCell>
                                            <TableCell className="col-span-2">{user?.email}</TableCell>
                                            <TableCell>{user?.userName}</TableCell>
                                            <TableCell>{GenderName[user?.gender]}</TableCell>
                                            <TableCell>
                                                {user?.avatarUrl &&
                                                    <div
                                                        className="col-span-1 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
                                                    >
                                                        <img
                                                            className="object-contain md:max-h-128 max-h-112 h-full w-full"
                                                            src={user?.avatarUrl}
                                                            alt={`User avatar ${index}`}
                                                        />
                                                    </div>}
                                            </TableCell>
                                            <TableCell>
                                                {isUserLocked(user) ? <span className="p-1 text-sm text-white bg-red-400 rounded">Locked</span> : <span className="p-1 text-sm text-white bg-green-400 rounded">Active</span>}
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
                                                    <DropdownItem color="green"
                                                        onClick={() => onClickLockButton(user)}>
                                                        {isUserLocked(user) ? "Unlock user" : "Lock user"}
                                                    </DropdownItem>
                                                    <DropdownItem color="green">
                                                        <Link target="_blank" to={`/profile/${user?.userName}`}>
                                                            Go to profile
                                                        </Link>
                                                    </DropdownItem>
                                                </Dropdown>
                                            </TableCell>
                                        </div>
                                    }) : <div className="mt-8 flex justify-center">Not found any users</div>}
                                </div>}
                        </CardBody>
                        <CardFooter>
                            <div className="flex justify-end">
                                <Pagination
                                    handlePageChange={handlePageChange}
                                    hasPreviousPage={pagination.page > 1}
                                    hasNextPage={hasMore}
                                    pageCount={pageCount}
                                    page={pagination.page} />
                            </div>
                        </CardFooter>
                    </Card>
                </div>
            </div>
        </>
    );
}

const isUserLocked = (user) => {
    return new Date(user?.lockoutEnd) > new Date();
}

const HeaderCell = ({ children, className }) => <span className={"px-2 text-purple-500 align-middle border-b border-solid border-gray-200 py-3 text-sm font-light text-left " + className ?? ""}>
    {children}
</span>

const TableCell = ({ children, className }) => <span className={"align-middle font-light text-sm px-2 py-4 text-left  whitespace-normal break-all " + className ?? ""}>
    {children}
</span>