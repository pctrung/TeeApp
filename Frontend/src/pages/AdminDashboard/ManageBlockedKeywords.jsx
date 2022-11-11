import {
    Button,
    Card, CardBody, CardFooter, CardHeader
} from "@material-tailwind/react";
import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import Input from "components/Input";
import LoadingSpinner from "components/LoadingSpinner";
import useBlockedKeywordApi from "hooks/api/useBlockedKeywordApi";
import { useEffect, useState } from "react";
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

export default function ManageBlockedKeywords() {
    const [blockedKeywordGroups, setBlockedKeywordGroups] = useState([{}]);
    const [openGroupIds, setOpenGroupIds] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const [newGroupName, setNewGroupName] = useState("");
    const [newKeyword, setNewKeyword] = useState("");
    const blockedKeywordApi = useBlockedKeywordApi();
    const [isOpenModalCreateNewGroup, setIsOpenModalCreateNewGroup] = useState(false);
    const [isOpenModalAddKeyword, setIsOpenModalAddKeyword] = useState(false);
    const [isOpenModalDelete, setIsOpenModalDelete] = useState(false);
    const [selectedGroup, setSelectedGroup] = useState(null);

    useEffect(() => {
        (async () => {
            setIsLoading(true);
            const response = await blockedKeywordApi.getAll()
            setOpenGroupIds(response.map(x => x.id));
            setBlockedKeywordGroups(response)
            setIsLoading(false);
        })();
    }, []);

    const toggleOpenGroup = (groupId) => {
        if (openGroupIds.includes(groupId)) {
            setOpenGroupIds(openGroupIds.filter(id => id !== groupId));
        } else {
            setOpenGroupIds([...openGroupIds, groupId]);
        }
    }

    const addKeyword = async () => {
        const group = blockedKeywordGroups.find(group => group.id === selectedGroup?.id);
        group.keywords = [...group.keywords, newKeyword];
        group.keywords = [...new Set(group.keywords)];
        setBlockedKeywordGroups([...blockedKeywordGroups]);
        await blockedKeywordApi.update(group);
        toast.success(`Blocked keyword ${newKeyword} added!`)
        setNewKeyword("");
        setNewGroupName("");
    }

    const deleteKeyword = async (groupId, keyword) => {
        const group = blockedKeywordGroups.find(group => group.id === groupId);
        group.keywords = group.keywords.filter(kw => kw !== keyword);
        setBlockedKeywordGroups([...blockedKeywordGroups]);
        await blockedKeywordApi.update(group);
        toast.success(`Blocked keyword ${keyword} deleted!`)
    }

    const deleteGroup = async () => {
        if (selectedGroup?.id) {
            setBlockedKeywordGroups(blockedKeywordGroups.filter(group => group.id !== selectedGroup?.id));
            await blockedKeywordApi.delete(selectedGroup?.id);
            toast.success(`Group ${selectedGroup?.name} deleted!`)
        }
    }

    const addGroup = async () => {
        if (blockedKeywordGroups?.some(x => x.name === newGroupName)) {
            toast.error(`Group ${newGroupName} already exists!`);
            setNewGroupName("");
            return;
        }
        const newGroup = {
            name: newGroupName,
            keywords: []
        }
        const response = await blockedKeywordApi.update(newGroup);
        setBlockedKeywordGroups([...blockedKeywordGroups, response]);
        toast.success(`Created group ${newGroupName}!`)
        setNewGroupName("");
        toggleOpenGroup(response.id)
    }

    return (
        <>
            <ConfirmModal
                isOpen={isOpenModalCreateNewGroup}
                closeAction={() => setIsOpenModalCreateNewGroup(false)}
                title="Create new group"
                content={<div className="w-full mt-4 space-y-2">
                    <label
                        htmlFor="fistName"
                        className="md:text-base text-sm dark:text-dark-txt "
                    >
                        Group name
                    </label>
                    <Input
                        id="firstName"
                        value={newGroupName}
                        onChange={(e) => setNewGroupName(e.target.value)}
                    />
                </div>}
                confirmButtonTitle="Add group"
                confirmButtonAction={addGroup}
            />
            <ConfirmModal
                isOpen={isOpenModalAddKeyword}
                closeAction={() => setIsOpenModalAddKeyword(false)}
                title="Add new keyword"
                content={<div className="w-full mt-4 space-y-2">
                    <label
                        htmlFor="fistName"
                        className="md:text-base text-sm dark:text-dark-txt"
                    >
                        Keyword
                    </label>
                    <Input
                        id="firstName"
                        value={newKeyword}
                        onChange={(e) => setNewKeyword(e.target.value)}
                    />
                </div>}
                confirmButtonTitle="Add keyword"
                confirmButtonAction={addKeyword}
            />
            <ConfirmModal
                isOpen={isOpenModalDelete}
                closeAction={() => setIsOpenModalDelete(false)}
                title="Are you sure?"
                content={`Do you want to delete blocked keyword group ${selectedGroup?.name ?? ""}.`}
                confirmButtonTitle="Delete"
                confirmButtonAction={deleteGroup}
            />
            <ToastContainer />
            <div className="bg-green-500 px-3 md:px-8 h-36" />
            <div className="px-3 md:px-8 -mt-32">
                <div className="container mx-auto max-w-full">
                    <Card>
                        <CardHeader className="grid" size="sm" color="lightBlue" contentPosition="space-between">
                            <div className="flex justify-between">
                                <h2 className="text-white text-2xl">Blocked Keyword Management</h2>
                            </div>
                        </CardHeader>
                        <CardBody className="items-center w-full bg-transparent border-collapse">
                            <div className="flex justify-end mt-2 mb-4">
                                <Button onClick={() => setIsOpenModalCreateNewGroup(true)}>Create group</Button>
                            </div>
                            {blockedKeywordGroups?.length === 0 && <div className="text-center">No blocked keyword groups found.</div>}
                            {isLoading
                                ? <div className="flex justify-center pt-10">
                                    <LoadingSpinner />
                                </div>
                                : blockedKeywordGroups?.map(group => {
                                    return <div className="mb-3 w-full">
                                        <div className="w-full p-3 rounded cursor-pointer shadow border border-gray-200 flex justify-between items-center">
                                            <span>{group.name}</span>
                                            <div className="flex items-center">
                                                <ClickableIcon
                                                    className="mr-3"
                                                    secondMode
                                                    iconClass="bx bx-x"
                                                    onClick={() => {
                                                        setIsOpenModalDelete(true);
                                                        setSelectedGroup(group);
                                                    }}
                                                />
                                                <ClickableIcon
                                                    className="mr-3"
                                                    secondMode
                                                    iconClass={openGroupIds?.includes(group?.id) ? "bx bx-chevron-right bx-rotate-90" : "bx bx-chevron-right"}
                                                    onClick={() => toggleOpenGroup(group.id)}
                                                />
                                            </div>
                                        </div>
                                        {openGroupIds?.includes(group?.id) ? <div className="border border-gray-200 flex flex-wrap p-3 pt-2 rounded-b-md items-center shadow">
                                            {group.keywords?.filter(x => x)?.map(keyword => <>
                                                <span className="mr-2 mt-2 px-2 py-1 h-8 bg-white border border-gray-100 shadow rounded inline-flex items-center">
                                                    {keyword}
                                                    <i onClick={() => deleteKeyword(group.id, keyword)}
                                                        class='bx bx-x ml-1 cursor-pointer'></i>
                                                </span>
                                            </>)}
                                            <span className="mr-2 mt-2 px-2 py-1 h-8 bg-white rounded inline-flex items-center" onClick={() => {
                                                setIsOpenModalAddKeyword(true);
                                                setSelectedGroup(group);
                                            }}>
                                                <i class='bx bx-plus ml-1 cursor-pointer'></i>
                                            </span>
                                        </div> : <></>}
                                    </div>
                                })}
                        </CardBody>
                        <CardFooter>
                        </CardFooter>
                    </Card>
                </div>
            </div>
        </>
    );
}