import { useState } from 'react';
import { NavLink } from 'react-router-dom';
import AdminNavbar from './AdminNavbar';
import Icon from '@material-tailwind/react/Icon';
import H6 from '@material-tailwind/react/Heading6';
import { Link } from "react-router-dom";

const navbarItems = [
    {
        link: '/admin',
        icon: "dashboard",
        label: "Dashboard"
    },
    {
        link: '/admin/posts',
        icon: "text_snippet",
        label: "Posts"
    },
    {
        link: '/admin/users',
        icon: "group",
        label: "Users"
    },
    {
        link: '/admin/blocked-keywords',
        icon: "hearing_disabled",
        label: "Blocked Keywords"
    },
    {
        link: '/admin/post-reports',
        icon: "gpp_maybe",
        label: "Reports"
    }
]

export default function Sidebar() {
    const [showSidebar, setShowSidebar] = useState('-left-64');
    return (
        <>
            <AdminNavbar
                showSidebar={showSidebar}
                setShowSidebar={setShowSidebar}
            />
            <div
                className={`h-screen fixed top-0 md:left-0 ${showSidebar} overflow-y-auto flex-row flex-nowrap overflow-hidden shadow-xl bg-white w-64 z-10 py-4 px-6 transition-all duration-300`}
            >
                <div className="flex-col items-stretch min-h-full flex-nowrap px-0 relative">
                    <Link to={`/`} >
                        <div className="pl-4">
                            <H6 color="green">TeeApp</H6>
                        </div>
                    </Link>
                    <div className="flex flex-col">
                        <hr className="my-4 min-w-full" />

                        <ul className="flex-col min-w-full flex list-none">
                            {navbarItems.map((item, index) => <li key={index} className="rounded-lg mb-4">
                                <NavLink
                                    to={item.link}
                                    exact
                                    className="flex items-center gap-4 text-sm font-light px-4 py-3 rounded-lg transition-all duration-200"
                                    activeClassName="bg-gradient-to-tr from-light-blue-500 to-light-blue-700 text-white shadow-md text-white">
                                    <Icon name={item.icon} size="2xl" />
                                    {item.label}
                                </NavLink>
                            </li>)}
                        </ul>
                    </div>
                </div>
            </div>
        </>
    );
}
