import Button from '@material-tailwind/react/Button';
import Icon from '@material-tailwind/react/Icon';
import ImageCircle from 'components/ImageCircle';
import { useSelector } from 'react-redux';
import { useLocation } from 'react-router-dom';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';

const locationName = {
    '/admin': 'Dashboard',
    '/admin/users': 'Manage Users',
    '/admin/blocked-keywords': 'Manage Blocked Keywords',
    '/admin/posts': 'Manage Posts',
    '/admin/post-reports': 'Manage Reports',
}

export default function AdminNavbar({ showSidebar, setShowSidebar }) {
    const location = useLocation().pathname;
    const user = useSelector((state) => state.users.currentUser);

    return (
        <nav className="bg-green-500 md:ml-64 py-6 px-3">
            <div className="container max-w-full mx-auto flex items-center justify-between md:pr-8 md:pl-10">
                <div className="md:hidden">
                    <Button
                        color="transparent"
                        buttonType="link"
                        size="lg"
                        iconOnly
                        rounded
                        ripple="light"
                        onClick={() => setShowSidebar('left-0')}
                    >
                        <Icon name="menu" size="2xl" color="white" />
                    </Button>
                    <div
                        className={`absolute top-2 md:hidden ${showSidebar === 'left-0' ? 'left-64' : '-left-64'
                            } z-50 transition-all duration-300`}
                    >
                        <Button
                            color="transparent"
                            buttonType="link"
                            size="lg"
                            iconOnly
                            rounded
                            ripple="light"
                            onClick={() => setShowSidebar('-left-64')}
                        >
                            <Icon name="close" size="2xl" color="white" />
                        </Button>
                    </div>
                </div>

                <div className="flex justify-between items-center w-full">
                    <h4 className="uppercase text-white text-sm tracking-wider mt-1">
                        {locationName[location]}
                    </h4>

                    <div className="flex">
                        <div className="-mr-4 ml-6 items-center flex">
                            <Link
                                className="font-semibold text-sm cursor-pointer flex-shrink-0"
                                to={`/profile/${user?.userName}`}
                            >
                                <ImageCircle size="sm" src={user?.avatarUrl} />
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    );
}
