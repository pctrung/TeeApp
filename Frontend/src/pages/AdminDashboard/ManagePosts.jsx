import {
    Card, CardBody, CardFooter, CardHeader, Dropdown,
    DropdownItem,
    NavbarInput
} from "@material-tailwind/react";
import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import Input from "components/Input";
import LoadingSpinner from "components/LoadingSpinner";
import useAccountApi from "hooks/api/useAccountApi";
import { useDebounce } from "hooks/api/useDebounce";
import usePostApi from "hooks/api/usePostApi";
import _ from "lodash";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { DefaultPagination } from "utils/Constants";
import { isVideo } from "utils/UtilityMethods";
import { Pagination } from "./components/Pagination";

export default function ManagePosts() {
    const [pagination, setPagination] = useState({...DefaultPagination, limit: 10});
    const [isOpenModal, setIsOpenModal] = useState(false);
    const [note, setNote] = useState("");
    const [selectedPostId, setSelectedPostId] = useState(0);
    const [posts, setPosts] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const [hasMore, setHasMore] = useState(true);
    const [pageCount, setPageCount] = useState(0);
    const [keyword, setKeyword] = useState("");
    const debounceKeyword = useDebounce(keyword);

    const postApi = usePostApi();
    const accountApi = useAccountApi();

    useEffect(() => {
        (async () => {
            if (pagination) {
                setIsLoading(true);
                const response = await postApi.getAllAdmin(pagination)
                setPosts(response.items)
                setHasMore(pagination.page < response.pageCount);
                setPageCount(response.pageCount)
                setIsLoading(false);
            }
        })();
    }, [pagination?.keyword, pagination?.page, pagination?.limit]);

    const getTextClass = (post) => {
        return post?.isHideByAdmin ? "text-gray-400" : ""
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
        const index = posts.findIndex(x => x.id === selectedPostId);
        if (index < 0) {
            return;
        }
        const oldPosts = _.cloneDeep(posts);
        const newPosts = [...posts];
        newPosts[index].isHideByAdmin = true;
        newPosts[index].hideByAdminNote = note;
        setPosts(newPosts);
        setIsOpenModal(false);
        try {
            await postApi.hide(selectedPostId, note);
            toast.success("Hide post succeeded!")
        } catch (error) {
            setPosts(oldPosts);
        }
    }

    const showPost = async (postId) => {
        const index = posts.findIndex(x => x.id === postId);
        if (index < 0) {
            return;
        }
        const oldPosts = _.cloneDeep(posts);
        const newPosts = [...posts];
        newPosts[index].isHideByAdmin = false;
        newPosts[index].hideByAdminNote = "";
        setPosts(newPosts);
        setIsOpenModal(false);
        try {
            await postApi.show(selectedPostId, note);
            toast.success("Show post succeeded!")
        } catch (error) {
            setPosts(oldPosts);
        }
    }

    const onClickLockButton = (post) => {
        if (isCreatorLocked(post)) {
            unlockCreator(post.id);
        } else {
            lockCreator(post.id);
        }
    }

    const lockCreator = async (postId) => {
        const index = posts.findIndex(x => x.id === postId);
        if (index < 0) {
            return;
        }
        const oldPosts = _.cloneDeep(posts);
        const newPosts = [...posts];
        newPosts[index].creator.lockoutEnd = new Date(8640000000000000);
        setPosts(newPosts);
        setIsOpenModal(false);

        try {
            await accountApi.lock(newPosts[index].creator?.userName);
            toast.success("Account locked!")
        } catch (error) {
            setPosts(oldPosts);
        }
    }

    const unlockCreator = async (postId) => {
        const index = posts.findIndex(x => x.id === postId);
        if (index < 0) {
            return;
        }
        const oldPosts = _.cloneDeep(posts);
        const newPosts = [...posts];
        newPosts[index].creator.lockoutEnd = new Date(-8640000000000000);
        setPosts(newPosts);
        setIsOpenModal(false);

        try {
            await accountApi.unlock(newPosts[index].creator?.userName);
            toast.success("Account unlocked!")
        } catch (error) {
            setPosts(oldPosts);
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
                                <h2 className="text-white text-2xl">Post Management</h2>
                                <NavbarInput placeholder="Search" onChange={e => setKeyword(e?.target?.value)} />
                            </div>
                        </CardHeader>
                        <CardBody className="items-center w-full bg-transparent border-collapse">
                            <div className="grid grid-cols-10">
                                <HeaderCell>ID</HeaderCell>
                                <HeaderCell className="col-span-2">Creator</HeaderCell>
                                <HeaderCell className="col-span-4">Content</HeaderCell>
                                <HeaderCell>Image</HeaderCell>
                                <HeaderCell>Status</HeaderCell>
                                <HeaderCell>Action</HeaderCell>
                            </div>
                            {isLoading
                                ? <div className="flex justify-center pt-10">
                                    <LoadingSpinner />
                                </div>
                                : <div className="overflow-x-hidden max-h-70vh">
                                    {posts?.length > 0 ? posts?.map((post, index) => <div
                                        className={"border-b border-gray-200 grid grid-cols-10 " + getTextClass(post)}
                                        key={post?.id}>
                                        <TableCell>{post.id}</TableCell>
                                        <TableCell className="col-span-2 overflow-hidden overflow-ellipsis">
                                            <Link
                                                className="font-semibold text-sm cursor-pointer hover:underline"
                                                to={`/profile/${post?.creator?.userName}`}>
                                                {post?.creator?.fullName}{isCreatorLocked(post) ? " (Locked)" : ""}
                                            </Link>
                                        </TableCell>
                                        <TableCell className="col-span-4 whitespace-normal">{post?.content}</TableCell>
                                        <TableCell>
                                            {post?.photos?.[0]?.imageUrl &&
                                                <div
                                                    className="col-span-1 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
                                                >
                                                    {isVideo(post?.photos?.[0])
                                                        ? <video src={post?.photos?.[0]?.imageUrl}></video>
                                                        : <img className="object-contain md:max-h-128 max-h-112 h-full w-full" src={post?.photos?.[0]?.imageUrl} alt="Preview" />}
                                                </div>}
                                        </TableCell>
                                        <TableCell>
                                            {post?.isHideByAdmin ? <span className="p-1 text-sm text-white bg-red-400 rounded">Hidden</span> : <span className="p-1 text-sm text-white bg-green-400 rounded">Showing</span>}
                                            {post?.isHideByAdmin && post?.hideByAdminNote && <div className="mt-2">Note: {post?.hideByAdminNote}</div>}
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
                                                <DropdownItem onClick={() => onClickHidePost(post)} color="green">
                                                    {post?.isHideByAdmin ? "Show post" : "Hide post"}
                                                </DropdownItem>
                                                <DropdownItem color="green"
                                                    onClick={() => onClickLockButton(post)}>
                                                    {isCreatorLocked(post) ? "Unlock creator" : "Lock creator"}
                                                </DropdownItem>
                                                <DropdownItem color="green">
                                                    <Link target="_blank" to={`/posts/${post?.id}`}>
                                                        Go to post
                                                    </Link>
                                                </DropdownItem>
                                            </Dropdown>
                                        </TableCell>
                                    </div>) : <div className="mt-8 flex justify-center">Not found any posts</div>}
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

const isCreatorLocked = (post) => {
    return new Date(post?.creator?.lockoutEnd) > new Date();
}

const HeaderCell = ({ children, className }) => <span className={"px-2 text-purple-500 align-middle border-b border-solid border-gray-200 py-3 text-sm font-light text-left " + className ?? ""}>
    {children}
</span>

const TableCell = ({ children, className }) => <span className={"align-middle font-light text-sm px-2 py-4 text-left " + className ?? ""}>
    {children}
</span>