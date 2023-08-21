import { Transition } from "@headlessui/react";
import { format } from "date-fns";
import { FormEvent, useEffect, useState } from "react";
import { isBrowser } from "react-device-detect";

import { fetchNui } from "../utils/fetchNui";
import { formatDuration } from "../utils/format";

import { Spotify } from "../api/spotify";

import { Album } from "../types";

import Window from "../components/apps/Natives/Window";
import Panel from "../components/apps/Panel";
import MenuIcon from "../components/apps/Natives/MenuIcon";
import OpenApp from "../components/apps/Natives/OpenApp";
import Notification from "../components/Notification";
import Icons from "../components/Icons";

import tunerCars from "../images/app/nfs.jpg";
import race from "../images/app/race.jpg";
import nitrousOn from "../images/items/nitrous.png";
import { debugData } from "../utils/debugData";
import CurrentPlaying from "../components/apps/Spotify/Songs/CurrentPlaying";
import Card from "../components/apps/Spotify/Playlist/Card";
import Item from "../components/apps/Spotify/Playlist/Item";
import NowPlaying from "../components/apps/Spotify/Songs/NowPlaying";
import Calendar from "../components/apps/Calendar";
import TaskOpen from "../components/apps/Natives/TaskOpen";
import BigCard from "../components/apps/Spotify/Playlist/BigCard";
import Activity from "../components/apps/Spotify/Activity";
import ItemSelect from "../components/apps/Spotify/Playlist/ItemSelect";
import WindowExtension from "../components/apps/Natives/WindowExtension";
import UserCard from "../components/apps/Natives/UserCard";
import RecentlyCard from "../components/apps/Natives/RecentlyCard";

