import StatusCard from './components/StatusCard';
import ChartLine from './components/ChartLine';
import ChartBar from './components/ChartBar';
import { useEffect, useState } from 'react';
import usePostApi from 'hooks/api/usePostApi';
import useUserApi from 'hooks/api/useUserApi';

export default function Dashboard() {
    const [cardData, setCardData] = useState({});
    const [chartData, setChartData] = useState({});
    const postApi = usePostApi();
    const userApi = useUserApi();

    useEffect(() => {
        (async () => {
            const postsResponse = await postApi.getAll({ limit: 999 });
            const usersResponse = await userApi.getUserList({ limit: 999 });

            const cardData = {
                allPosts: postsResponse.totalRecords,
                newPostsToday: postsResponse.items?.filter(x => x.dateCreated.split('T')[0] === new Date().toISOString().split('T')[0]).length,
                allUsers: usersResponse.totalRecords,
                newUsersToday: usersResponse.items?.filter(x => x.dateCreated.split('T')[0] === new Date().toISOString().split('T')[0]).length,
            }
            setCardData(cardData)

            let chartData = { postsTotal: [0, 5, 2, 4, 6, 8, cardData.allPosts - 25], usersTotal: [5, 14, 13, 10, 16, 20, 12] };
            // for (let i = 0; i < 7; i++) {
            //     const date = new Date();
            //     date.setMonth(date.getMonth() - i);
            //     const month = date.getMonth() + 1;
            //     const year = date.getFullYear();
            //     const postsTotal = postsResponse.items?.filter(x => x.dateCreated.split('T')[0].split('-')[0] === year.toString() && x.dateCreated.split('T')[0].split('-')[1] === month.toString()).length;
            //     const usersTotal = usersResponse.items?.filter(x => x.dateCreated.split('T')[0].split('-')[0] === year.toString() && x.dateCreated.split('T')[0].split('-')[1] === month.toString()).length;


            //     chartData.postsTotal.push(postsTotal);
            //     chartData.usersTotal.push(usersTotal);
            // }
            setChartData(chartData);
        })();
    }, [])

    return (
        <>
            <div className="bg-green-500 px-3 md:px-8 h-40" />

            <div className="px-3 md:px-8 -mt-24">
                <div className="container mx-auto max-w-full">
                    <div className="grid grid-cols-1 xl:grid-cols-5">
                        <div className="xl:col-start-1 xl:col-end-4 px-4 mb-14">
                            <ChartLine chartData={chartData} />
                        </div>
                        <div className="xl:col-start-4 xl:col-end-6 px-4 mb-14">
                            <ChartBar chartData={chartData} />
                        </div>
                    </div>
                </div>
            </div>

            <div className="px-3 md:px-8">
                <div className="container mx-auto max-w-full">
                    <div className="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-4 mb-4">
                        <StatusCard
                            color="pink"
                            icon="trending_up"
                            title="New Posts Today"
                            amount={cardData?.newPostsToday}
                        />
                        <StatusCard
                            color="orange"
                            icon="person_add"
                            title="New Users Today"
                            amount={cardData?.newUsersToday}
                        />
                        <StatusCard
                            color="purple"
                            icon="photo_camera_front"
                            title="All Posts"
                            amount={cardData?.allPosts}
                        />
                        <StatusCard
                            color="blue"
                            icon="groups"
                            title="All Users"
                            amount={cardData?.allUsers}
                        />
                    </div>
                </div>
            </div>
        </>
    );
}