if (isBrowser) {
  debugData([
    {
      action: "setVisible",
      data: true,
    },
  ]);
}
export default function Home() {
  const [album, setAlbum] = useState([{}] as any);
  const [error, setError] = useState(false);
  const [selectArtist, setSelectArtist] = useState("");
  const [enableNos, setEnableNos] = useState(false);
  const [message, setMessage] = useState("");
  const [search, setSearch] = useState(false);
  const [play, setPlay] = useState(false);
  const [openCalendar, setOpenCalendar] = useState(false);
  const [openPanel, setOpenPanel] = useState(false);
  const [nitrous, setNitrous] = useState(false);
  const [openViewCalendar, setOpenViewCalendar] = useState(false);
  const [openTunerMode, setTunerMode] = useState(false);
  const [startMenu, setStartMenu] = useState(false);

  const [openTwitch, setOpenTwitch] = useState(false);
  const [openRace, setOpenRace] = useState(false);
  const [openSpotify, setOpenSpotify] = useState(false);

  const [startWindows, setStartWindows] = useState(true);
  const [openNotification, setOpenNotification] = useState(true);
  const [isLiked, setIsLiked] = useState(false);
  const [typeAlbum, setTypeAlbum] = useState("");
  const time = format(new Date(), "HH:mm");
  const date = format(new Date(), "dd/MM/yyyy");

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (selectArtist === "") {
      setSearch(false);
      setError(true);
      setMessage("Veuillez remplir le champ");
      setTimeout(() => setError(false), 1250);
      return;
    }
    if (!search) {
      const app = new Spotify();
      app.getTracks(selectArtist).then((res) => {
        res.json().then((data: Album) => {
          setAlbum(data.tracks as any);
          setSearch(true);
        });
      });
    }
  };
  const playMusic = (src: string) => {
    const audio = new Audio(src);
    if (play) {
      audio.pause();
      audio.volume = 0;
      setPlay(false);
    } else {
      setPlay(true);
      audio.volume = 0.1;
      audio.play();
    }
  };

  useEffect(() => {
    setInterval(() => {
      setStartWindows(false);
    }, 3000);
  }, []);

  return (
    <>
      <div className="flex justify-end">
        <div className="flex flex-col space-y-2 bottom-14 absolute right-2">
          <Notification
            message="hello there"
            type=""
            titleHeader="Tuner Mode"
            open={openNotification}
            onClick={() => setOpenNotification(false)}
            isSvg={false}
            icon={tunerCars}
            title="test"
          />
        </div>
      </div>
      <div className="flex flex-col justify-between">
        <main className="flex justify-center min-h-screen items-center w-full h-full">
          <Transition
            show={startWindows}
            enter="transition-opacity duration-500 ease-in"
            enterFrom="opacity-0"
            enterTo="opacity-100"
            leave="transition-opacity duration-500 ease-out"
            leaveFrom="opacity-100"
            leaveTo="opacity-0 duration-500"
            className="bg-black w-screen h-screen z-[9999]"
          >
            <div className="flex h-screen space-y-10 flex-col justify-center items-center">
              <div className="grid grid-cols-2 gap-2 w-32 h-16">
                <div className="space-y-2">
                  <div className="bg-sky-600 w-full h-full rounded-tl-lg"></div>
                  <div className="bg-sky-600 w-full h-full rounded-bl-lg"></div>
                </div>
                <div className="space-y-2">
                  <div className="bg-sky-600 w-full h-full rounded-tr-lg"></div>
                  <div className="bg-sky-600 w-full h-full rounded-br-lg"></div>
                </div>
              </div>
              <div className="absolute bottom-40 lg:bottom-60 md:bottom-60">
                <div className="border-t-white animate-spin ease-linear rounded-full border-4 border-t-4 border-transparent h-12 w-12"></div>
              </div>
            </div>
          </Transition>

          <div className="space-x-2 inline-flex z-20">
            <Window
              open={openTunerMode}
              image={tunerCars}
              isTitle={true}
              opened={<WindowExtension onClick={() => setTunerMode(false)} />}
              title="Tuner Mode"
              children={
                <>
                  <div className="flex flex-col space-y-2 items-center justify-center mt-5">
                    <div className="grid grid-cols-2 space-x-8">
                      <div className="flex flex-col justify-center items-center space-y-2">
                        <div className="flex justify-start items-start">
                          <h1 className="text-white font-medium text-lg">
                            Enable NOS
                          </h1>
                        </div>
                        {!nitrous && (
                          <div className="inline-flex space-x-2">
                            <button
                              onClick={() => setNitrous(true)}
                              className="py-2 px-14 bg-neutral-800 hover:bg-sky-400 focus:bg-sky-400 focus:text-black/90 transition duration-300 rounded-md hover:text-black/90 text-white font-medium"
                            >
                              Yes
                            </button>
                            <button className="py-2 px-14 bg-neutral-800 hover:bg-sky-400 focus:bg-sky-400 focus:text-black/90 transition duration-300 rounded-md hover:text-black/90 text-white font-medium">
                              No
                            </button>
                          </div>
                        )}
                        <Transition
                          show={nitrous}
                          enter="transition-opacity duration-500 ease-in"
                          enterFrom="opacity-0"
                          enterTo="opacity-100"
                          leave="transition-opacity duration-500 ease-out"
                          leaveFrom="opacity-100"
                          leaveTo="opacity-0 duration-500"
                        >
                          <div className="inline-flex space-x-2">
                            <div className="flex flex-col space-y-1 justify-center items-center">
                              <button className="hover:bg-white/5 py-2 px-3 transition-colors rounded-lg">
                                <img
                                  src={nitrousOn}
                                  className="w-10 h-10"
                                  alt=""
                                />
                                <span className="text-white text-sm">
                                  Stage 1
                                </span>
                              </button>
                            </div>
                            <div className="flex flex-col space-y-1 justify-center items-center">
                              <button className="hover:bg-white/5 py-2 px-3 transition-colors rounded-lg">
                                <img
                                  src={nitrousOn}
                                  className="w-10 h-10"
                                  alt=""
                                />
                                <span className="text-white text-sm">
                                  Stage 2
                                </span>
                              </button>
                            </div>
                            <div className="flex flex-col space-y-1 justify-center items-center">
                              <button className="hover:bg-white/5 py-2 px-3 transition-colors rounded-lg">
                                <img
                                  src={nitrousOn}
                                  className="w-10 h-10"
                                  alt=""
                                />
                                <span className="text-white text-sm">
                                  Stage 3
                                </span>
                              </button>
                            </div>
                          </div>
                        </Transition>

                        {!enableNos && (
                          <>
                            <div className="flex justify-center items-center">
                              <h1 className="text-white font-medium text-lg">
                                Enable Neon
                              </h1>
                            </div>
                            <div className="inline-flex space-x-2">
                              <button
                                onClick={() => {
                                  setEnableNos(true);
                                }}
                                className="py-2 px-14 bg-neutral-800 hover:bg-sky-400 focus:bg-sky-400 focus:text-black/90 transition duration-300 rounded-md hover:text-black/90 text-white font-medium"
                              >
                                Yes
                              </button>
                              <button className="py-2 px-14 bg-neutral-800 hover:bg-sky-400 focus:bg-sky-400 focus:text-black/90 transition duration-300 rounded-md hover:text-black/90 text-white font-medium">
                                No
                              </button>
                            </div>
                          </>
                        )}

                        <Transition
                          show={enableNos}
                          enter="transition-opacity duration-500 ease-in"
                          enterFrom="opacity-0"
                          enterTo="opacity-100"
                          leave="transition-opacity duration-500 ease-out"
                          leaveFrom="opacity-100"
                          leaveTo="opacity-0 duration-500"
                        >
                          <div className="flex justify-center items-center">
                            <h1 className="text-white font-medium text-lg">
                              Neon Color
                            </h1>
                          </div>
                          <div className="inline-flex justify-center items-center space-x-2">
                            <div className="bg-neutral-600/40 w-64 h-2.5 rounded-lg">
                              <div
                                className="bg-sky-400 max-w-[16rem] rounded-lg h-2.5 transition duration-300 ease-in-out"
                                style={{ width: "20%" }}
                              />
                            </div>
                          </div>
                        </Transition>
                      </div>
                      <div className="flex flex-col justify-center items-center space-y-2">
                        <div className="flex justify-start items-start">
                          <h1 className="text-white font-medium text-lg">
                            Settings Transmission
                          </h1>
                        </div>
                        <div className="inline-flex items-center space-x-2">
                          <div className="bg-neutral-600/40 w-64 h-2.5 rounded-lg">
                            <div
                              className="bg-sky-400 max-w-[16rem] rounded-lg h-2.5 transition duration-300 ease-in-out"
                              style={{ width: "20%" }}
                            />
                          </div>
                          <div
                            className="absolute w-5 h-5 bg-white rounded-full shadow-md cursor-move"
                            style={{ transform: `translateX(120%)` }}
                          />
                        </div>
                        <h1 className="text-white font-medium text-lg">
                          Brake Force
                        </h1>

                        <div className="inline-flex items-center space-x-2">
                          <div className="bg-neutral-600/40 w-64 h-2.5 rounded-lg">
                            <div
                              className="bg-sky-400 max-w-[16rem] rounded-lg h-2.5 transition duration-300 ease-in-out"
                              style={{ width: "20%" }}
                            />
                          </div>
                          <div
                            className="absolute w-5 h-5 bg-white rounded-full shadow-md cursor-move"
                            style={{ transform: `translateX(120%)` }}
                          />
                        </div>
                        <h1 className="text-white font-medium text-lg">
                          Turbo PSI
                        </h1>

                        <div className="inline-flex items-center space-x-2">
                          <div className="bg-neutral-600/40 w-64 h-2.5 rounded-lg">
                            <div
                              className="bg-sky-400 max-w-[16rem] rounded-lg h-2.5 transition duration-300 ease-in-out"
                              style={{ width: "20%" }}
                            />
                          </div>
                          <div
                            className="absolute w-5 h-5 bg-white rounded-full shadow-md cursor-move"
                            style={{ transform: `translateX(120%)` }}
                          />
                        </div>
                        <h1 className="text-white font-medium text-lg">
                          Ignition Timing
                        </h1>

                        <div className="inline-flex items-center space-x-2">
                          <div className="bg-neutral-600/40 w-64 h-2.5 rounded-lg">
                            <div
                              className="bg-sky-400 max-w-[16rem] rounded-lg h-2.5 transition duration-300 ease-in-out"
                              style={{ width: "20%" }}
                            />
                          </div>
                          <div
                            className="absolute w-5 h-5 bg-white rounded-full shadow-md cursor-move"
                            style={{ transform: `translateX(120%)` }}
                          />
                        </div>
                        <h1 className="text-white font-medium text-lg">
                          Driver Bias
                        </h1>

                        <div className="inline-flex items-center space-x-2">
                          <div className="bg-neutral-600/40 w-64 h-2.5 rounded-lg">
                            <div
                              className="bg-sky-400 max-w-[16rem] rounded-lg h-2.5 transition duration-300 ease-in-out"
                              style={{ width: "20%" }}
                            />
                          </div>
                          <div
                            className="absolute w-5 h-5 bg-white rounded-full shadow-md cursor-move"
                            style={{ transform: `translateX(120%)` }}
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </>
              }
              size="w-[700px] h-96"
            />
            <Window
              open={openTwitch}
              image="twitchlogo"
              isSvg={true}
              isTitle={false}
              opened={
                <WindowExtension
                  onClick={() => setOpenTwitch(false)}
                  onMouseEnter={() => {
                    document
                      .getElementById("window-extension")
                      ?.classList.remove("hidden");
                  }}
                  onMouseLeave={() => {
                    document
                      .getElementById("window-extension")
                      ?.classList.add("hidden");
                  }}
                />
              }
              title="Twitch"
              children={
                <div className="flex justify-between items-center px-3 bg-neutral-700 w-full rounded-t-md">
                  <div className="inline-flex space-x-8 py-5">
                    <Icons icon="twitchlogo" className="w-6 h-6" />
                    <a
                      href="http://"
                      className="text-lg text-white font-medium hover:text-[#bf94ff]"
                    >
                      Suivis
                    </a>
                    <a
                      href=""
                      className="text-lg text-white font-medium hover:text-[#bf94ff]"
                    >
                      Parcourir
                    </a>
                  </div>

                  <div className="inline-flex items-center">
                    <input
                      type="text"
                      placeholder="Rechercher"
                      className="w-80 px-2 rounded-l-lg py-2 bg-neutral-600 focus:outline-none placeholder-neutral-200 text-neutral-300"
                    />
                    <button className="bg-neutral-800 py-2.5 px-4 rounded-r-lg focus:outline-none">
                      <svg
                        className="w-5 h-5 text-white"
                        version="1.1"
                        viewBox="0 0 20 20"
                        x="0px"
                        y="0px"
                      >
                        <g>
                          <path
                            fill-rule="evenodd"
                            fill="currentColor"
                            d="M13.192 14.606a7 7 0 111.414-1.414l3.101 3.1-1.414 1.415-3.1-3.1zM14 9A5 5 0 114 9a5 5 0 0110 0z"
                            clip-rule="evenodd"
                          ></path>
                        </g>
                      </svg>
                    </button>
                  </div>
                  <div className="inline-flex space-x-2 items-center">
                    <svg
                      version="1.1"
                      viewBox="0 0 20 20"
                      x="0px"
                      y="0px"
                      className="w-5 h-5 text-white"
                    >
                      <g>
                        <path
                          fill-rule="evenodd"
                          clip-rule="evenodd"
                          fill="currentColor"
                          d="M13.798 10.456L10 6.657l-3.798 3.799L4 8.805V13h12V8.805l-2.202 1.65zM18 5v8a2 2 0 0 1-2 2H4a2.002 2.002 0 0 1-2-2V5l4 3 4-4 4 4 4-3z"
                        ></path>
                      </g>
                    </svg>
                    <svg
                      version="1.1"
                      viewBox="0 0 20 20"
                      x="0px"
                      className="w-5 h-5 text-white"
                      y="0px"
                    >
                      <g>
                        <path
                          fill-rule="evenodd"
                          fill="currentColor"
                          d="M4 3h12l2 4v10H2V7l2-4zm.236 4H8v1a1 1 0 001 1h2a1 1 0 001-1V7h3.764l-1-2H5.236l-1 2zM16 9h-2.17A3.001 3.001 0 0111 11H9a3.001 3.001 0 01-2.83-2H4v6h12V9z"
                          clip-rule="evenodd"
                        ></path>
                      </g>
                    </svg>
                    <svg
                      className="w-5 h-5 text-white"
                      version="1.1"
                      viewBox="0 0 20 20"
                      x="0px"
                      y="0px"
                    >
                      <g>
                        <path
                          fill-rule="evenodd"
                          d="M7.828 13L10 15.172 12.172 13H15V5H5v8h2.828zM10 18l-3-3H5a2 2 0 01-2-2V5a2 2 0 012-2h10a2 2 0 012 2v8a2 2 0 01-2 2h-2l-3 3z"
                          clip-rule="evenodd"
                          fill="currentColor"
                        ></path>
                      </g>
                    </svg>
                    <button className="py-1.5 px-3 rounded-lg bg-neutral-600 text-white inline-flex justify-center items-center">
                      <svg
                        className="w-5 h-5 text-white mr-2"
                        version="1.1"
                        viewBox="0 0 20 20"
                        x="0px"
                        y="0px"
                      >
                        <path
                          fill-rule="evenodd"
                          clip-rule="evenodd"
                          fill="currentColor"
                          d="M3 12l7-10 7 10-7 6-7-6zm2.678-.338L10 5.487l4.322 6.173-.85.728L10 11l-3.473 1.39-.849-.729z"
                        ></path>
                      </svg>
                      Acheter des Bits
                    </button>
                    <div className="flex justify-end items-end">
                      <img
                        src="https://static-cdn.jtvnw.net/jtv_user_pictures/018dd5c4-1b20-43ae-8409-60d04728054e-profile_image-70x70.png"
                        alt=""
                        className="w-7 h-7 rounded-full"
                      />
                      <div className="w-1.5 h-1.5 rounded-full bg-green-500 absolute mb-0.5" />
                    </div>
                  </div>
                </div>
              }
              size="w-[1400px] h-[800px]"
            />
            <Window
              open={openRace}
              image={race}
              isTitle={true}
              opened={<WindowExtension onClick={() => setOpenRace(false)} />}
              title="Races"
              children={
                <div className="px-3 py-3 text-white">Not finished yet.</div>
              }
              size="w-[700px] h-96"
            />

            <Window
              open={openSpotify}
              image="spotify"
              isSvg={true}
              isTitle={false}
              opened={<WindowExtension onClick={() => setOpenSpotify(false)} />}
              title="Spotify"
              children={
                <>
                  <div className="w-56 h-[720px] bg-black py-2 rounded-tl-lg">
                    <div className="px-5">
                      <Icons icon="dot" className="w-8 h-8 text-white" />
                    </div>
                    <div className="mt-5 pr-1 px-5">
                      <div className="flex flex-col items-start justify-center space-y-3">
                        <ItemSelect
                          name="Home"
                          icon="home"
                          onClick={() => null}
                        />
                        <ItemSelect
                          name="Search"
                          icon="searchSong"
                          onClick={() => null}
                        />
                        <ItemSelect
                          name="Your Library"
                          icon="library"
                          onClick={() => null}
                        />
                      </div>
                    </div>
                    <div className="mt-7 px-5 space-y-2">
                      <ItemSelect
                        name="Create Playlist"
                        icon="create"
                        onClick={() => null}
                      />
                      <ItemSelect
                        name="Liked Songs"
                        icon="loveSong"
                        onClick={() => null}
                      />
                    </div>
                    <div className="w-44 m-auto bg-neutral-800 h-[0.1px] mt-3"></div>
                    <div className="h-[400px] overflow-auto">
                      <div className="flex flex-col space-y-3 items-start px-5 py-5">
                        {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].map(
                          (item) => (
                            <Item playlist={`Playlist (${item})`} />
                          )
                        )}
                      </div>
                    </div>
                  </div>
                  <div className="flex justify-center items-center">
                    <div
                      className={`absolute top-0 bottom-0 right-0 w-[1100px] mr-[4.5rem] transition-all duration-500 ${
                        typeAlbum ? typeAlbum : ""
                      }`}
                    >
                      <div className="flex justify-between items-center w-[900px] py-2">
                        <div className="text-white space-x-4 py-2 px-4">
                          <button className="bg-black/80 px-1.5 py-1.5 rounded-full">
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              className="h-5 w-5 rotate-180"
                              fill="none"
                              viewBox="0 0 24 24"
                              stroke="currentColor"
                              strokeWidth={2}
                            >
                              <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                d="M9 5l7 7-7 7"
                              />
                            </svg>
                          </button>
                          <button className="bg-black/80 px-1.5 py-1.5 rounded-full">
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              className="h-5 w-5"
                              fill="none"
                              viewBox="0 0 24 24"
                              stroke="currentColor"
                              strokeWidth={2}
                            >
                              <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                d="M9 5l7 7-7 7"
                              />
                            </svg>
                          </button>
                        </div>
                        <div className="text-white">
                          <div className="inline-flex space-x-2 bg-black/70 px-1 pr-4 py-1 rounded-full items-center">
                            <div className="px-1 py-1 rounded-full bg-neutral-600">
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                className="h-4 w-4"
                                fill="none"
                                viewBox="0 0 24 24"
                                stroke="currentColor"
                                strokeWidth={2}
                              >
                                <path
                                  strokeLinecap="round"
                                  strokeLinejoin="round"
                                  d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                                />
                              </svg>
                            </div>
                            <span className="text-sm font-medium">Amine</span>
                          </div>
                        </div>
                      </div>
                      <div className="space-y-10 py-3 px-4">
                        <div className="space-y-6">
                          <h1 className="text-white font-bold text-3xl">
                            Good evening
                          </h1>
                          <div className="flex flex-wrap gap-4">
                            <Card
                              playlist={``}
                              cover="https://fr.shopping.rakuten.com/photo/2-Pac-All-Eyez-On-Me-CD-Album-1159598566_ML.jpg"
                              onClick={() =>
                                setTypeAlbum(
                                  "bg-gradient-to-b from-green-700 via-neutral-900"
                                )
                              }
                              type="all"
                            />
                            <Card
                              playlist={``}
                              cover="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/dance-music-mixtape-album-cover-a-design-template-63fcc393e10827fe18b6930369335a19_screen.jpg?ts=1635197724"
                              onClick={() =>
                                setTypeAlbum(
                                  "bg-gradient-to-b from-purple-700 via-neutral-900"
                                )
                              }
                              type="dance"
                            />
                            <Card
                              playlist={``}
                              cover="https://trentetroisdegres.fr/wp-content/uploads/2019/11/Image-26-11-2019-à-14.38.jpeg"
                              onClick={() =>
                                setTypeAlbum(
                                  "bg-gradient-to-b from-rose-700 via-neutral-900"
                                )
                              }
                              type="turnUp-US"
                            />
                            <Card
                              playlist={``}
                              cover="https://www.booska-p.com/wp-content/uploads/2018/03/drake-nothing-was-the-same-deluxe.jpg"
                              onClick={() =>
                                setTypeAlbum(
                                  "bg-gradient-to-b from-yellow-700 via-neutral-900"
                                )
                              }
                              type="Drake"
                            />
                            <Card
                              playlist={``}
                              cover="https://intrld.com/wp-content/uploads/2017/02/Future-Future-album-cover-art.jpg"
                              onClick={() =>
                                setTypeAlbum(
                                  "bg-gradient-to-b from-lime-700 via-neutral-900"
                                )
                              }
                              type="Future"
                            />
                            <Card
                              playlist={``}
                              cover="https://m.media-amazon.com/images/I/61KqQy-n4eL._AC_SX425_.jpg"
                              onClick={() =>
                                setTypeAlbum(
                                  "bg-gradient-to-b from-teal-700 via-neutral-900"
                                )
                              }
                              type="LilUziVert"
                            />
                          </div>
                        </div>
                        <div className="space-y-6">
                          <h1 className="text-white font-bold text-3xl">
                            Episodes for you
                          </h1>
                          <div className="flex flex-wrap gap-4">
                            {[1, 2, 3, 4, 5].map((item) => (
                              <>
                                <BigCard
                                  playlist={`Perfect Playlist (${item})`}
                                  cover="https://picsum.photos/200"
                                  onClick={() => null}
                                  date={`${item} days ago`}
                                />
                              </>
                            ))}
                          </div>
                        </div>
                      </div>
                      <div className="fixed right-0 top-0 w-60 h-[720px] bg-black py-10 rounded-tr-lg text-white px-4">
                        <div className="flex justify-between items-center">
                          <h1 className="text-neutral-300 font-semibold">
                            Friend Activity
                          </h1>
                          <div className="rounded-full transition hover:bg-white/10 px-2 py-2">
                            <Icons
                              icon="user-add"
                              className="w-5 h-5 text-white"
                            />
                          </div>
                        </div>
                        <div className="mt-8">
                          <p className="text-xs text-neutral-300 leading-5">
                            Let friends and followers on Spotify see what you're
                            listening to.
                          </p>
                          <div className="mt-4">
                            <div className="space-y-2">
                              <Activity />
                              <Activity />
                              <Activity />
                            </div>
                          </div>
                          <div className="mt-4">
                            <p className="text-xs text-neutral-300 leading-5">{`Go to settings -> Social and enable 'Share my listening activity on Spotify.'You can turn this off at any time.`}</p>

                            <div className="flex justify-center items-center mt-3">
                              <button className="px-14 py-3 bg-white text-black uppercase rounded-full font-semibold hover:scale-105 transition">
                                Settings
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="bg-neutral-800 flex-none h-22 px-5 flex items-center justify-between bottom-0 fixed w-full py-4">
                    <NowPlaying
                      name="Drake"
                      artist="God's Plan"
                      cover="https://www.booska-p.com/wp-content/uploads/2018/03/drake-nothing-was-the-same-deluxe.jpg"
                      isLiked={isLiked}
                      onClick={() =>
                        isLiked ? setIsLiked(false) : setIsLiked(true)
                      }
                    />

                    <div className="flex flex-col justify-center">
                      <div className="flex justify-center">
                        <button>
                          <Icons
                            icon="shuffle"
                            className="h-5 w-5 text-[#999999] hover:text-white transition rotate-180"
                          />
                        </button>
                        <button className="ml-8">
                          <Icons
                            icon="nexts"
                            className="h-5 w-5 text-[#999999] hover:text-white transition rotate-180"
                          />
                        </button>
                        <button className="ml-8">
                          <Icons
                            icon="playedSong"
                            className="h-10 w-10 rotate-180 transform hover:scale-105 transition"
                          />
                        </button>
                        <button className="ml-8">
                          <Icons
                            icon="nexts"
                            className="h-5 w-5 text-[#999999] hover:text-white transition"
                          />
                        </button>
                        <button className="ml-8">
                          <Icons
                            icon="repeat"
                            className="h-5 w-5 text-[#999999] hover:text-white transition"
                          />
                        </button>
                      </div>
                      <div className="max-w-full mt-3 flex items-center justify-center">
                        <div className="text-xs text-gray-50">1:20</div>
                        <div className="bg-[#535353] rounded-lg w-full xl:w-200 h-1 ml-3">
                          <div
                            className="bg-[#C4C4C4] hover:bg-[#1DB954] rounded-lg w-full h-1 transition-all ease-in-out duration-300"
                            style={{ width: "20%" }}
                          />
                        </div>
                        <div className="ml-3 text-xs text-gray-50">3:21</div>
                      </div>
                    </div>
                    <div className="volume-controls flex items-center">
                      <button>
                        <Icons
                          icon="microphone"
                          className="h-5 w-5 text-[#999999] hover:text-white transition"
                        />
                      </button>
                      <button className="ml-4">
                        <Icons
                          icon="lists"
                          className="h-5 w-5 text-[#999999] hover:text-white transition"
                        />
                      </button>
                      <button className="ml-4">
                        <Icons
                          icon="devices"
                          className="h-5 w-5 text-[#999999] hover:text-white transition"
                        />
                      </button>
                      <button className="ml-4">
                        <Icons
                          icon="sounds"
                          className="h-5 w-5 text-[#999999] hover:text-white transition"
                        />
                      </button>
                      <div className="bg-[#535353] rounded-lg w-20 h-1 ml-3">
                        <div
                          className="bg-[#C4C4C4] hover:bg-[#1DB954] rounded-lg w-full h-1 transition-all ease-in-out duration-300"
                          style={{ width: "20%" }}
                        />
                      </div>
                      <button className="ml-4">
                        <svg
                          width="24"
                          height="24"
                          viewBox="0 0 24 24"
                          fill="none"
                          stroke="currentColor"
                          stroke-width="2"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          className="fill-current text-[#999999] hover:text-white transition h-4 w-4"
                        >
                          <path d="M15 3h6v6M9 21H3v-6M21 3l-7 7M3 21l7-7"></path>
                        </svg>
                      </button>
                    </div>
                  </div>
                </>
              }
              size="w-[1400px] h-[800px]"
            />
          </div>
          <Transition
            show={startMenu}
            enter="transition-opacity duration-500 ease-in slide-in-bottom"
            enterFrom="opacity-0"
            enterTo="opacity-500 slide-in-bottom"
            leave="transition-all"
            leaveFrom="opacity-500 slide-out-bottom"
            leaveTo="opacity-0 duration-500 slide-out-bottom"
            className="fixed bottom-0 my-16 w-[642px] h-[726px] bg-neutral-900/70 backdrop-blur-3xl rounded-lg shadow-lg"
          >
            <div className="px-10 py-10">
              <div className="space-y-7">
                <div>
                  <div className="flex justify-start items-start">
                    <div className="ml-4">
                      <Icons
                        icon="searching"
                        className="absolute mt-3 w-3.5 h-3.5"
                      />
                    </div>
                  </div>
                  <input
                    type="text"
                    placeholder="Type here to search"
                    className="w-full h-10 px-10 py-4 text-sm rounded-[0.250rem] bg-neutral-900 text-gray-100 placeholder-neutral-400 border-b-[2.5px] border-r-neutral-700/40 border-r-[1px] border-l-[1px] border-l-neutral-700/40 border-t-[1px] border-t-neutral-700/40 border border-b-sky-400 focus:outline-none focus:shadow-outline"
                  />
                </div>
                <div className="w-[576px] h-[302px]">
                  <div className="flex justify-between px-7">
                    <div>
                      <h1 className="text-white/90 font-medium text-sm">
                        Pinned
                      </h1>
                    </div>
                    <div className="hidden">
                      <button className="bg-white px-3 py-1 rounded-lg border-2 border-gray-300">
                        <div className="inline-flex justify-start items-center">
                          <span className="text-white/90 font-medium">
                            All apps
                          </span>
                          <div className="w-[10px] h-[22px] flex justify-center items-center ml-2">
                            <svg
                              className="w-3 h-3"
                              viewBox="0 0 5 8"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                            >
                              <path
                                d="M0.125977 7.4375C0.125977 7.35286 0.156901 7.27962 0.21875 7.21777L3.43164 4L0.21875 0.782227C0.156901 0.720378 0.125977 0.647135 0.125977 0.5625C0.125977 0.477865 0.156901 0.404622 0.21875 0.342773C0.280599 0.280924 0.353841 0.25 0.438477 0.25C0.523112 0.25 0.596354 0.280924 0.658203 0.342773L4.0957 3.78027C4.15755 3.84212 4.18848 3.91536 4.18848 4C4.18848 4.08464 4.15755 4.15788 4.0957 4.21973L0.658203 7.65723C0.596354 7.71908 0.523112 7.75 0.438477 7.75C0.353841 7.75 0.280599 7.71908 0.21875 7.65723C0.156901 7.59538 0.125977 7.52214 0.125977 7.4375Z"
                                fill="black"
                                fillOpacity="0.6063"
                              />
                            </svg>
                          </div>
                        </div>
                      </button>
                    </div>
                  </div>
                  <div className="flex justify-center items-center mt-7">
                    <div className="flex items-center justify-center">
                      <MenuIcon icon="spotify" title="Spotify" />
                      <MenuIcon icon="twitter" title="Twitter" />
                      <MenuIcon icon="settings" title="Settings" />
                      <MenuIcon icon="mail" title="Mail" />
                      <MenuIcon icon="xbox" title="Xbox" />
                      <MenuIcon icon="photos" title="Photos" />
                    </div>
                  </div>

                  <div className="w-[536px] h-[204px] mb-20 bottom-0 fixed">
                    <div className="flex justify-between px-7">
                      <h1 className="text-white/90 font-medium text-sm">
                        Recommanded
                      </h1>
                    </div>
                    <div className="flex justify-between items-center px-7 py-7 space-x-8 w-full">
                      <RecentlyCard
                        onClick={() =>
                          openSpotify
                            ? setOpenSpotify(false)
                            : setOpenSpotify(true)
                        }
                        name="Spotify"
                        icon="spotify"
                        isSvg={true}
                      />

                      <RecentlyCard
                        onClick={() =>
                          openRace ? setOpenRace(false) : setOpenRace(true)
                        }
                        name="Races"
                        icon={race}
                        isSvg={false}
                      />
                    </div>
                    <UserCard
                      onClick={() => fetchNui("hideFrame")}
                      image="https://avatars.githubusercontent.com/u/38817327?v=4"
                      name="Amine"
                    />
                  </div>
                </div>
              </div>
            </div>
          </Transition>
        </main>
        <div className="absolute px-2 py-2">
          <OpenApp
            onClick={() => {
              openTunerMode ? setTunerMode(false) : setTunerMode(true);
            }}
            isSvg={false}
            icon={tunerCars}
            title="Tuner Cars"
          />
          <OpenApp
            onClick={() => {
              openRace ? setOpenRace(false) : setOpenRace(true);
            }}
            isSvg={false}
            icon={race}
            title="Races"
          />
          <OpenApp
            onClick={() => {
              openTwitch ? setOpenTwitch(false) : setOpenTwitch(true);
            }}
            isSvg={true}
            icon="twitchlogo"
            title="Twitch"
          />
          <OpenApp
            onClick={() => {
              openSpotify ? setOpenSpotify(false) : setOpenSpotify(true);
            }}
            isSvg={true}
            icon="spotify"
            title="Spotify"
          />
        </div>
        <Calendar
          open={openCalendar}
          openCalendar={openViewCalendar}
          onClick={() =>
            openViewCalendar
              ? setOpenViewCalendar(false)
              : setOpenViewCalendar(true)
          }
        />
        <Panel open={openPanel} />
        <CurrentPlaying open={openPanel} />
        <div className="bg-neutral-900/70 backdrop-blur-3xl py-1 sticky bottom-0 z-50">
          <div className="flex justify-center items-center">
            <div className="flex justify-center items-center space-x-2">
              {startMenu ? (
                <>
                  <Icons
                    icon="start"
                    className="w-6 h-6 hover:scale-[0.80] hover:transition hover:transform ease-in-out duration-300"
                    onClick={() => setStartMenu(false)}
                    action={startMenu ? "bg-white/5" : ""}
                  />
                </>
              ) : (
                <Icons
                  icon="start"
                  className="w-6 h-6 hover:scale-[0.80] hover:transition hover:transform ease-in-out duration-300"
                  onClick={() => setStartMenu(true)}
                />
              )}
              <Icons
                icon="teams"
                className="w-6 h-6 hover:scale-[0.80] hover:transition hover:transform ease-in-out duration-300"
              />
              <Icons
                icon="explorer"
                className="w-6 h-6 hover:scale-[0.80] hover:transition hover:transform ease-in-out duration-300"
              />
              <Icons
                icon="edge"
                className="w-6 h-6 hover:scale-[0.80] hover:transition hover:transform ease-in-out duration-300"
              />
              <TaskOpen
                open={openSpotify}
                onClick={() => setOpenSpotify((openSpotify) => !openSpotify)}
                icon="spotify"
                isSvg={false}
              />
              <TaskOpen
                open={openTwitch}
                onClick={() => setOpenTwitch((openTwitch) => !openTwitch)}
                icon="twitchlogo"
                isSvg={false}
              />
              <TaskOpen
                open={openRace}
                onClick={() => setOpenRace((openRace) => !openRace)}
                icon={race}
                isSvg={true}
              />
              <TaskOpen
                open={openTunerMode}
                onClick={() => setTunerMode((openTunerMode) => !openTunerMode)}
                icon={tunerCars}
                isSvg={true}
              />
            </div>
            <div className="flex items-center justify-end px-2 space-x-1 right-0 fixed">
              {openPanel ? (
                <div
                  onClick={() => setOpenPanel(false)}
                  className={`${
                    openPanel ? "bg-white/5" : ""
                  } flex justify-end items-center w-20 h-10 px-2 hover:bg-white/5 transition-colors ease-in-out duration-150 rounded-md`}
                >
                  <svg
                    className="w-20 h-10"
                    viewBox="0 0 68 20"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M10 5C9.4375 5 8.88021 5.05729 8.32812 5.17188C7.78125 5.28125 7.25 5.44531 6.73438 5.66406C6.21875 5.8776 5.72656 6.14062 5.25781 6.45312C4.78906 6.76562 4.35677 7.1224 3.96094 7.52344C3.76302 7.72135 3.58594 7.92969 3.42969 8.14844C3.27344 8.36198 3.10677 8.57292 2.92969 8.78125C2.86719 8.85417 2.80729 8.90885 2.75 8.94531C2.69271 8.98177 2.61458 9 2.51562 9C2.375 9 2.25521 8.95312 2.15625 8.85938C2.0625 8.76042 2.01562 8.64062 2.01562 8.5C2.01562 8.40104 2.04427 8.30729 2.10156 8.21875C2.51302 7.5625 3.01042 6.97396 3.59375 6.45312C4.18229 5.93229 4.82292 5.48958 5.51562 5.125C6.20833 4.76042 6.9349 4.48177 7.69531 4.28906C8.46094 4.09635 9.22917 4 10 4C10.7656 4 11.5312 4.09635 12.2969 4.28906C13.0625 4.48177 13.7891 4.76042 14.4766 5.125C15.1693 5.48958 15.8073 5.93229 16.3906 6.45312C16.9792 6.97396 17.4818 7.5625 17.8984 8.21875C17.9557 8.30729 17.9844 8.40104 17.9844 8.5C17.9844 8.64062 17.9349 8.76042 17.8359 8.85938C17.7422 8.95312 17.625 9 17.4844 9C17.3958 9 17.3177 8.98177 17.25 8.94531C17.1875 8.90365 17.1276 8.84896 17.0703 8.78125C17.013 8.70833 16.9583 8.63542 16.9062 8.5625C16.8594 8.48438 16.8073 8.40885 16.75 8.33594C16.6406 8.1901 16.526 8.05208 16.4062 7.92188C16.2865 7.78646 16.1641 7.65365 16.0391 7.52344C15.638 7.1224 15.2031 6.76562 14.7344 6.45312C14.2708 6.14062 13.7812 5.8776 13.2656 5.66406C12.7552 5.44531 12.224 5.28125 11.6719 5.17188C11.1198 5.05729 10.5625 5 10 5ZM10 8C9.61458 8 9.23177 8.04167 8.85156 8.125C8.47135 8.20833 8.10417 8.33073 7.75 8.49219C7.40104 8.64844 7.06771 8.84115 6.75 9.07031C6.4375 9.29948 6.15365 9.55729 5.89844 9.84375C5.77344 9.98438 5.65885 10.1328 5.55469 10.2891C5.45573 10.4453 5.34896 10.599 5.23438 10.75C5.17188 10.8281 5.10938 10.8906 5.04688 10.9375C4.98958 10.9792 4.90885 11 4.80469 11C4.66927 11 4.55208 10.9505 4.45312 10.8516C4.35417 10.7526 4.30469 10.6354 4.30469 10.5C4.30469 10.4167 4.32552 10.3333 4.36719 10.25C4.63281 9.75521 4.97135 9.30729 5.38281 8.90625C5.79427 8.50521 6.25 8.16406 6.75 7.88281C7.25 7.60156 7.77604 7.38542 8.32812 7.23438C8.88542 7.07812 9.44271 7 10 7C10.5521 7 11.1068 7.07812 11.6641 7.23438C12.2214 7.38542 12.75 7.60156 13.25 7.88281C13.75 8.16406 14.2057 8.50521 14.6172 8.90625C15.0286 9.30729 15.3672 9.75521 15.6328 10.25C15.6745 10.3333 15.6953 10.4167 15.6953 10.5C15.6953 10.6354 15.6458 10.7526 15.5469 10.8516C15.4479 10.9505 15.3307 11 15.1953 11C15.0911 11 15.0078 10.9792 14.9453 10.9375C14.888 10.8906 14.8281 10.8281 14.7656 10.75C14.651 10.599 14.5417 10.4453 14.4375 10.2891C14.3385 10.1328 14.2266 9.98438 14.1016 9.84375C13.8464 9.55729 13.5599 9.29948 13.2422 9.07031C12.9297 8.84115 12.5964 8.64844 12.2422 8.49219C11.8932 8.33073 11.5286 8.20833 11.1484 8.125C10.7682 8.04167 10.3854 8 10 8ZM10 11C9.70833 11 9.42969 11.0417 9.16406 11.125C8.89844 11.2031 8.64062 11.3177 8.39062 11.4688C8.25 11.5573 8.1276 11.6458 8.02344 11.7344C7.92448 11.8229 7.83333 11.9167 7.75 12.0156C7.67188 12.1146 7.59635 12.2214 7.52344 12.3359C7.45052 12.4453 7.3724 12.5703 7.28906 12.7109C7.23698 12.7995 7.17448 12.8698 7.10156 12.9219C7.02865 12.974 6.9401 13 6.83594 13C6.69531 13 6.57552 12.9505 6.47656 12.8516C6.38281 12.7526 6.33594 12.6328 6.33594 12.4922C6.33594 12.4245 6.35156 12.3542 6.38281 12.2812C6.53385 11.9479 6.73958 11.6406 7 11.3594C7.26042 11.0781 7.55208 10.8385 7.875 10.6406C8.19792 10.4375 8.54167 10.2812 8.90625 10.1719C9.27083 10.0573 9.63542 10 10 10C10.375 10 10.7448 10.0547 11.1094 10.1641C11.474 10.2734 11.8151 10.4271 12.1328 10.625C12.4557 10.8229 12.7448 11.0625 13 11.3438C13.2552 11.625 13.4609 11.9375 13.6172 12.2812C13.6484 12.3542 13.6641 12.4245 13.6641 12.4922C13.6641 12.6276 13.6146 12.7474 13.5156 12.8516C13.4167 12.9505 13.2995 13 13.1641 13C13.0599 13 12.9714 12.974 12.8984 12.9219C12.8255 12.8698 12.763 12.7995 12.7109 12.7109C12.6276 12.5703 12.5495 12.4453 12.4766 12.3359C12.4036 12.2214 12.3255 12.1146 12.2422 12.0156C12.1589 11.9167 12.0651 11.8229 11.9609 11.7344C11.862 11.6458 11.7422 11.5573 11.6016 11.4688C11.3568 11.3177 11.099 11.2031 10.8281 11.125C10.5625 11.0417 10.2865 11 10 11ZM8.75 14C8.75 13.8281 8.78385 13.6667 8.85156 13.5156C8.91927 13.3646 9.00781 13.2344 9.11719 13.125C9.23177 13.0104 9.36458 12.9193 9.51562 12.8516C9.66667 12.7839 9.82812 12.75 10 12.75C10.1719 12.75 10.3333 12.7839 10.4844 12.8516C10.6354 12.9193 10.7656 13.0104 10.875 13.125C10.9896 13.2344 11.0807 13.3646 11.1484 13.5156C11.2161 13.6667 11.25 13.8281 11.25 14C11.25 14.1719 11.2161 14.3333 11.1484 14.4844C11.0807 14.6354 10.9896 14.7682 10.875 14.8828C10.7656 14.9922 10.6354 15.0807 10.4844 15.1484C10.3333 15.2161 10.1719 15.25 10 15.25C9.82812 15.25 9.66667 15.2161 9.51562 15.1484C9.36458 15.0807 9.23177 14.9922 9.11719 14.8828C9.00781 14.7682 8.91927 14.6354 8.85156 14.4844C8.78385 14.3333 8.75 14.1719 8.75 14Z"
                      fill="#F1F1F1"
                    />
                    <path
                      d="M38 16.2422C38 16.1536 38.0156 16.0833 38.0469 16.0312C38.0833 15.974 38.1302 15.9141 38.1875 15.8516C38.2604 15.7786 38.3385 15.7109 38.4219 15.6484C38.5052 15.5807 38.5859 15.5104 38.6641 15.4375C39.0391 15.0938 39.3724 14.7135 39.6641 14.2969C39.9557 13.875 40.2005 13.4297 40.3984 12.9609C40.5964 12.4922 40.7448 12.0078 40.8438 11.5078C40.9479 11.0078 41 10.5052 41 10C41 9.5 40.9479 9 40.8438 8.5C40.7448 7.99479 40.5938 7.50781 40.3906 7.03906C40.1927 6.5651 39.9479 6.11719 39.6562 5.69531C39.3698 5.27344 39.0391 4.89323 38.6641 4.55469C38.5859 4.48177 38.5052 4.41406 38.4219 4.35156C38.3385 4.28385 38.2604 4.21354 38.1875 4.14062C38.125 4.07812 38.0781 4.02083 38.0469 3.96875C38.0156 3.91667 38 3.84375 38 3.75C38 3.60938 38.0469 3.49219 38.1406 3.39844C38.2396 3.30469 38.3594 3.25781 38.5 3.25781C38.5625 3.25781 38.6172 3.26823 38.6641 3.28906C38.7109 3.30469 38.7604 3.33073 38.8125 3.36719C39.0469 3.51823 39.2786 3.71094 39.5078 3.94531C39.737 4.17969 39.9531 4.43229 40.1562 4.70312C40.3646 4.96875 40.5547 5.24219 40.7266 5.52344C40.8984 5.80469 41.0443 6.07031 41.1641 6.32031C41.4401 6.89844 41.6484 7.4974 41.7891 8.11719C41.9297 8.73177 42 9.35938 42 10C42 10.6354 41.9297 11.2656 41.7891 11.8906C41.6484 12.5104 41.4401 13.1068 41.1641 13.6797C41.0443 13.9245 40.8984 14.1901 40.7266 14.4766C40.5547 14.7578 40.3646 15.0339 40.1562 15.3047C39.9479 15.5703 39.7292 15.8203 39.5 16.0547C39.2708 16.2891 39.0417 16.4818 38.8125 16.6328C38.7552 16.6693 38.7031 16.6979 38.6562 16.7188C38.6146 16.7344 38.5625 16.7422 38.5 16.7422C38.3646 16.7422 38.2474 16.6927 38.1484 16.5938C38.0495 16.4948 38 16.3776 38 16.2422ZM29.2969 13H27.5C27.2969 13 27.1042 12.9609 26.9219 12.8828C26.7396 12.8047 26.5781 12.6979 26.4375 12.5625C26.3021 12.4219 26.1953 12.2604 26.1172 12.0781C26.0391 11.8958 26 11.7031 26 11.5V8.5C26 8.29688 26.0391 8.10417 26.1172 7.92188C26.1953 7.73958 26.3021 7.58073 26.4375 7.44531C26.5781 7.30469 26.7396 7.19531 26.9219 7.11719C27.1042 7.03906 27.2969 7 27.5 7H29.2969L31.7188 4.57031C31.7917 4.4974 31.8724 4.44531 31.9609 4.41406C32.0547 4.3776 32.151 4.35938 32.25 4.35938C32.4635 4.35938 32.6406 4.42969 32.7812 4.57031C32.9271 4.71094 33 4.88802 33 5.10156V14.8984C33 15.0026 32.9792 15.099 32.9375 15.1875C32.901 15.276 32.8464 15.3568 32.7734 15.4297C32.7057 15.4974 32.625 15.5521 32.5312 15.5938C32.4427 15.6302 32.349 15.6484 32.25 15.6484C32.0417 15.6484 31.8646 15.5755 31.7188 15.4297L29.2969 13ZM36.0312 14.4453C36.0312 14.3568 36.0443 14.2891 36.0703 14.2422C36.1016 14.1953 36.1458 14.138 36.2031 14.0703C36.4896 13.7474 36.7448 13.4375 36.9688 13.1406C37.1927 12.8438 37.3802 12.5391 37.5312 12.2266C37.6823 11.9089 37.7969 11.5703 37.875 11.2109C37.9583 10.8516 38 10.4479 38 10C38 9.55208 37.9583 9.14844 37.875 8.78906C37.7969 8.42969 37.6823 8.09375 37.5312 7.78125C37.3802 7.46354 37.1927 7.15625 36.9688 6.85938C36.7448 6.5625 36.4896 6.2526 36.2031 5.92969C36.1458 5.86198 36.1016 5.80469 36.0703 5.75781C36.0443 5.71094 36.0312 5.64323 36.0312 5.55469C36.0312 5.41927 36.0807 5.30469 36.1797 5.21094C36.2839 5.11198 36.4036 5.0625 36.5391 5.0625C36.6172 5.0625 36.6771 5.07292 36.7188 5.09375C36.7604 5.10938 36.8125 5.14062 36.875 5.1875C37.0312 5.30729 37.1849 5.45573 37.3359 5.63281C37.4922 5.80469 37.638 5.98958 37.7734 6.1875C37.9141 6.38542 38.0417 6.58854 38.1562 6.79688C38.2708 7 38.3672 7.19271 38.4453 7.375C38.8151 8.20833 39 9.08333 39 10C39 10.9167 38.8151 11.7917 38.4453 12.625C38.3724 12.7917 38.276 12.9818 38.1562 13.1953C38.0417 13.4036 37.9141 13.612 37.7734 13.8203C37.6328 14.0234 37.4844 14.2135 37.3281 14.3906C37.1771 14.5677 37.026 14.7083 36.875 14.8125C36.8177 14.849 36.763 14.8802 36.7109 14.9062C36.6641 14.9271 36.6068 14.9375 36.5391 14.9375C36.4036 14.9375 36.2839 14.8906 36.1797 14.7969C36.0807 14.6979 36.0312 14.5807 36.0312 14.4453ZM32 14.2891V5.70312L29.8516 7.85156C29.7526 7.95052 29.6354 8 29.5 8H27.5C27.3646 8 27.2474 8.04948 27.1484 8.14844C27.0495 8.2474 27 8.36458 27 8.5V11.5C27 11.6354 27.0495 11.7526 27.1484 11.8516C27.2474 11.9505 27.3646 12 27.5 12H29.5C29.6354 12 29.7526 12.0495 29.8516 12.1484L32 14.2891ZM34.0938 12.5391C34.0938 12.4661 34.1016 12.4089 34.1172 12.3672C34.138 12.3255 34.1693 12.276 34.2109 12.2188C34.3307 12.0365 34.4401 11.862 34.5391 11.6953C34.638 11.5234 34.7214 11.3516 34.7891 11.1797C34.8568 11.0026 34.9089 10.8203 34.9453 10.6328C34.9818 10.4401 35 10.2292 35 10C35 9.77604 34.9818 9.56771 34.9453 9.375C34.9089 9.18229 34.8568 9 34.7891 8.82812C34.7214 8.65104 34.638 8.47917 34.5391 8.3125C34.4401 8.14062 34.3307 7.96354 34.2109 7.78125C34.1693 7.72396 34.138 7.67448 34.1172 7.63281C34.1016 7.59115 34.0938 7.53385 34.0938 7.46094C34.0938 7.32552 34.1432 7.20833 34.2422 7.10938C34.3411 7.01042 34.4583 6.96094 34.5938 6.96094C34.6823 6.96094 34.7552 6.97656 34.8125 7.00781C34.8698 7.03906 34.9271 7.08594 34.9844 7.14844C35.151 7.33073 35.2969 7.53646 35.4219 7.76562C35.5469 7.98958 35.651 8.22917 35.7344 8.48438C35.8229 8.73438 35.888 8.98958 35.9297 9.25C35.9766 9.51042 36 9.76042 36 10C36 10.2292 35.9766 10.4766 35.9297 10.7422C35.888 11.0026 35.8229 11.263 35.7344 11.5234C35.651 11.7786 35.5443 12.0234 35.4141 12.2578C35.2891 12.487 35.1458 12.6849 34.9844 12.8516C34.875 12.9714 34.7448 13.0312 34.5938 13.0312C34.4583 13.0312 34.3411 12.9844 34.2422 12.8906C34.1432 12.7917 34.0938 12.6745 34.0938 12.5391Z"
                      fill="#F1F1F1"
                    />
                    <path
                      d="M66 10.5C66 10.776 65.901 11.013 65.7031 11.2109C65.5104 11.4036 65.276 11.5 65 11.5H64V12.5547C64 12.8828 63.9323 13.1953 63.7969 13.4922C63.6667 13.7891 63.4896 14.0495 63.2656 14.2734C63.0469 14.4922 62.7891 14.6693 62.4922 14.8047C62.1953 14.9349 61.8828 15 61.5547 15H52.4453C52.1172 15 51.8047 14.9349 51.5078 14.8047C51.2109 14.6693 50.9505 14.4922 50.7266 14.2734C50.5078 14.0495 50.3307 13.7891 50.1953 13.4922C50.0651 13.1953 50 12.8828 50 12.5547V7.44531C50 7.11719 50.0651 6.80469 50.1953 6.50781C50.3307 6.21094 50.5078 5.95312 50.7266 5.73438C50.9505 5.51042 51.2109 5.33333 51.5078 5.20312C51.8047 5.06771 52.1172 5 52.4453 5H61.5547C61.888 5 62.2005 5.06771 62.4922 5.20312C62.7891 5.33333 63.0469 5.51042 63.2656 5.73438C63.4896 5.95312 63.6667 6.21094 63.7969 6.50781C63.9271 6.80469 63.9948 7.11719 64 7.44531V7.79688V8.5H65C65.1354 8.5 65.263 8.52604 65.3828 8.57812C65.5026 8.63021 65.6094 8.70312 65.7031 8.79688C65.7969 8.89062 65.8698 8.9974 65.9219 9.11719C65.974 9.23698 66 9.36458 66 9.5V10.5ZM63 7.5C63 7.29688 62.9609 7.10417 62.8828 6.92188C62.8047 6.73958 62.6953 6.58073 62.5547 6.44531C62.4193 6.30469 62.2604 6.19531 62.0781 6.11719C61.8958 6.03906 61.7031 6 61.5 6H52.5C52.2969 6 52.1042 6.03906 51.9219 6.11719C51.7396 6.19531 51.5781 6.30469 51.4375 6.44531C51.3021 6.58073 51.1953 6.73958 51.1172 6.92188C51.0391 7.10417 51 7.29688 51 7.5V12.5C51 12.7031 51.0391 12.8958 51.1172 13.0781C51.1953 13.2604 51.3021 13.4219 51.4375 13.5625C51.5781 13.6979 51.7396 13.8047 51.9219 13.8828C52.1042 13.9609 52.2969 14 52.5 14H61.5C61.7031 14 61.8958 13.9609 62.0781 13.8828C62.2604 13.8047 62.4193 13.6979 62.5547 13.5625C62.6953 13.4219 62.8047 13.2604 62.8828 13.0781C62.9609 12.8958 63 12.7031 63 12.5V7.5ZM60.25 7C60.4583 7 60.6354 7.07292 60.7812 7.21875C60.9271 7.36458 61 7.54167 61 7.75V12.25C61 12.4583 60.9271 12.6354 60.7812 12.7812C60.6354 12.9271 60.4583 13 60.25 13H52.75C52.5417 13 52.3646 12.9271 52.2188 12.7812C52.0729 12.6354 52 12.4583 52 12.25V7.75C52 7.54167 52.0729 7.36458 52.2188 7.21875C52.3646 7.07292 52.5417 7 52.75 7H60.25Z"
                      fill="#F1F1F1"
                    />
                  </svg>
                </div>
              ) : (
                <div
                  onClick={() => setOpenPanel(true)}
                  className="flex justify-end items-center w-20 h-10 px-2 hover:bg-white/5 transition-colors ease-in-out duration-150 rounded-md"
                >
                  <svg
                    className="w-20 h-10"
                    viewBox="0 0 68 20"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M10 5C9.4375 5 8.88021 5.05729 8.32812 5.17188C7.78125 5.28125 7.25 5.44531 6.73438 5.66406C6.21875 5.8776 5.72656 6.14062 5.25781 6.45312C4.78906 6.76562 4.35677 7.1224 3.96094 7.52344C3.76302 7.72135 3.58594 7.92969 3.42969 8.14844C3.27344 8.36198 3.10677 8.57292 2.92969 8.78125C2.86719 8.85417 2.80729 8.90885 2.75 8.94531C2.69271 8.98177 2.61458 9 2.51562 9C2.375 9 2.25521 8.95312 2.15625 8.85938C2.0625 8.76042 2.01562 8.64062 2.01562 8.5C2.01562 8.40104 2.04427 8.30729 2.10156 8.21875C2.51302 7.5625 3.01042 6.97396 3.59375 6.45312C4.18229 5.93229 4.82292 5.48958 5.51562 5.125C6.20833 4.76042 6.9349 4.48177 7.69531 4.28906C8.46094 4.09635 9.22917 4 10 4C10.7656 4 11.5312 4.09635 12.2969 4.28906C13.0625 4.48177 13.7891 4.76042 14.4766 5.125C15.1693 5.48958 15.8073 5.93229 16.3906 6.45312C16.9792 6.97396 17.4818 7.5625 17.8984 8.21875C17.9557 8.30729 17.9844 8.40104 17.9844 8.5C17.9844 8.64062 17.9349 8.76042 17.8359 8.85938C17.7422 8.95312 17.625 9 17.4844 9C17.3958 9 17.3177 8.98177 17.25 8.94531C17.1875 8.90365 17.1276 8.84896 17.0703 8.78125C17.013 8.70833 16.9583 8.63542 16.9062 8.5625C16.8594 8.48438 16.8073 8.40885 16.75 8.33594C16.6406 8.1901 16.526 8.05208 16.4062 7.92188C16.2865 7.78646 16.1641 7.65365 16.0391 7.52344C15.638 7.1224 15.2031 6.76562 14.7344 6.45312C14.2708 6.14062 13.7812 5.8776 13.2656 5.66406C12.7552 5.44531 12.224 5.28125 11.6719 5.17188C11.1198 5.05729 10.5625 5 10 5ZM10 8C9.61458 8 9.23177 8.04167 8.85156 8.125C8.47135 8.20833 8.10417 8.33073 7.75 8.49219C7.40104 8.64844 7.06771 8.84115 6.75 9.07031C6.4375 9.29948 6.15365 9.55729 5.89844 9.84375C5.77344 9.98438 5.65885 10.1328 5.55469 10.2891C5.45573 10.4453 5.34896 10.599 5.23438 10.75C5.17188 10.8281 5.10938 10.8906 5.04688 10.9375C4.98958 10.9792 4.90885 11 4.80469 11C4.66927 11 4.55208 10.9505 4.45312 10.8516C4.35417 10.7526 4.30469 10.6354 4.30469 10.5C4.30469 10.4167 4.32552 10.3333 4.36719 10.25C4.63281 9.75521 4.97135 9.30729 5.38281 8.90625C5.79427 8.50521 6.25 8.16406 6.75 7.88281C7.25 7.60156 7.77604 7.38542 8.32812 7.23438C8.88542 7.07812 9.44271 7 10 7C10.5521 7 11.1068 7.07812 11.6641 7.23438C12.2214 7.38542 12.75 7.60156 13.25 7.88281C13.75 8.16406 14.2057 8.50521 14.6172 8.90625C15.0286 9.30729 15.3672 9.75521 15.6328 10.25C15.6745 10.3333 15.6953 10.4167 15.6953 10.5C15.6953 10.6354 15.6458 10.7526 15.5469 10.8516C15.4479 10.9505 15.3307 11 15.1953 11C15.0911 11 15.0078 10.9792 14.9453 10.9375C14.888 10.8906 14.8281 10.8281 14.7656 10.75C14.651 10.599 14.5417 10.4453 14.4375 10.2891C14.3385 10.1328 14.2266 9.98438 14.1016 9.84375C13.8464 9.55729 13.5599 9.29948 13.2422 9.07031C12.9297 8.84115 12.5964 8.64844 12.2422 8.49219C11.8932 8.33073 11.5286 8.20833 11.1484 8.125C10.7682 8.04167 10.3854 8 10 8ZM10 11C9.70833 11 9.42969 11.0417 9.16406 11.125C8.89844 11.2031 8.64062 11.3177 8.39062 11.4688C8.25 11.5573 8.1276 11.6458 8.02344 11.7344C7.92448 11.8229 7.83333 11.9167 7.75 12.0156C7.67188 12.1146 7.59635 12.2214 7.52344 12.3359C7.45052 12.4453 7.3724 12.5703 7.28906 12.7109C7.23698 12.7995 7.17448 12.8698 7.10156 12.9219C7.02865 12.974 6.9401 13 6.83594 13C6.69531 13 6.57552 12.9505 6.47656 12.8516C6.38281 12.7526 6.33594 12.6328 6.33594 12.4922C6.33594 12.4245 6.35156 12.3542 6.38281 12.2812C6.53385 11.9479 6.73958 11.6406 7 11.3594C7.26042 11.0781 7.55208 10.8385 7.875 10.6406C8.19792 10.4375 8.54167 10.2812 8.90625 10.1719C9.27083 10.0573 9.63542 10 10 10C10.375 10 10.7448 10.0547 11.1094 10.1641C11.474 10.2734 11.8151 10.4271 12.1328 10.625C12.4557 10.8229 12.7448 11.0625 13 11.3438C13.2552 11.625 13.4609 11.9375 13.6172 12.2812C13.6484 12.3542 13.6641 12.4245 13.6641 12.4922C13.6641 12.6276 13.6146 12.7474 13.5156 12.8516C13.4167 12.9505 13.2995 13 13.1641 13C13.0599 13 12.9714 12.974 12.8984 12.9219C12.8255 12.8698 12.763 12.7995 12.7109 12.7109C12.6276 12.5703 12.5495 12.4453 12.4766 12.3359C12.4036 12.2214 12.3255 12.1146 12.2422 12.0156C12.1589 11.9167 12.0651 11.8229 11.9609 11.7344C11.862 11.6458 11.7422 11.5573 11.6016 11.4688C11.3568 11.3177 11.099 11.2031 10.8281 11.125C10.5625 11.0417 10.2865 11 10 11ZM8.75 14C8.75 13.8281 8.78385 13.6667 8.85156 13.5156C8.91927 13.3646 9.00781 13.2344 9.11719 13.125C9.23177 13.0104 9.36458 12.9193 9.51562 12.8516C9.66667 12.7839 9.82812 12.75 10 12.75C10.1719 12.75 10.3333 12.7839 10.4844 12.8516C10.6354 12.9193 10.7656 13.0104 10.875 13.125C10.9896 13.2344 11.0807 13.3646 11.1484 13.5156C11.2161 13.6667 11.25 13.8281 11.25 14C11.25 14.1719 11.2161 14.3333 11.1484 14.4844C11.0807 14.6354 10.9896 14.7682 10.875 14.8828C10.7656 14.9922 10.6354 15.0807 10.4844 15.1484C10.3333 15.2161 10.1719 15.25 10 15.25C9.82812 15.25 9.66667 15.2161 9.51562 15.1484C9.36458 15.0807 9.23177 14.9922 9.11719 14.8828C9.00781 14.7682 8.91927 14.6354 8.85156 14.4844C8.78385 14.3333 8.75 14.1719 8.75 14Z"
                      fill="#F1F1F1"
                    />
                    <path
                      d="M38 16.2422C38 16.1536 38.0156 16.0833 38.0469 16.0312C38.0833 15.974 38.1302 15.9141 38.1875 15.8516C38.2604 15.7786 38.3385 15.7109 38.4219 15.6484C38.5052 15.5807 38.5859 15.5104 38.6641 15.4375C39.0391 15.0938 39.3724 14.7135 39.6641 14.2969C39.9557 13.875 40.2005 13.4297 40.3984 12.9609C40.5964 12.4922 40.7448 12.0078 40.8438 11.5078C40.9479 11.0078 41 10.5052 41 10C41 9.5 40.9479 9 40.8438 8.5C40.7448 7.99479 40.5938 7.50781 40.3906 7.03906C40.1927 6.5651 39.9479 6.11719 39.6562 5.69531C39.3698 5.27344 39.0391 4.89323 38.6641 4.55469C38.5859 4.48177 38.5052 4.41406 38.4219 4.35156C38.3385 4.28385 38.2604 4.21354 38.1875 4.14062C38.125 4.07812 38.0781 4.02083 38.0469 3.96875C38.0156 3.91667 38 3.84375 38 3.75C38 3.60938 38.0469 3.49219 38.1406 3.39844C38.2396 3.30469 38.3594 3.25781 38.5 3.25781C38.5625 3.25781 38.6172 3.26823 38.6641 3.28906C38.7109 3.30469 38.7604 3.33073 38.8125 3.36719C39.0469 3.51823 39.2786 3.71094 39.5078 3.94531C39.737 4.17969 39.9531 4.43229 40.1562 4.70312C40.3646 4.96875 40.5547 5.24219 40.7266 5.52344C40.8984 5.80469 41.0443 6.07031 41.1641 6.32031C41.4401 6.89844 41.6484 7.4974 41.7891 8.11719C41.9297 8.73177 42 9.35938 42 10C42 10.6354 41.9297 11.2656 41.7891 11.8906C41.6484 12.5104 41.4401 13.1068 41.1641 13.6797C41.0443 13.9245 40.8984 14.1901 40.7266 14.4766C40.5547 14.7578 40.3646 15.0339 40.1562 15.3047C39.9479 15.5703 39.7292 15.8203 39.5 16.0547C39.2708 16.2891 39.0417 16.4818 38.8125 16.6328C38.7552 16.6693 38.7031 16.6979 38.6562 16.7188C38.6146 16.7344 38.5625 16.7422 38.5 16.7422C38.3646 16.7422 38.2474 16.6927 38.1484 16.5938C38.0495 16.4948 38 16.3776 38 16.2422ZM29.2969 13H27.5C27.2969 13 27.1042 12.9609 26.9219 12.8828C26.7396 12.8047 26.5781 12.6979 26.4375 12.5625C26.3021 12.4219 26.1953 12.2604 26.1172 12.0781C26.0391 11.8958 26 11.7031 26 11.5V8.5C26 8.29688 26.0391 8.10417 26.1172 7.92188C26.1953 7.73958 26.3021 7.58073 26.4375 7.44531C26.5781 7.30469 26.7396 7.19531 26.9219 7.11719C27.1042 7.03906 27.2969 7 27.5 7H29.2969L31.7188 4.57031C31.7917 4.4974 31.8724 4.44531 31.9609 4.41406C32.0547 4.3776 32.151 4.35938 32.25 4.35938C32.4635 4.35938 32.6406 4.42969 32.7812 4.57031C32.9271 4.71094 33 4.88802 33 5.10156V14.8984C33 15.0026 32.9792 15.099 32.9375 15.1875C32.901 15.276 32.8464 15.3568 32.7734 15.4297C32.7057 15.4974 32.625 15.5521 32.5312 15.5938C32.4427 15.6302 32.349 15.6484 32.25 15.6484C32.0417 15.6484 31.8646 15.5755 31.7188 15.4297L29.2969 13ZM36.0312 14.4453C36.0312 14.3568 36.0443 14.2891 36.0703 14.2422C36.1016 14.1953 36.1458 14.138 36.2031 14.0703C36.4896 13.7474 36.7448 13.4375 36.9688 13.1406C37.1927 12.8438 37.3802 12.5391 37.5312 12.2266C37.6823 11.9089 37.7969 11.5703 37.875 11.2109C37.9583 10.8516 38 10.4479 38 10C38 9.55208 37.9583 9.14844 37.875 8.78906C37.7969 8.42969 37.6823 8.09375 37.5312 7.78125C37.3802 7.46354 37.1927 7.15625 36.9688 6.85938C36.7448 6.5625 36.4896 6.2526 36.2031 5.92969C36.1458 5.86198 36.1016 5.80469 36.0703 5.75781C36.0443 5.71094 36.0312 5.64323 36.0312 5.55469C36.0312 5.41927 36.0807 5.30469 36.1797 5.21094C36.2839 5.11198 36.4036 5.0625 36.5391 5.0625C36.6172 5.0625 36.6771 5.07292 36.7188 5.09375C36.7604 5.10938 36.8125 5.14062 36.875 5.1875C37.0312 5.30729 37.1849 5.45573 37.3359 5.63281C37.4922 5.80469 37.638 5.98958 37.7734 6.1875C37.9141 6.38542 38.0417 6.58854 38.1562 6.79688C38.2708 7 38.3672 7.19271 38.4453 7.375C38.8151 8.20833 39 9.08333 39 10C39 10.9167 38.8151 11.7917 38.4453 12.625C38.3724 12.7917 38.276 12.9818 38.1562 13.1953C38.0417 13.4036 37.9141 13.612 37.7734 13.8203C37.6328 14.0234 37.4844 14.2135 37.3281 14.3906C37.1771 14.5677 37.026 14.7083 36.875 14.8125C36.8177 14.849 36.763 14.8802 36.7109 14.9062C36.6641 14.9271 36.6068 14.9375 36.5391 14.9375C36.4036 14.9375 36.2839 14.8906 36.1797 14.7969C36.0807 14.6979 36.0312 14.5807 36.0312 14.4453ZM32 14.2891V5.70312L29.8516 7.85156C29.7526 7.95052 29.6354 8 29.5 8H27.5C27.3646 8 27.2474 8.04948 27.1484 8.14844C27.0495 8.2474 27 8.36458 27 8.5V11.5C27 11.6354 27.0495 11.7526 27.1484 11.8516C27.2474 11.9505 27.3646 12 27.5 12H29.5C29.6354 12 29.7526 12.0495 29.8516 12.1484L32 14.2891ZM34.0938 12.5391C34.0938 12.4661 34.1016 12.4089 34.1172 12.3672C34.138 12.3255 34.1693 12.276 34.2109 12.2188C34.3307 12.0365 34.4401 11.862 34.5391 11.6953C34.638 11.5234 34.7214 11.3516 34.7891 11.1797C34.8568 11.0026 34.9089 10.8203 34.9453 10.6328C34.9818 10.4401 35 10.2292 35 10C35 9.77604 34.9818 9.56771 34.9453 9.375C34.9089 9.18229 34.8568 9 34.7891 8.82812C34.7214 8.65104 34.638 8.47917 34.5391 8.3125C34.4401 8.14062 34.3307 7.96354 34.2109 7.78125C34.1693 7.72396 34.138 7.67448 34.1172 7.63281C34.1016 7.59115 34.0938 7.53385 34.0938 7.46094C34.0938 7.32552 34.1432 7.20833 34.2422 7.10938C34.3411 7.01042 34.4583 6.96094 34.5938 6.96094C34.6823 6.96094 34.7552 6.97656 34.8125 7.00781C34.8698 7.03906 34.9271 7.08594 34.9844 7.14844C35.151 7.33073 35.2969 7.53646 35.4219 7.76562C35.5469 7.98958 35.651 8.22917 35.7344 8.48438C35.8229 8.73438 35.888 8.98958 35.9297 9.25C35.9766 9.51042 36 9.76042 36 10C36 10.2292 35.9766 10.4766 35.9297 10.7422C35.888 11.0026 35.8229 11.263 35.7344 11.5234C35.651 11.7786 35.5443 12.0234 35.4141 12.2578C35.2891 12.487 35.1458 12.6849 34.9844 12.8516C34.875 12.9714 34.7448 13.0312 34.5938 13.0312C34.4583 13.0312 34.3411 12.9844 34.2422 12.8906C34.1432 12.7917 34.0938 12.6745 34.0938 12.5391Z"
                      fill="#F1F1F1"
                    />
                    <path
                      d="M66 10.5C66 10.776 65.901 11.013 65.7031 11.2109C65.5104 11.4036 65.276 11.5 65 11.5H64V12.5547C64 12.8828 63.9323 13.1953 63.7969 13.4922C63.6667 13.7891 63.4896 14.0495 63.2656 14.2734C63.0469 14.4922 62.7891 14.6693 62.4922 14.8047C62.1953 14.9349 61.8828 15 61.5547 15H52.4453C52.1172 15 51.8047 14.9349 51.5078 14.8047C51.2109 14.6693 50.9505 14.4922 50.7266 14.2734C50.5078 14.0495 50.3307 13.7891 50.1953 13.4922C50.0651 13.1953 50 12.8828 50 12.5547V7.44531C50 7.11719 50.0651 6.80469 50.1953 6.50781C50.3307 6.21094 50.5078 5.95312 50.7266 5.73438C50.9505 5.51042 51.2109 5.33333 51.5078 5.20312C51.8047 5.06771 52.1172 5 52.4453 5H61.5547C61.888 5 62.2005 5.06771 62.4922 5.20312C62.7891 5.33333 63.0469 5.51042 63.2656 5.73438C63.4896 5.95312 63.6667 6.21094 63.7969 6.50781C63.9271 6.80469 63.9948 7.11719 64 7.44531V7.79688V8.5H65C65.1354 8.5 65.263 8.52604 65.3828 8.57812C65.5026 8.63021 65.6094 8.70312 65.7031 8.79688C65.7969 8.89062 65.8698 8.9974 65.9219 9.11719C65.974 9.23698 66 9.36458 66 9.5V10.5ZM63 7.5C63 7.29688 62.9609 7.10417 62.8828 6.92188C62.8047 6.73958 62.6953 6.58073 62.5547 6.44531C62.4193 6.30469 62.2604 6.19531 62.0781 6.11719C61.8958 6.03906 61.7031 6 61.5 6H52.5C52.2969 6 52.1042 6.03906 51.9219 6.11719C51.7396 6.19531 51.5781 6.30469 51.4375 6.44531C51.3021 6.58073 51.1953 6.73958 51.1172 6.92188C51.0391 7.10417 51 7.29688 51 7.5V12.5C51 12.7031 51.0391 12.8958 51.1172 13.0781C51.1953 13.2604 51.3021 13.4219 51.4375 13.5625C51.5781 13.6979 51.7396 13.8047 51.9219 13.8828C52.1042 13.9609 52.2969 14 52.5 14H61.5C61.7031 14 61.8958 13.9609 62.0781 13.8828C62.2604 13.8047 62.4193 13.6979 62.5547 13.5625C62.6953 13.4219 62.8047 13.2604 62.8828 13.0781C62.9609 12.8958 63 12.7031 63 12.5V7.5ZM60.25 7C60.4583 7 60.6354 7.07292 60.7812 7.21875C60.9271 7.36458 61 7.54167 61 7.75V12.25C61 12.4583 60.9271 12.6354 60.7812 12.7812C60.6354 12.9271 60.4583 13 60.25 13H52.75C52.5417 13 52.3646 12.9271 52.2188 12.7812C52.0729 12.6354 52 12.4583 52 12.25V7.75C52 7.54167 52.0729 7.36458 52.2188 7.21875C52.3646 7.07292 52.5417 7 52.75 7H60.25Z"
                      fill="#F1F1F1"
                    />
                  </svg>
                </div>
              )}
              {openCalendar ? (
                <div
                  className={`${
                    openCalendar ? "bg-white/5" : ""
                  } flex flex-col hover:bg-white/5 transition-colors ease-in-out duration-150 rounded-md px-1.5 py-1.5`}
                  onClick={() => setOpenCalendar(false)}
                >
                  <span className="text-xs text-right text-white">{time}</span>
                  <span className="text-xs text-white">{date}</span>
                </div>
              ) : (
                <div
                  className={`${
                    openCalendar ? "bg-white/5" : ""
                  } flex flex-col hover:bg-white/5 transition-colors ease-in-out duration-150 rounded-md px-1.5 py-1.5`}
                  onClick={() => setOpenCalendar(true)}
                >
                  <span className="text-xs text-right text-white">{time}</span>
                  <span className="text-xs text-white">{date}</span>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
