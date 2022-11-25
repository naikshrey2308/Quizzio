--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-07 20:39:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 17444)
-- Name: Discussions_discussions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Discussions_discussions" (
    id bigint NOT NULL,
    doubts_id bigint NOT NULL
);


ALTER TABLE public."Discussions_discussions" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17443)
-- Name: Discussions_discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Discussions_discussions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Discussions_discussions_id_seq" OWNER TO postgres;

--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 236
-- Name: Discussions_discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Discussions_discussions_id_seq" OWNED BY public."Discussions_discussions".id;


--
-- TOC entry 233 (class 1259 OID 17426)
-- Name: Discussions_doubt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Discussions_doubt" (
    id bigint NOT NULL,
    heading character varying(255) NOT NULL,
    statement text NOT NULL,
    creator_id bigint NOT NULL
);


ALTER TABLE public."Discussions_doubt" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17425)
-- Name: Discussions_doubt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Discussions_doubt_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Discussions_doubt_id_seq" OWNER TO postgres;

--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 232
-- Name: Discussions_doubt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Discussions_doubt_id_seq" OWNED BY public."Discussions_doubt".id;


--
-- TOC entry 235 (class 1259 OID 17435)
-- Name: Discussions_reply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Discussions_reply" (
    id bigint NOT NULL,
    statement text NOT NULL,
    creator_id bigint,
    doubt_id bigint NOT NULL,
    "trustedCreator_id" bigint
);


ALTER TABLE public."Discussions_reply" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17434)
-- Name: Discussions_reply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Discussions_reply_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Discussions_reply_id_seq" OWNER TO postgres;

--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 234
-- Name: Discussions_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Discussions_reply_id_seq" OWNED BY public."Discussions_reply".id;


--
-- TOC entry 229 (class 1259 OID 17093)
-- Name: User_organizer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User_organizer" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    "profilePic" character varying(100) NOT NULL,
    institution character varying(50) NOT NULL,
    dob date NOT NULL,
    "isNewsletterSubscribed" boolean NOT NULL,
    "totalQuizzesOrganized" integer NOT NULL
);


ALTER TABLE public."User_organizer" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17092)
-- Name: User_organizer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_organizer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_organizer_id_seq" OWNER TO postgres;

--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 228
-- Name: User_organizer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_organizer_id_seq" OWNED BY public."User_organizer".id;


--
-- TOC entry 231 (class 1259 OID 17102)
-- Name: User_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User_student" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    "profilePic" character varying(100) NOT NULL,
    institution character varying(50) NOT NULL,
    dob date NOT NULL,
    "isNewsletterSubscribed" boolean NOT NULL,
    rating integer NOT NULL,
    "totalQuizzesGiven" integer NOT NULL,
    "totalCorrectAnswers" integer NOT NULL,
    "totalWrongAnswers" integer NOT NULL
);


ALTER TABLE public."User_student" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17101)
-- Name: User_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_student_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_student_id_seq" OWNER TO postgres;

--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 230
-- Name: User_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_student_id_seq" OWNED BY public."User_student".id;


--
-- TOC entry 216 (class 1259 OID 16918)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16917)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 218 (class 1259 OID 16927)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16926)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 214 (class 1259 OID 16911)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16910)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 220 (class 1259 OID 16934)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16943)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16942)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 219 (class 1259 OID 16933)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 224 (class 1259 OID 16950)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16949)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 226 (class 1259 OID 17009)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17008)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 212 (class 1259 OID 16902)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16901)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 210 (class 1259 OID 16893)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16892)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 227 (class 1259 OID 17038)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18065)
-- Name: quizApp_attemptedopt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_attemptedopt" (
    id bigint NOT NULL,
    "isCorrect" boolean NOT NULL,
    "optionId_id" bigint NOT NULL,
    "questionId_id" bigint NOT NULL,
    score_id bigint NOT NULL
);


ALTER TABLE public."quizApp_attemptedopt" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18064)
-- Name: quizApp_attemptedopt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_attemptedopt_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_attemptedopt_id_seq" OWNER TO postgres;

--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 250
-- Name: quizApp_attemptedopt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_attemptedopt_id_seq" OWNED BY public."quizApp_attemptedopt".id;


--
-- TOC entry 249 (class 1259 OID 18058)
-- Name: quizApp_attemptedque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_attemptedque" (
    id bigint NOT NULL,
    marks integer NOT NULL,
    "questionId_id" bigint NOT NULL,
    "scoreId_id" bigint NOT NULL
);


ALTER TABLE public."quizApp_attemptedque" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18057)
-- Name: quizApp_attemptedque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_attemptedque_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_attemptedque_id_seq" OWNER TO postgres;

--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 248
-- Name: quizApp_attemptedque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_attemptedque_id_seq" OWNED BY public."quizApp_attemptedque".id;


--
-- TOC entry 247 (class 1259 OID 18051)
-- Name: quizApp_correctoptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_correctoptions" (
    id bigint NOT NULL,
    "optionId_id" bigint,
    "questionId_id" bigint NOT NULL
);


ALTER TABLE public."quizApp_correctoptions" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18050)
-- Name: quizApp_correctoptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_correctoptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_correctoptions_id_seq" OWNER TO postgres;

--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 246
-- Name: quizApp_correctoptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_correctoptions_id_seq" OWNED BY public."quizApp_correctoptions".id;


--
-- TOC entry 245 (class 1259 OID 18042)
-- Name: quizApp_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_option" (
    id bigint NOT NULL,
    statement text NOT NULL,
    "questionId_id" bigint NOT NULL
);


ALTER TABLE public."quizApp_option" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18041)
-- Name: quizApp_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_option_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_option_id_seq" OWNER TO postgres;

--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 244
-- Name: quizApp_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_option_id_seq" OWNED BY public."quizApp_option".id;


--
-- TOC entry 243 (class 1259 OID 18033)
-- Name: quizApp_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_question" (
    id bigint NOT NULL,
    marks integer NOT NULL,
    statement text NOT NULL,
    solution text NOT NULL,
    "quizId_id" bigint NOT NULL
);


ALTER TABLE public."quizApp_question" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18032)
-- Name: quizApp_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_question_id_seq" OWNER TO postgres;

--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 242
-- Name: quizApp_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_question_id_seq" OWNED BY public."quizApp_question".id;


--
-- TOC entry 239 (class 1259 OID 18017)
-- Name: quizApp_quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_quiz" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    subject character varying(100) NOT NULL,
    marks integer NOT NULL,
    description text,
    "quizPic" character varying(100) NOT NULL,
    "creationTime" timestamp with time zone,
    attempts integer NOT NULL,
    organizer_id bigint NOT NULL,
    "isLocked" boolean NOT NULL,
    "quizTime" time without time zone
);


ALTER TABLE public."quizApp_quiz" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18016)
-- Name: quizApp_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_quiz_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_quiz_id_seq" OWNER TO postgres;

--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 238
-- Name: quizApp_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_quiz_id_seq" OWNED BY public."quizApp_quiz".id;


--
-- TOC entry 241 (class 1259 OID 18026)
-- Name: quizApp_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."quizApp_score" (
    id bigint NOT NULL,
    marks integer NOT NULL,
    "quizId_id" bigint NOT NULL,
    "studentId_id" bigint NOT NULL,
    "creationTime" timestamp with time zone
);


ALTER TABLE public."quizApp_score" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18025)
-- Name: quizApp_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."quizApp_score_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."quizApp_score_id_seq" OWNER TO postgres;

--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 240
-- Name: quizApp_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."quizApp_score_id_seq" OWNED BY public."quizApp_score".id;


--
-- TOC entry 3282 (class 2604 OID 17447)
-- Name: Discussions_discussions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_discussions" ALTER COLUMN id SET DEFAULT nextval('public."Discussions_discussions_id_seq"'::regclass);


--
-- TOC entry 3280 (class 2604 OID 17429)
-- Name: Discussions_doubt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_doubt" ALTER COLUMN id SET DEFAULT nextval('public."Discussions_doubt_id_seq"'::regclass);


--
-- TOC entry 3281 (class 2604 OID 17438)
-- Name: Discussions_reply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_reply" ALTER COLUMN id SET DEFAULT nextval('public."Discussions_reply_id_seq"'::regclass);


--
-- TOC entry 3278 (class 2604 OID 17096)
-- Name: User_organizer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_organizer" ALTER COLUMN id SET DEFAULT nextval('public."User_organizer_id_seq"'::regclass);


--
-- TOC entry 3279 (class 2604 OID 17105)
-- Name: User_student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_student" ALTER COLUMN id SET DEFAULT nextval('public."User_student_id_seq"'::regclass);


--
-- TOC entry 3271 (class 2604 OID 16921)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 16930)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 16914)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 16937)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 16946)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 16953)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 17012)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 16905)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 16896)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 18068)
-- Name: quizApp_attemptedopt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedopt" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_attemptedopt_id_seq"'::regclass);


--
-- TOC entry 3288 (class 2604 OID 18061)
-- Name: quizApp_attemptedque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedque" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_attemptedque_id_seq"'::regclass);


--
-- TOC entry 3287 (class 2604 OID 18054)
-- Name: quizApp_correctoptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_correctoptions" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_correctoptions_id_seq"'::regclass);


--
-- TOC entry 3286 (class 2604 OID 18045)
-- Name: quizApp_option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_option" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_option_id_seq"'::regclass);


--
-- TOC entry 3285 (class 2604 OID 18036)
-- Name: quizApp_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_question" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_question_id_seq"'::regclass);


--
-- TOC entry 3283 (class 2604 OID 18020)
-- Name: quizApp_quiz id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_quiz" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_quiz_id_seq"'::regclass);


--
-- TOC entry 3284 (class 2604 OID 18029)
-- Name: quizApp_score id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_score" ALTER COLUMN id SET DEFAULT nextval('public."quizApp_score_id_seq"'::regclass);


--
-- TOC entry 3571 (class 0 OID 17444)
-- Dependencies: 237
-- Data for Name: Discussions_discussions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Discussions_discussions" (id, doubts_id) FROM stdin;
\.


--
-- TOC entry 3567 (class 0 OID 17426)
-- Dependencies: 233
-- Data for Name: Discussions_doubt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Discussions_doubt" (id, heading, statement, creator_id) FROM stdin;
1	hjkasdkjasdnasndkasbdkj	nasjkndanldnaskldandlkasndlkasd	6
2	What is today's date?	I lost my calendar.	2
3	Who created Java?	Shouldn't the answer be Oracle??	2
4	Why we need CSS?	If we can do styling in HTML, then why do need CSS? Can somebody please explain!	8
5	Servlet vs JSP	What was the need of JSP when we already had the servlet technology?	2
\.


--
-- TOC entry 3569 (class 0 OID 17435)
-- Dependencies: 235
-- Data for Name: Discussions_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Discussions_reply" (id, statement, creator_id, doubt_id, "trustedCreator_id") FROM stdin;
5	asndjansdjkasnbsdasdasdasd	6	1	\N
6	Dear Manav,\r\n\r\nTry doing nklasndjklnaskldnasdkalsndlkasndkl	2	1	\N
7	Yes Shrey,\r\nYou are correct!	\N	1	2
8	Good Question!	\N	1	2
9	Yep, I know that very well.	2	1	\N
10	Check your phone!	\N	2	2
11	asdasdsd	2	1	\N
12	Yep, you're all correct!	\N	2	5
13	Please reply as soon as possible!	2	3	\N
14	Dear Shrey,\r\nThe Java language is currently being owned by Oracle. Whereas, it was created by Sun Microsystems in 1991.\r\n\r\nHope this helps!	\N	3	5
15	Yep! Thanks!	4	3	\N
16	Okay!!	4	3	\N
17	aldasdnalskdadsa	2	3	\N
18	Dear Raj, consider a long file of code which contains more than thousand lines. How will update the styling if want to? With a lot of efforts right? Now consider a scenario when you have a seperate file for only styling, that is CSS. Then don't you think it can reduce your programming efforts? That's why we use CSS.	\N	4	5
19	Yep! Correct @Adam Smith	\N	4	2
20	CSS stands for Cascading Style Sheets.	2	4	\N
21	dbaljdbnlasndlasnklnld!!!	\N	1	1
22	Dear Shrey, JSP reduces the need to write the "print" statements. In other words, instead of coding HTML in Servlet, you can code logic that is servlet, in HTML. That's better, isn't it?	\N	5	1
\.


--
-- TOC entry 3563 (class 0 OID 17093)
-- Dependencies: 229
-- Data for Name: User_organizer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User_organizer" (id, name, password, email, "profilePic", institution, dob, "isNewsletterSubscribed", "totalQuizzesOrganized") FROM stdin;
2	Shruti Patel	456	shruti2003@gmail.com	images/users/shruti2003gmail.com.png	DDIT	2003-03-29	t	0
1	Quizzio Official	1234	quizzioofficial@gmail.com	images/users/quizzioofficialgmail.com.png	Quizzio	2022-03-09	t	0
4	manav	123	msmistry07@gmail.com		DDIT	2021-08-11	t	0
5	Adam Smith	789	adamsmith@google.com	images/users/adamsmithgoogle.com.png	Duke University	2022-03-01	t	0
\.


--
-- TOC entry 3565 (class 0 OID 17102)
-- Dependencies: 231
-- Data for Name: User_student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User_student" (id, name, password, email, "profilePic", institution, dob, "isNewsletterSubscribed", rating, "totalQuizzesGiven", "totalCorrectAnswers", "totalWrongAnswers") FROM stdin;
4	Vedant Parikh	456	ved@hotmail.com	images/users/vedhotmail.com.png	DDIT	2003-07-26	t	11	0	0	0
6	Manav Mistry	456	manav07@gmail.com	images/users/manav07gmail.com_Six0Ygl.png	Dharmsinh Desai University, Nadiad	2002-09-07	t	8	0	0	0
8	Raj Desai	456	raj@desai.com	images/users/rajdesai.com.png	MIT	1995-05-11	t	2	0	0	0
2	Shrey Ketan Naik	1234	shrey23@gmail.com	images/users/shrey23gmail.com.png	Dharmsinh Desai University, Nadiad	2002-08-23	t	15	0	0	0
7	User	789	user@google.com	images/users/usergoogle.com.png	MIT	2022-03-03	t	0	0	0	0
\.


--
-- TOC entry 3550 (class 0 OID 16918)
-- Dependencies: 216
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3552 (class 0 OID 16927)
-- Dependencies: 218
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3548 (class 0 OID 16911)
-- Dependencies: 214
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add user	8	add_user
30	Can change user	8	change_user
31	Can delete user	8	delete_user
32	Can view user	8	view_user
33	Can add organizer	9	add_organizer
34	Can change organizer	9	change_organizer
35	Can delete organizer	9	delete_organizer
36	Can view organizer	9	view_organizer
37	Can add student	10	add_student
38	Can change student	10	change_student
39	Can delete student	10	delete_student
40	Can view student	10	view_student
41	Can add reply	11	add_reply
42	Can change reply	11	change_reply
43	Can delete reply	11	delete_reply
44	Can view reply	11	view_reply
45	Can add discussions	12	add_discussions
46	Can change discussions	12	change_discussions
47	Can delete discussions	12	delete_discussions
48	Can view discussions	12	view_discussions
49	Can add doubt	13	add_doubt
50	Can change doubt	13	change_doubt
51	Can delete doubt	13	delete_doubt
52	Can view doubt	13	view_doubt
53	Can add question	14	add_question
54	Can change question	14	change_question
55	Can delete question	14	delete_question
56	Can view question	14	view_question
57	Can add quiz	15	add_quiz
58	Can change quiz	15	change_quiz
59	Can delete quiz	15	delete_quiz
60	Can view quiz	15	view_quiz
61	Can add option	16	add_option
62	Can change option	16	change_option
63	Can delete option	16	delete_option
64	Can view option	16	view_option
65	Can add correct options	17	add_correctoptions
66	Can change correct options	17	change_correctoptions
67	Can delete correct options	17	delete_correctoptions
68	Can view correct options	17	view_correctoptions
69	Can add attempted opt	18	add_attemptedopt
70	Can change attempted opt	18	change_attemptedopt
71	Can delete attempted opt	18	delete_attemptedopt
72	Can view attempted opt	18	view_attemptedopt
73	Can add score	19	add_score
74	Can change score	19	change_score
75	Can delete score	19	delete_score
76	Can view score	19	view_score
77	Can add attempted que	20	add_attemptedque
78	Can change attempted que	20	change_attemptedque
79	Can delete attempted que	20	delete_attemptedque
80	Can view attempted que	20	view_attemptedque
\.


--
-- TOC entry 3554 (class 0 OID 16934)
-- Dependencies: 220
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$ZEHgRJxCHYXYwWxuPolxsx$C2b0WGBLvD702dAR1DHdpdsv3AkpAtGTz72dT8vcVNw=	2022-04-07 17:09:45.251818+05:30	t	shreynaik			shrey23@gmail.com	t	t	2022-02-25 17:52:42.642882+05:30
\.


--
-- TOC entry 3556 (class 0 OID 16943)
-- Dependencies: 222
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3558 (class 0 OID 16950)
-- Dependencies: 224
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3560 (class 0 OID 17009)
-- Dependencies: 226
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-25 17:53:28.694056+05:30	1	User object (1)	1	[{"added": {}}]	7	1
2	2022-02-25 17:54:12.394599+05:30	2	User object (2)	1	[{"added": {}}]	7	1
3	2022-03-09 00:02:55.099856+05:30	1	Student object (1)	3		10	1
4	2022-03-09 19:13:18.086893+05:30	3	Student object (3)	3		10	1
5	2022-03-09 19:21:37.643174+05:30	5	Student object (5)	3		10	1
6	2022-03-11 14:55:26.270943+05:30	6	Student object (6)	2	[{"changed": {"fields": ["ProfilePic"]}}]	10	1
7	2022-03-11 18:20:04.193522+05:30	3	Reply object (3)	3		11	1
8	2022-03-12 14:20:00.023944+05:30	7	Option object (7)	3		16	1
9	2022-03-12 14:20:03.328561+05:30	8	Option object (8)	3		16	1
10	2022-03-12 14:20:06.075319+05:30	9	Option object (9)	3		16	1
11	2022-03-12 14:20:08.600205+05:30	6	Option object (6)	3		16	1
12	2022-03-12 15:19:46.995153+05:30	9	CorrectOptions object (9)	3		17	1
13	2022-03-12 15:19:54.513734+05:30	32	Option object (32)	3		16	1
14	2022-03-12 15:19:54.516735+05:30	31	Option object (31)	3		16	1
15	2022-03-12 15:19:54.517775+05:30	30	Option object (30)	3		16	1
16	2022-03-12 15:19:54.517775+05:30	29	Option object (29)	3		16	1
17	2022-03-12 15:19:54.518731+05:30	28	Option object (28)	3		16	1
18	2022-03-12 15:19:54.519733+05:30	27	Option object (27)	3		16	1
19	2022-03-12 15:19:54.520744+05:30	26	Option object (26)	3		16	1
20	2022-03-12 15:19:54.52176+05:30	25	Option object (25)	3		16	1
21	2022-03-12 15:19:54.52176+05:30	24	Option object (24)	3		16	1
22	2022-03-12 15:19:54.522821+05:30	23	Option object (23)	3		16	1
23	2022-03-12 15:19:54.523829+05:30	22	Option object (22)	3		16	1
24	2022-03-12 15:19:54.523829+05:30	21	Option object (21)	3		16	1
25	2022-03-12 15:19:54.524831+05:30	20	Option object (20)	3		16	1
26	2022-03-12 15:19:54.525828+05:30	19	Option object (19)	3		16	1
27	2022-03-12 15:19:54.526829+05:30	18	Option object (18)	3		16	1
28	2022-03-12 15:19:54.526829+05:30	17	Option object (17)	3		16	1
29	2022-03-12 15:19:54.527832+05:30	16	Option object (16)	3		16	1
30	2022-03-12 15:19:54.528832+05:30	15	Option object (15)	3		16	1
31	2022-03-12 15:19:54.529863+05:30	14	Option object (14)	3		16	1
32	2022-03-12 15:19:54.530831+05:30	13	Option object (13)	3		16	1
33	2022-03-12 15:19:54.531829+05:30	12	Option object (12)	3		16	1
34	2022-03-12 15:19:54.531829+05:30	11	Option object (11)	3		16	1
35	2022-03-12 15:19:54.532983+05:30	10	Option object (10)	3		16	1
36	2022-03-12 15:20:00.899831+05:30	10	Question object (10)	3		14	1
37	2022-03-12 15:20:00.90196+05:30	9	Question object (9)	3		14	1
38	2022-03-12 15:20:00.902835+05:30	8	Question object (8)	3		14	1
39	2022-03-12 15:20:00.903832+05:30	7	Question object (7)	3		14	1
40	2022-03-12 15:20:00.904832+05:30	6	Question object (6)	3		14	1
41	2022-03-12 15:20:00.905832+05:30	5	Question object (5)	3		14	1
42	2022-03-12 15:20:00.906835+05:30	4	Question object (4)	3		14	1
43	2022-03-12 15:20:00.907832+05:30	3	Question object (3)	3		14	1
44	2022-03-12 15:20:00.908834+05:30	2	Question object (2)	3		14	1
45	2022-03-12 15:20:00.908834+05:30	1	Question object (1)	3		14	1
46	2022-03-12 15:20:44.019815+05:30	2	Quiz object (2)	3		15	1
47	2022-03-12 15:20:44.022818+05:30	1	Quiz object (1)	3		15	1
48	2022-03-12 23:10:18.514998+05:30	4	Quiz object (4)	3		15	1
49	2022-03-13 00:00:53.380246+05:30	15	Question object (15)	3		14	1
50	2022-03-13 12:56:14.280157+05:30	7	Quiz object (7)	2	[{"changed": {"fields": ["CreationTime"]}}]	15	1
51	2022-03-13 15:25:56.756049+05:30	6	Quiz object (6)	2	[{"changed": {"fields": ["CreationTime"]}}]	15	1
52	2022-03-13 22:06:35.772727+05:30	1	Score object (1)	3		19	1
53	2022-03-13 22:09:31.543471+05:30	4	AttemptedQue object (4)	3		20	1
54	2022-03-13 22:09:37.841341+05:30	2	Score object (2)	3		19	1
55	2022-03-13 22:15:11.67804+05:30	3	Score object (3)	3		19	1
56	2022-03-13 22:16:53.301244+05:30	5	Score object (5)	3		19	1
57	2022-03-13 22:16:58.443682+05:30	4	Score object (4)	3		19	1
58	2022-03-13 22:25:35.610159+05:30	10	Score object (10)	3		19	1
59	2022-03-13 22:25:38.987271+05:30	9	Score object (9)	3		19	1
60	2022-03-13 22:25:42.854798+05:30	8	Score object (8)	3		19	1
61	2022-03-13 22:25:46.35236+05:30	7	Score object (7)	3		19	1
62	2022-03-13 22:25:50.493092+05:30	6	Score object (6)	3		19	1
63	2022-03-13 22:31:04.407953+05:30	13	Score object (13)	3		19	1
64	2022-03-13 22:31:10.99659+05:30	12	Score object (12)	3		19	1
65	2022-03-13 22:31:11.001592+05:30	11	Score object (11)	3		19	1
66	2022-03-13 22:33:39.08702+05:30	15	Score object (15)	3		19	1
67	2022-03-13 23:12:29.929904+05:30	14	Score object (14)	3		19	1
68	2022-03-13 23:12:43.684681+05:30	22	AttemptedQue object (22)	3		20	1
69	2022-03-13 23:12:43.687752+05:30	21	AttemptedQue object (21)	3		20	1
70	2022-03-13 23:12:58.832378+05:30	20	AttemptedOpt object (20)	3		18	1
71	2022-03-13 23:12:58.836163+05:30	19	AttemptedOpt object (19)	3		18	1
72	2022-03-13 23:12:58.837172+05:30	18	AttemptedOpt object (18)	3		18	1
73	2022-03-13 23:12:58.837172+05:30	17	AttemptedOpt object (17)	3		18	1
74	2022-03-13 23:12:58.838172+05:30	16	AttemptedOpt object (16)	3		18	1
75	2022-03-13 23:12:58.839172+05:30	15	AttemptedOpt object (15)	3		18	1
76	2022-03-13 23:12:58.846178+05:30	14	AttemptedOpt object (14)	3		18	1
77	2022-03-13 23:12:58.847476+05:30	13	AttemptedOpt object (13)	3		18	1
78	2022-03-13 23:12:58.847476+05:30	12	AttemptedOpt object (12)	3		18	1
79	2022-03-13 23:12:58.848522+05:30	11	AttemptedOpt object (11)	3		18	1
80	2022-03-13 23:12:58.849489+05:30	10	AttemptedOpt object (10)	3		18	1
81	2022-03-13 23:12:58.850487+05:30	9	AttemptedOpt object (9)	3		18	1
82	2022-03-13 23:12:58.851487+05:30	8	AttemptedOpt object (8)	3		18	1
83	2022-03-13 23:12:58.851487+05:30	7	AttemptedOpt object (7)	3		18	1
84	2022-03-13 23:12:58.853488+05:30	6	AttemptedOpt object (6)	3		18	1
85	2022-03-13 23:12:58.854487+05:30	5	AttemptedOpt object (5)	3		18	1
86	2022-03-13 23:12:58.855489+05:30	4	AttemptedOpt object (4)	3		18	1
87	2022-03-13 23:12:58.856486+05:30	3	AttemptedOpt object (3)	3		18	1
88	2022-03-13 23:12:58.857484+05:30	2	AttemptedOpt object (2)	3		18	1
89	2022-03-13 23:12:58.858485+05:30	1	AttemptedOpt object (1)	3		18	1
90	2022-03-13 23:13:08.086493+05:30	16	Score object (16)	3		19	1
91	2022-03-14 00:25:22.639191+05:30	3	Score object (3)	3		19	1
92	2022-03-14 00:25:22.643191+05:30	2	Score object (2)	3		19	1
93	2022-03-14 00:25:22.64419+05:30	1	Score object (1)	3		19	1
94	2022-03-14 00:40:47.63569+05:30	4	Score object (4)	3		19	1
95	2022-03-31 11:44:48.166862+05:30	14	Quiz object (14)	3		15	1
96	2022-03-31 12:32:52.496001+05:30	20	Score object (20)	3		19	1
97	2022-04-01 00:16:50.527162+05:30	24	Score object (24)	3		19	1
98	2022-04-01 00:18:14.361238+05:30	25	Score object (25)	3		19	1
99	2022-04-01 00:19:52.920363+05:30	26	Score object (26)	3		19	1
100	2022-04-01 00:21:21.872204+05:30	27	Score object (27)	3		19	1
101	2022-04-01 00:23:24.130534+05:30	28	Score object (28)	3		19	1
102	2022-04-01 00:38:36.861946+05:30	29	Score object (29)	3		19	1
103	2022-04-01 00:41:07.361609+05:30	30	Score object (30)	3		19	1
104	2022-04-01 00:41:30.404149+05:30	31	Score object (31)	3		19	1
\.


--
-- TOC entry 3546 (class 0 OID 16902)
-- Dependencies: 212
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	quizApp	user
8	User	user
9	User	organizer
10	User	student
11	Discussions	reply
12	Discussions	discussions
13	Discussions	doubt
14	quizApp	question
15	quizApp	quiz
16	quizApp	option
17	quizApp	correctoptions
18	quizApp	attemptedopt
19	quizApp	score
20	quizApp	attemptedque
\.


--
-- TOC entry 3544 (class 0 OID 16893)
-- Dependencies: 210
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-25 17:32:43.546004+05:30
2	auth	0001_initial	2022-02-25 17:32:44.309825+05:30
3	admin	0001_initial	2022-02-25 17:32:44.440914+05:30
4	admin	0002_logentry_remove_auto_add	2022-02-25 17:32:44.447915+05:30
5	admin	0003_logentry_add_action_flag_choices	2022-02-25 17:32:44.454912+05:30
6	contenttypes	0002_remove_content_type_name	2022-02-25 17:32:44.523323+05:30
7	auth	0002_alter_permission_name_max_length	2022-02-25 17:32:44.531289+05:30
8	auth	0003_alter_user_email_max_length	2022-02-25 17:32:44.538289+05:30
9	auth	0004_alter_user_username_opts	2022-02-25 17:32:44.545307+05:30
10	auth	0005_alter_user_last_login_null	2022-02-25 17:32:44.552319+05:30
11	auth	0006_require_contenttypes_0002	2022-02-25 17:32:44.554332+05:30
12	auth	0007_alter_validators_add_error_messages	2022-02-25 17:32:44.560292+05:30
13	auth	0008_alter_user_username_max_length	2022-02-25 17:32:44.609952+05:30
14	auth	0009_alter_user_last_name_max_length	2022-02-25 17:32:44.617929+05:30
15	auth	0010_alter_group_name_max_length	2022-02-25 17:32:44.632931+05:30
16	auth	0011_update_proxy_permissions	2022-02-25 17:32:44.643653+05:30
17	auth	0012_alter_user_first_name_max_length	2022-02-25 17:32:44.650652+05:30
18	sessions	0001_initial	2022-02-25 17:32:44.953023+05:30
21	User	0001_initial	2022-03-08 23:06:01.361932+05:30
24	Discussions	0001_initial	2022-03-11 17:28:54.213631+05:30
25	Discussions	0002_alter_reply_creator_alter_reply_trusted_creator	2022-03-11 18:11:55.853356+05:30
26	Discussions	0003_alter_reply_creator_alter_reply_trusted_creator	2022-03-11 18:14:06.906026+05:30
27	Discussions	0004_alter_reply_creator_alter_reply_trusted_creator	2022-03-11 18:14:06.926724+05:30
28	Discussions	0005_alter_reply_creator_alter_reply_trusted_creator	2022-03-11 18:15:15.306164+05:30
29	Discussions	0006_alter_reply_creator_alter_reply_trusted_creator	2022-03-11 18:20:24.542206+05:30
30	Discussions	0007_alter_reply_creator_alter_reply_trusted_creator	2022-03-11 18:21:14.774119+05:30
31	Discussions	0008_rename_trusted_creator_reply_trustedcreator	2022-03-11 18:47:14.216538+05:30
41	quizApp	0001_initial	2022-03-13 23:17:55.582318+05:30
42	quizApp	0002_alter_quiz_name_alter_quiz_subject	2022-03-14 12:59:10.175044+05:30
43	quizApp	0003_quiz_islocked_score_creationtime	2022-03-14 17:24:52.500542+05:30
44	quizApp	0004_quiz_quiztime	2022-03-31 11:31:07.261089+05:30
\.


--
-- TOC entry 3561 (class 0 OID 17038)
-- Dependencies: 227
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8u30ewsw9psbjwwpydfdtucvcsfhnl89	.eJxVjDEOAiEQRe9CbQgIOGBp7xkIzAyyaiBZdivj3XWTLbT9773_EjGtS43r4DlOJM5Ci8PvlhM-uG2A7qndusTelnnKclPkToe8duLnZXf_Dmoa9VsDpyOQcoWzIhMMKrCBtaXiOGgHxhMUQwo9Om0MZxeyBmSV00lb78X7A-krN9k:1nNZco:7rBw9RE1fimRgbVCrDyLn9w9ZynpVtRCIaKoG8kl5TY	2022-03-11 17:53:06.892629+05:30
nkkkel5ljq022ug90m67ohlrlocxviry	e30:1nRxaU:bhz_orC4zZOG8zDiYoE7T9MlLG601pxc4GL6vriBoAY	2022-03-23 20:16:50.9098+05:30
zxl87lmsoaepb41nz3s88ibjebgxx9nt	e30:1nRxdn:S66cI3iku9itdx81ALxCFXds96ijXagWQm0BJAvNpps	2022-03-23 20:20:15.366745+05:30
50l5psxkhi62dcdpt4xvrjmxryu2fi0q	e30:1nRxiq:oNn7SR3nBwePQ7XU5Ar8pCOHF9AnQ1LGRSASRgTeaVs	2022-03-23 20:25:28.255258+05:30
0y2z5f6vcace4tkouexfbpcgnw4g4ecm	eyJ1c2VyIjoic2hyZXkyM0BnbWFpbC5jb20ifQ:1nTkCO:f5TBnfJwEmHoQUt2XLk9EugwJg_d49z8-FDDaxSHsdA	2022-03-28 18:23:20.204777+05:30
0nrne9ckqattg2y8m1njywsrqg2of3yk	e30:1nTkFK:o-ameJ12qJj4IwQNRb7z-lmdn3etu6x0GXVQ1Y4CW3E	2022-03-28 18:26:22.365623+05:30
7xy51ljjya6kx5jlbnypv7x04hi7pmn1	eyJ1c2VyIjoibXNtaXN0cnkwN0BnbWFpbC5jb20ifQ:1nTLpQ:XWfU4TpPGiQ0XiyuWTlWrvFd4KCDpQrymPSg9z0O0iE	2022-03-27 16:22:00.090762+05:30
lp61u4yi4n4k5d0dvx3sr7ojkbkc922w	e30:1nSI4j:PqyhYDsaW5IVgRYQL1EjGmiLG9KmkJKWtMMkWGiA2Tk	2022-03-24 18:09:25.068498+05:30
33eb2azui6gcqghukgw6ghx7ipacl94f	.eJxVjsEOwiAQRP-FsyHQLQKejHe_oVnYbUFrm5T2ZPx3adKDXufNvMxbdLitqdsKL10mcRFanH6zgPHJ0w7ogdMwyzhP65KD3CvyoEXeZ-LxdnT_BAlLqmvL2FhSpuegCDxEZVvPuqXesNfGgiPbA6nootEAHIwP2kZWAc-6da5Kd101lbRsa26UguvwwjzWRy_x-QIFgkGh:1nTNdz:6P6g5w4sjQe15Pa9-y83UsyNjQhDblc-fpaZtRENt7Q	2022-03-27 18:18:19.373987+05:30
2mfflix7n041tr5n0gml9o26mcty8cmm	eyJ1c2VyIjoic2hyZXkyM0BnbWFpbC5jb20ifQ:1nTnmX:vi2_MFso5w0PoC2i4u7QaL9HNQdpxvbH-a8f3bxkTXg	2022-03-28 22:12:53.640981+05:30
s2d5etn0w41wzobxmtcukhnueoy1n251	.eJxVjEEOgyAQRe_CuiHgSIGumu57BjMwo9iqJKKLpundq4kbt_-9979iLTyLmyhp5k8F927EfpAxj-IiGlyX1OxC09Pm6PMWML552gG9cOryVk3L3Ae5K_KgRT4z8fA43NNBwpK22jJWlpRpOSgCD1HZ2rOuqTXstbHgyLZAKrpoNAAH44O2kVXAq66dE78_Z15AzQ:1nTOVa:Aus-gXo_myhZYVL7YMl-fzpx4D6EiwWK13FhSaCxsOQ	2022-03-27 19:13:42.684539+05:30
8qcd1vqz2wesnb21247bo4zetwy4ao6x	.eJxVjskKwjAYhN8lZwmJaUziSbz7DOXfauvSQBdwwXc3hR70Ot_Mx7xVDfPU1vMoQ92x2iurNr8ZAl2lXwBfoD9nTbmfhg71UtErHfUps9yOa_dP0MLYlnUQ2AY2vhE07JIjE6oktuLGS7I-uMihcWwokrfOCfqENpAYhJ2tYizSRVdMgHR4PF_lyF19vsQ1PsQ:1nRqIP:8HNKBKXBgkc6J1dqhH1OBGrYOKDpmXUsy9EtX64bpdo	2022-03-23 12:29:41.466341+05:30
6p1tbqjowe4y3i7bxvckdc6ihig8gmr0	eyJ1c2VyIjoic2hyZXkyM0BnbWFpbC5jb20ifQ:1nZvAH:aj176yZGamneqCPlVqlzd-4-DVOHfPdEiz9aG6qHjYg	2022-04-14 19:18:41.905478+05:30
r6c170l6pfjkwe1i7d86tfo5top2mp6i	e30:1nTqK5:NF0gxfYtMwOyMNT4sdvGydQybhO7u0882Qg40CkgJtA	2022-03-29 00:55:41.013677+05:30
n4puy6myxd17xc1dtqm78o4w6svovqdi	eyJ1c2VyIjoic2hyZXkyM0BnbWFpbC5jb20ifQ:1nZvDg:PQvYal1MlUWOEHywqpqtjj9c8jANydA6KvuIuB6XumI	2022-04-14 19:22:12.233513+05:30
f9tt27nf24679b1lp7a1lctrwwn76mkh	.eJxVj00OgjAQhe_StSGtpRZcGfeuPACZdgaoSjFQTAzh7g6GhS7fz3x5M4sKptRW00hDFVAchRK7X8-Bv1NcA7xBbPrM9zENwWVrJdvSMbv0SI_z1v0DtDC2fG0J9halqclJ1KX20uYlqRxrQ6UyVhdoa43SF94orcmZ0inrSTo4qLwoGLrixHEW1EF4MLKDCC9pT82qeVfHnfR-EkfXNCHFxEYYv1tYBA-J-JE0TLQsH-DyUtQ:1nRoKd:2IajKmfoWUEJmad8NlQTpH6aRVvOfRy33O8dmpi4K_M	2022-03-23 10:23:51.311834+05:30
greklyhcpzuw95pqggo1j9i5bd3jze9l	.eJxVjsEOwiAQRP-FsyHQLQKejHe_oVnYbUFrm5T2ZPx3adKDXufNvMxbdLitqdsKL10mcRFanH6zgPHJ0w7ogdMwyzhP65KD3CvyoEXeZ-LxdnT_BAlLqmvL2FhSpuegCDxEZVvPuqXesNfGgiPbA6nootEAHIwP2kZWAc-6da5Kd101lbRsa26UguvwwjzWRy_x-QIFgkGh:1nSiOY:5ZOkpjvdTbo99nlquZK7OA2MUxKKh7kN37B7Ta3ykOQ	2022-03-25 22:15:38.387577+05:30
rowsg5mtqtv7h8lvhq9oa9u1t4g2a02r	.eJxVjssOwiAURP-FtSEgRcCV6d5vaC7cS4u2JfaxqfHfpUkXup0zczJv1sC6dM0609QkZFcm2ek38xCeNO4AHzC2mYc8LlPyfK_wg878npH6-uj-CTqYu7I2BGeDQkfyApVTQZjKkawwanJSG2XRRIUi2KClUuS189IEEh4usrK2SHddMb3WtG0p5xhTSNDf2gFSX24N7PMFaORElQ:1nRx2L:0OCO8BQh3r-lL34B5MhJfkPPKzFj-HQfcmBgY63oKU8	2022-03-23 19:41:33.091767+05:30
v9amlsdvtih1pslliseih7o0tr4a47xs	.eJxVjskKwjAYhN8lZwmJaUziSbz7DOXfauvSQBdwwXc3hR70Ot_Mx7xVDfPU1vMoQ92x2iurNr8ZAl2lXwBfoD9nTbmfhg71UtErHfUps9yOa_dP0MLYlnUQ2AY2vhE07JIjE6oktuLGS7I-uMihcWwokrfOCfqENpAYhJ2tYizSRVdMgHR4PF_lyF19vsQ1PsQ:1nRx7G:TVKek4YL1GLO0lBHnIbjI4TPilYvmUXkHveclNq-tFw	2022-03-23 19:46:38.12019+05:30
k14yvbdfzq2n5rovw2k9jwhiww6amv3p	eyJ1c2VyIjoiYWJjQHh5ei5jb20ifQ:1nRx8M:OnP_cu9oLTWcSeZXKP7rhcDct3oSxS6pRLg_ARH9AHY	2022-03-23 19:47:46.646953+05:30
jou3ujza2gb5am6wiajaj07zjdo0ipfi	.eJxVjsEOwiAQRP-FsyHQLQKejHe_oVnYbUFrm5T2ZPx3adKDXufNvMxbdLitqdsKL10mcRFanH6zgPHJ0w7ogdMwyzhP65KD3CvyoEXeZ-LxdnT_BAlLqmvL2FhSpuegCDxEZVvPuqXesNfGgiPbA6nootEAHIwP2kZWAc-6da5Kd101lbRsa26UguvwwjzWRy_x-QIFgkGh:1nStP2:77dKykqG6nm9lxrvNt5rwfHtkiXBasBF6PnC6TOCb-Q	2022-03-26 10:00:52.650783+05:30
w4dx3sy8zuf8zfkdm9cu7fzajquxzkzg	.eJxVjs0OwiAQhN-FsyHQLQKejHefoVnYban2JyntwRjfXZr0oNf5Zr7MWzS4ranZMi9NT-IitDj9ZgHjk6cd0AOnbpZxntalD3KvyINmeZ-Jh9vR_RMkzKmsLWNlSZmWgyLwEJWtPeuaWsNeGwuObAukootGA3AwPmgbWQU869q5It11xZTTwq8Krt2I_VDujOLzBUOaQM0:1nV6DV:wuYOgiHGhGKL1EUWGH9n4ix5bahUyftQ92hI3GFcuqI	2022-04-01 12:06:05.969837+05:30
q4sopijwhhcz9fuigdtfdhz86tip8top	.eJxVjMsOgyAQRf-FdUPAkQJdNe77DWZgRqH1kYiumv57NXHj9p5z7ldshRfxECUt25orpeDZj5gHGedR3ESL25raw2kz7Zq-bgHjh6cD0Bunft6raV1ykIciT1rkayYemtO9HCQsaa8tY2VJmY6DIvAQla0965o6w14bC45sB6Sii0YDcDA-aBtZBbzr2jnx-wMQ6kGh:1nT5QL:zQzkGjQKBOJ97P-rUunaUHaws5DJU58w-tXZOxky0IU	2022-03-26 22:51:01.154529+05:30
b7qeehi9wh7l1m3b7i05kvuv5nn0b5ew	eyJ1c2VyIjoibXNtaXN0cnkwN0BnbWFpbC5jb20ifQ:1nT6l1:93rZb89AgzU2Wdfc7x-pUI4gPKlO_UrQWG-TowOkSFY	2022-03-27 00:16:27.374475+05:30
njdnb0nxkfh6ds7txzoaqk0co2suhqc1	.eJxVjDEOAiEQRe9CbQgIOGBp7xkIzAyyaiBZdivj3XWTLbT9773_EjGtS43r4DlOJM5Ci8PvlhM-uG2A7qndusTelnnKclPkToe8duLnZXf_Dmoa9VsDpyOQcoWzIhMMKrCBtaXiOGgHxhMUQwo9Om0MZxeyBmSV00lb78X7A-krN9k:1nTU9H:i9FMeaYBjD6n4aaTfV4a9biy59mSUVc-0KhgylC0KiY	2022-03-28 01:15:03.179165+05:30
60xhsxg1huq85l7a86q4ppct9egp9s91	e30:1naEyG:-ShmeDoXnXjw-lifbOPTanZMJj2jpsD1CyKYZJrdso4	2022-04-15 16:27:36.884915+05:30
denqo2hgg9i919xbous2xb3awwo682s7	.eJxVjssOwiAURP-FtSEgRcCV6d5vaC7cS4u2JfaxqfHfpUkXup0zczJv1sC6dM0609QkZFcm2ek38xCeNO4AHzC2mYc8LlPyfK_wg878npH6-uj-CTqYu7I2BGeDQkfyApVTQZjKkawwanJSG2XRRIUi2KClUuS189IEEh4usrK2SHddMb3WtG0p5xhTSNDf2gFSX24N7PMFaORElQ:1nZpDF:RwcGdqJ2kSaMtA_-u_UiSgXpv6ywhX7covfeSCMVtJY	2022-04-14 12:57:21.512704+05:30
afziotnzvybwqnhrwd779bylbqxb84ru	.eJxVjMsOgyAQRf-FdUPAkQJdNe77DWZgRqH1kYiumv57NXHj9p5z7ldshRfxECUt25orpeDZj5gHGedR3ESL25raw2kz7Zq-bgHjh6cD0Bunft6raV1ykIciT1rkayYemtO9HCQsaa8tY2VJmY6DIvAQla0965o6w14bC45sB6Sii0YDcDA-aBtZBbzr2jnx-wMQ6kGh:1nTGtl:-0noOgwLNAzq-PCFBiQgFe2aqrFQngfMrDhDu3I9Ly4	2022-03-27 11:06:09.706722+05:30
pmvhb3sbj2efsqsviyq5eyrgnc88j1cl	e30:1nTg8J:SXSzngIj-wN7Nj5Im29Sc2FAWc9rfU3tTlUVP5sLuZ0	2022-03-28 14:02:51.180999+05:30
lcz1wy2013y9f7nzkm448a0v5stfk7vg	e30:1naF0y:nP5Ep9sBEhEXPPJjs8WqBkT1-YmXgGWHY87oF5Mbm6Q	2022-04-15 16:30:24.218852+05:30
tea4p29rcvuuh6osl4rv22aqq0885bsw	eyJ1c2VyIjoic2hyZXkyM0BnbWFpbC5jb20ifQ:1naH93:mkTS8XCnLSbt75HKUKpKTOqBwPW2D2zbu38tSOB-XbE	2022-04-15 18:46:53.621056+05:30
qf3kpoxw6w4aou3pvnx27v8abkyzjmyn	.eJxVjMEOwiAQBf-FsyEgRcCT8e43kIXdlmoLSWlPxn-XJr30-mbmfdlWaWF3Bghzncc1PYZShol4LDO7MA_bmvzu-BGbJs9bgPihvAN8Qx5Kq_K6jIHvCj9o5a-CND0P93SQoKZWG4KrQaF7CgKVU1GYzpHssNfkpDbKoukVimijlkpR0C5IE0kEuMnOWvb7A574Qmg:1nTjcd:omTMIYAjaGBByYJp5-MLiihuKiFhrMK4Zvpd3T-qYO0	2022-03-28 17:46:23.311117+05:30
xfcbfz0k5jsh35j45s3p5n8bpzrfvu7i	.eJxVjssOwiAURP-FtSEgRcCV6d5vaC7cS4u2JfaxqfHfpUkXup0zczJv1sC6dM0609QkZFcm2ek38xCeNO4AHzC2mYc8LlPyfK_wg878npH6-uj-CTqYu7I2BGeDQkfyApVTQZjKkawwanJSG2XRRIUi2KClUuS189IEEh4usrK2SHddMb3WtG0p5xhTSNDf2gFSX24N7PMFaORElQ:1nZssQ:ejJU5SGnIvZB3U_y1P_5AIAqEAgmFoXNBJ4PbLDQOdM	2022-04-14 16:52:06.71964+05:30
x3zocn0aj0zleycsy1h0tfsazm90r0di	.eJxVjDEOAiEQRe9CbQgIOGBp7xkIzAyyaiBZdivj3XWTLbT9773_EjGtS43r4DlOJM5Ci8PvlhM-uG2A7qndusTelnnKclPkToe8duLnZXf_Dmoa9VsDpyOQcoWzIhMMKrCBtaXiOGgHxhMUQwo9Om0MZxeyBmSV00lb78X7A-krN9k:1na0DT:muIjeLeN2A_Vh8_6QIuN3Lta7QMqCpDVF5NkcVbDUvw	2022-04-15 00:42:19.684031+05:30
95toztm4qgq8614xhnz1s69t739ut8po	.eJxVjDEOAiEQRe9CbQgIOGBp7xkIzAyyaiBZdivj3XWTLbT9773_EjGtS43r4DlOJM5Ci8PvlhM-uG2A7qndusTelnnKclPkToe8duLnZXf_Dmoa9VsDpyOQcoWzIhMMKrCBtaXiOGgHxhMUQwo9Om0MZxeyBmSV00lb78X7A-krN9k:1naUfy:VJyzMZPQmmPqR8C_C2DvgwhGwv_r_5B45rGCACWZ1Us	2022-04-16 09:13:46.150718+05:30
dojjfj679wveoo9l67wbau6yorzxinod	.eJxVjssOwiAURP-FtSEgRcCV6d5vaC7cS4u2JfaxqfHfpUkXup0zczJv1sC6dM0609QkZFcm2ek38xCeNO4AHzC2mYc8LlPyfK_wg878npH6-uj-CTqYu7I2BGeDQkfyApVTQZjKkawwanJSG2XRRIUi2KClUuS189IEEh4usrK2SHddMb3WtG0p5xhTSNDf2gFSX24N7PMFaORElQ:1ncTUj:I7HvSMEOvx1sEERpjYRSEVudmGesVnW8bRSOvYzVN50	2022-04-21 20:22:21.884532+05:30
\.


--
-- TOC entry 3585 (class 0 OID 18065)
-- Dependencies: 251
-- Data for Name: quizApp_attemptedopt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_attemptedopt" (id, "isCorrect", "optionId_id", "questionId_id", score_id) FROM stdin;
31	f	28	7	13
32	t	32	8	14
33	t	33	8	14
34	t	32	8	15
35	t	32	8	16
36	t	33	8	16
37	f	35	9	17
38	t	36	9	18
39	t	39	10	21
40	t	41	11	22
41	f	45	12	22
42	t	51	13	22
43	t	53	14	22
44	t	55	14	22
45	t	56	14	22
46	t	57	14	22
47	t	59	15	22
48	t	60	15	22
49	t	62	15	22
61	t	41	11	32
62	f	47	12	32
63	t	51	13	32
64	t	53	14	32
65	f	54	14	32
66	t	57	14	32
67	t	59	15	32
68	t	60	15	32
69	t	62	15	32
70	t	39	10	33
73	f	30	7	36
74	f	34	9	37
75	t	32	8	38
76	t	41	11	39
77	t	46	12	39
78	t	51	13	39
79	t	53	14	39
80	t	55	14	39
81	t	56	14	39
82	t	57	14	39
83	t	59	15	39
84	t	60	15	39
85	t	62	15	39
86	f	63	15	39
\.


--
-- TOC entry 3583 (class 0 OID 18058)
-- Dependencies: 249
-- Data for Name: quizApp_attemptedque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_attemptedque" (id, marks, "questionId_id", "scoreId_id") FROM stdin;
79	2	10	33
82	0	7	36
83	0	9	37
84	0	8	38
85	1	11	39
86	2	12	39
87	1	13	39
88	3	14	39
89	0	15	39
90	0	10	19
91	0	10	19
92	0	10	19
93	0	10	19
94	0	11	22
95	0	12	22
96	0	13	22
97	0	14	22
98	0	15	22
35	0	7	13
36	1	8	14
37	0	8	15
38	1	8	16
39	0	9	17
40	2	9	18
41	0	10	19
43	2	10	21
44	1	11	22
45	0	12	22
46	1	13	22
47	3	14	22
48	3	15	22
49	0	11	23
50	0	12	23
51	0	13	23
52	0	14	23
53	0	15	23
74	1	11	32
75	0	12	32
76	1	13	32
77	0	14	32
78	3	15	32
\.


--
-- TOC entry 3581 (class 0 OID 18051)
-- Dependencies: 247
-- Data for Name: quizApp_correctoptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_correctoptions" (id, "optionId_id", "questionId_id") FROM stdin;
11	29	7
12	32	8
13	33	8
14	36	9
15	39	10
16	41	11
17	46	12
18	51	13
19	53	14
20	55	14
21	56	14
22	57	14
23	59	15
24	60	15
25	62	15
\.


--
-- TOC entry 3579 (class 0 OID 18042)
-- Dependencies: 245
-- Data for Name: quizApp_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_option" (id, statement, "questionId_id") FROM stdin;
28	asndjkansdjknadjabjkdbdkjab ckjad asd	7
29	ad HABDjab JBAdjajdsnklN ASNKLD asd s	7
30	dasdasdnajcnajndsacjadjna dnwaod aosnd acklda	7
31	aadadasdasds	8
32	asdadasdasdsdsd	8
33	adadasdasdas	8
34	Emirates	9
35	Etihad	9
36	Kingfisher	9
37	Spice Jet	9
38	Object Rishtedari Mapping	10
39	Object Relational Mapping	10
40	ORacle Machine	10
41	@	11
42	#	11
43	!Annotation!	11
44	%	11
45	@RequestBody	12
46	@ResponseBody	12
47	@NoModelNoView	12
48	@RestController	12
49	@ResponseBody only (same as @ResponseBody)	13
50	@Response + @Component	13
51	@ResponseBody + @Controller	13
52	@Entity + @RequestMapping	13
53	Spring Framework can be used with Hibernate Framework	14
54	Spring is the same as Spring Boot	14
55	Jasper is used to translate jsp pages in a spring project	14
56	Spring framework is built on the principle of Dependency Injection	14
57	Spring MVC stands for Model View Controller	14
58	Spring does not provide security to your website	14
59	<dependency>Tomcat Server</dependency>	15
60	<dependency>Spring-Core</dependency>	15
61	<dependency>JPA</dependency>	15
62	<dependency>Spring-Context</dependency>	15
63	<dependency>Jasper</dependency>	15
64	<dependency>Jackson</dependency>	15
\.


--
-- TOC entry 3577 (class 0 OID 18033)
-- Dependencies: 243
-- Data for Name: quizApp_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_question" (id, marks, statement, solution, "quizId_id") FROM stdin;
7	2	abdjasdnaldnaklsdnlakndklanslknaldndkasdklandklasndlkasndkladnlkasndklandl	asdlnknaldlkasdnklandklasndklandan,sdlkandlkasndakndabalbfaofbdaoabfo[FDB[GFObf[bf[fbdosf	11
8	1	nnadjnasldandlnlkasndlkandlkasndadlasnk	Lorem ipsum	12
9	2	Which of the following comapines got banned recently?	Kingfisher. It's obvious!	13
10	2	What does ORM stand for?	ORM stands for Object Relational Mapping. It is a paradigm through which relational databases can be mapped to an object relational code.	15
11	1	Annotations in the spring framework are preceeded by a:	"@" is used to denote an annotation in the spring framework.	16
12	2	How to return String, int, etc. (base data types) instead of Models and Views in Spring Boot?	@ResponseBody annotation does this for you. That's why it can be used a lot in the AJAX programming and REST API services.	16
13	1	@RestController is a combination of:		16
14	3	Which of the following are correct regarding the spring framework?		16
15	3	Select appropriate dependencies for a spring project: (only the ones required for base spring project)		16
\.


--
-- TOC entry 3573 (class 0 OID 18017)
-- Dependencies: 239
-- Data for Name: quizApp_quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_quiz" (id, name, subject, marks, description, "quizPic", "creationTime", attempts, organizer_id, "isLocked", "quizTime") FROM stdin;
11	abdkbjkdabjksdbaskdk	adasdadasd	2	asdasdasdsad		2022-03-14 23:17:46+05:30	2	5	t	\N
13	Aeroplanes Trivia	Aerodynamics	2	A brainstorming quiz related to aircrafts!	images/quizzes/2021-5-2_18-40-16-838.BMP	2022-03-18 17:23:20+05:30	3	2	t	\N
12	asdadasd	sadasdas	1	asdadsasd	images/quizzes/Background.jpeg	2022-03-14 23:32:10+05:30	4	2	t	\N
15	HIbernate	Java | Hibernate | Java Core | ORM	2	Beginners! Get ready.	images/quizzes/eggs.jpg	2022-03-31 17:15:35+05:30	8	1	t	00:01:00
16	Spring Boot	Java | Spring | Java for web	10	Java Spring Framework Basics	images/quizzes/Java.png	2022-03-31 21:02:59+05:30	9	1	t	00:05:00
\.


--
-- TOC entry 3575 (class 0 OID 18026)
-- Dependencies: 241
-- Data for Name: quizApp_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."quizApp_score" (id, marks, "quizId_id", "studentId_id", "creationTime") FROM stdin;
32	5	16	4	2022-04-01 06:11:36+05:30
33	2	15	6	2022-04-01 21:49:35+05:30
36	0	11	6	2022-04-08 00:20:10+05:30
37	0	13	6	2022-04-08 00:21:03+05:30
38	0	12	6	2022-04-08 01:12:24+05:30
39	7	16	8	2022-04-08 01:14:44+05:30
19	0	15	2	2022-03-31 17:18:28+05:30
22	0	16	2	2022-03-31 21:46:33+05:30
13	0	11	2	2022-03-14 23:53:26+05:30
14	1	12	2	2022-03-15 03:43:08+05:30
15	0	12	4	2022-03-15 05:50:49+05:30
16	1	12	8	2022-03-18 17:13:15+05:30
17	0	13	2	2022-03-18 17:37:15+05:30
18	2	13	4	2022-03-31 16:09:34+05:30
21	2	15	4	2022-03-31 18:03:08+05:30
23	0	16	6	2022-04-01 00:35:30+05:30
\.


--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 236
-- Name: Discussions_discussions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Discussions_discussions_id_seq"', 1, false);


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 232
-- Name: Discussions_doubt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Discussions_doubt_id_seq"', 5, true);


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 234
-- Name: Discussions_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Discussions_reply_id_seq"', 22, true);


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 228
-- Name: User_organizer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_organizer_id_seq"', 5, true);


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 230
-- Name: User_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_student_id_seq"', 8, true);


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 104, true);


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 250
-- Name: quizApp_attemptedopt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_attemptedopt_id_seq"', 86, true);


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 248
-- Name: quizApp_attemptedque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_attemptedque_id_seq"', 98, true);


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 246
-- Name: quizApp_correctoptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_correctoptions_id_seq"', 26, true);


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 244
-- Name: quizApp_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_option_id_seq"', 69, true);


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 242
-- Name: quizApp_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_question_id_seq"', 16, true);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 238
-- Name: quizApp_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_quiz_id_seq"', 17, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 240
-- Name: quizApp_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."quizApp_score_id_seq"', 39, true);


--
-- TOC entry 3351 (class 2606 OID 17449)
-- Name: Discussions_discussions Discussions_discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_discussions"
    ADD CONSTRAINT "Discussions_discussions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3343 (class 2606 OID 17433)
-- Name: Discussions_doubt Discussions_doubt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_doubt"
    ADD CONSTRAINT "Discussions_doubt_pkey" PRIMARY KEY (id);


--
-- TOC entry 3347 (class 2606 OID 17442)
-- Name: Discussions_reply Discussions_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_reply"
    ADD CONSTRAINT "Discussions_reply_pkey" PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 17100)
-- Name: User_organizer User_organizer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_organizer"
    ADD CONSTRAINT "User_organizer_pkey" PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 17109)
-- Name: User_student User_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_student"
    ADD CONSTRAINT "User_student_pkey" PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 17036)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3308 (class 2606 OID 16966)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3311 (class 2606 OID 16932)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16923)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 16957)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3300 (class 2606 OID 16916)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16948)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 16981)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3313 (class 2606 OID 16939)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 16955)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 16995)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3316 (class 2606 OID 17031)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3331 (class 2606 OID 17017)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 16909)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3295 (class 2606 OID 16907)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 16900)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 17044)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3375 (class 2606 OID 18070)
-- Name: quizApp_attemptedopt quizApp_attemptedopt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedopt"
    ADD CONSTRAINT "quizApp_attemptedopt_pkey" PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 18063)
-- Name: quizApp_attemptedque quizApp_attemptedque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedque"
    ADD CONSTRAINT "quizApp_attemptedque_pkey" PRIMARY KEY (id);


--
-- TOC entry 3367 (class 2606 OID 18056)
-- Name: quizApp_correctoptions quizApp_correctoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_correctoptions"
    ADD CONSTRAINT "quizApp_correctoptions_pkey" PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 18049)
-- Name: quizApp_option quizApp_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_option"
    ADD CONSTRAINT "quizApp_option_pkey" PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 18040)
-- Name: quizApp_question quizApp_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_question"
    ADD CONSTRAINT "quizApp_question_pkey" PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 18024)
-- Name: quizApp_quiz quizApp_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_quiz"
    ADD CONSTRAINT "quizApp_quiz_pkey" PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 18031)
-- Name: quizApp_score quizApp_score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_score"
    ADD CONSTRAINT "quizApp_score_pkey" PRIMARY KEY (id);


--
-- TOC entry 3349 (class 1259 OID 17479)
-- Name: Discussions_discussions_doubts_id_9c676522; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Discussions_discussions_doubts_id_9c676522" ON public."Discussions_discussions" USING btree (doubts_id);


--
-- TOC entry 3341 (class 1259 OID 17455)
-- Name: Discussions_doubt_creator_id_6bdd69bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Discussions_doubt_creator_id_6bdd69bc" ON public."Discussions_doubt" USING btree (creator_id);


--
-- TOC entry 3344 (class 1259 OID 17471)
-- Name: Discussions_reply_creator_id_f57623ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Discussions_reply_creator_id_f57623ac" ON public."Discussions_reply" USING btree (creator_id);


--
-- TOC entry 3345 (class 1259 OID 17472)
-- Name: Discussions_reply_doubt_id_b7ca0e03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Discussions_reply_doubt_id_b7ca0e03" ON public."Discussions_reply" USING btree (doubt_id);


--
-- TOC entry 3348 (class 1259 OID 17473)
-- Name: Discussions_reply_trusted_creator_id_027abc55; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Discussions_reply_trusted_creator_id_027abc55" ON public."Discussions_reply" USING btree ("trustedCreator_id");


--
-- TOC entry 3301 (class 1259 OID 17037)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3306 (class 1259 OID 16977)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3309 (class 1259 OID 16978)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3296 (class 1259 OID 16963)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3317 (class 1259 OID 16993)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3320 (class 1259 OID 16992)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3323 (class 1259 OID 17007)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3326 (class 1259 OID 17006)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3314 (class 1259 OID 17032)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3329 (class 1259 OID 17028)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3332 (class 1259 OID 17029)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3333 (class 1259 OID 17046)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3336 (class 1259 OID 17045)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3373 (class 1259 OID 18140)
-- Name: quizApp_attemptedopt_optionId_id_abd58d9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_attemptedopt_optionId_id_abd58d9b" ON public."quizApp_attemptedopt" USING btree ("optionId_id");


--
-- TOC entry 3376 (class 1259 OID 18141)
-- Name: quizApp_attemptedopt_questionId_id_c985a33d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_attemptedopt_questionId_id_c985a33d" ON public."quizApp_attemptedopt" USING btree ("questionId_id");


--
-- TOC entry 3377 (class 1259 OID 18142)
-- Name: quizApp_attemptedopt_score_id_1ee1a122; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_attemptedopt_score_id_1ee1a122" ON public."quizApp_attemptedopt" USING btree (score_id);


--
-- TOC entry 3371 (class 1259 OID 18123)
-- Name: quizApp_attemptedque_questionId_id_b6d2c24a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_attemptedque_questionId_id_b6d2c24a" ON public."quizApp_attemptedque" USING btree ("questionId_id");


--
-- TOC entry 3372 (class 1259 OID 18124)
-- Name: quizApp_attemptedque_scoreId_id_92e4087b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_attemptedque_scoreId_id_92e4087b" ON public."quizApp_attemptedque" USING btree ("scoreId_id");


--
-- TOC entry 3365 (class 1259 OID 18111)
-- Name: quizApp_correctoptions_optionId_id_5fe0e21f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_correctoptions_optionId_id_5fe0e21f" ON public."quizApp_correctoptions" USING btree ("optionId_id");


--
-- TOC entry 3368 (class 1259 OID 18112)
-- Name: quizApp_correctoptions_questionId_id_9244ff73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_correctoptions_questionId_id_9244ff73" ON public."quizApp_correctoptions" USING btree ("questionId_id");


--
-- TOC entry 3364 (class 1259 OID 18100)
-- Name: quizApp_option_questionId_id_4607c11d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_option_questionId_id_4607c11d" ON public."quizApp_option" USING btree ("questionId_id");


--
-- TOC entry 3361 (class 1259 OID 18094)
-- Name: quizApp_question_quizId_id_a26603bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_question_quizId_id_a26603bf" ON public."quizApp_question" USING btree ("quizId_id");


--
-- TOC entry 3352 (class 1259 OID 18076)
-- Name: quizApp_quiz_organizer_id_4eb76c60; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_quiz_organizer_id_4eb76c60" ON public."quizApp_quiz" USING btree (organizer_id);


--
-- TOC entry 3357 (class 1259 OID 18087)
-- Name: quizApp_score_quizId_id_b3922cce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_score_quizId_id_b3922cce" ON public."quizApp_score" USING btree ("quizId_id");


--
-- TOC entry 3358 (class 1259 OID 18088)
-- Name: quizApp_score_studentId_id_5ce92006; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "quizApp_score_studentId_id_5ce92006" ON public."quizApp_score" USING btree ("studentId_id");


--
-- TOC entry 3391 (class 2606 OID 17474)
-- Name: Discussions_discussions Discussions_discussi_doubts_id_9c676522_fk_Discussio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_discussions"
    ADD CONSTRAINT "Discussions_discussi_doubts_id_9c676522_fk_Discussio" FOREIGN KEY (doubts_id) REFERENCES public."Discussions_doubt"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3387 (class 2606 OID 17450)
-- Name: Discussions_doubt Discussions_doubt_creator_id_6bdd69bc_fk_User_student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_doubt"
    ADD CONSTRAINT "Discussions_doubt_creator_id_6bdd69bc_fk_User_student_id" FOREIGN KEY (creator_id) REFERENCES public."User_student"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3389 (class 2606 OID 17521)
-- Name: Discussions_reply Discussions_reply_creator_id_f57623ac_fk_User_student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_reply"
    ADD CONSTRAINT "Discussions_reply_creator_id_f57623ac_fk_User_student_id" FOREIGN KEY (creator_id) REFERENCES public."User_student"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3388 (class 2606 OID 17461)
-- Name: Discussions_reply Discussions_reply_doubt_id_b7ca0e03_fk_Discussions_doubt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_reply"
    ADD CONSTRAINT "Discussions_reply_doubt_id_b7ca0e03_fk_Discussions_doubt_id" FOREIGN KEY (doubt_id) REFERENCES public."Discussions_doubt"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3390 (class 2606 OID 17531)
-- Name: Discussions_reply Discussions_reply_trustedCreator_id_b92459f2_fk_User_orga; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Discussions_reply"
    ADD CONSTRAINT "Discussions_reply_trustedCreator_id_b92459f2_fk_User_orga" FOREIGN KEY ("trustedCreator_id") REFERENCES public."User_organizer"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3380 (class 2606 OID 16972)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3379 (class 2606 OID 16967)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3378 (class 2606 OID 16958)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3382 (class 2606 OID 16987)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3381 (class 2606 OID 16982)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3384 (class 2606 OID 17001)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3383 (class 2606 OID 16996)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3385 (class 2606 OID 17018)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3386 (class 2606 OID 17023)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3401 (class 2606 OID 18125)
-- Name: quizApp_attemptedopt quizApp_attemptedopt_optionId_id_abd58d9b_fk_quizApp_option_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedopt"
    ADD CONSTRAINT "quizApp_attemptedopt_optionId_id_abd58d9b_fk_quizApp_option_id" FOREIGN KEY ("optionId_id") REFERENCES public."quizApp_option"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3402 (class 2606 OID 18130)
-- Name: quizApp_attemptedopt quizApp_attemptedopt_questionId_id_c985a33d_fk_quizApp_q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedopt"
    ADD CONSTRAINT "quizApp_attemptedopt_questionId_id_c985a33d_fk_quizApp_q" FOREIGN KEY ("questionId_id") REFERENCES public."quizApp_question"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3403 (class 2606 OID 18135)
-- Name: quizApp_attemptedopt quizApp_attemptedopt_score_id_1ee1a122_fk_quizApp_score_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedopt"
    ADD CONSTRAINT "quizApp_attemptedopt_score_id_1ee1a122_fk_quizApp_score_id" FOREIGN KEY (score_id) REFERENCES public."quizApp_score"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3399 (class 2606 OID 18113)
-- Name: quizApp_attemptedque quizApp_attemptedque_questionId_id_b6d2c24a_fk_quizApp_q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedque"
    ADD CONSTRAINT "quizApp_attemptedque_questionId_id_b6d2c24a_fk_quizApp_q" FOREIGN KEY ("questionId_id") REFERENCES public."quizApp_question"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3400 (class 2606 OID 18118)
-- Name: quizApp_attemptedque quizApp_attemptedque_scoreId_id_92e4087b_fk_quizApp_score_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_attemptedque"
    ADD CONSTRAINT "quizApp_attemptedque_scoreId_id_92e4087b_fk_quizApp_score_id" FOREIGN KEY ("scoreId_id") REFERENCES public."quizApp_score"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3397 (class 2606 OID 18101)
-- Name: quizApp_correctoptions quizApp_correctoptio_optionId_id_5fe0e21f_fk_quizApp_o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_correctoptions"
    ADD CONSTRAINT "quizApp_correctoptio_optionId_id_5fe0e21f_fk_quizApp_o" FOREIGN KEY ("optionId_id") REFERENCES public."quizApp_option"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3398 (class 2606 OID 18106)
-- Name: quizApp_correctoptions quizApp_correctoptio_questionId_id_9244ff73_fk_quizApp_q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_correctoptions"
    ADD CONSTRAINT "quizApp_correctoptio_questionId_id_9244ff73_fk_quizApp_q" FOREIGN KEY ("questionId_id") REFERENCES public."quizApp_question"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3396 (class 2606 OID 18095)
-- Name: quizApp_option quizApp_option_questionId_id_4607c11d_fk_quizApp_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_option"
    ADD CONSTRAINT "quizApp_option_questionId_id_4607c11d_fk_quizApp_question_id" FOREIGN KEY ("questionId_id") REFERENCES public."quizApp_question"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3395 (class 2606 OID 18089)
-- Name: quizApp_question quizApp_question_quizId_id_a26603bf_fk_quizApp_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_question"
    ADD CONSTRAINT "quizApp_question_quizId_id_a26603bf_fk_quizApp_quiz_id" FOREIGN KEY ("quizId_id") REFERENCES public."quizApp_quiz"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3392 (class 2606 OID 18071)
-- Name: quizApp_quiz quizApp_quiz_organizer_id_4eb76c60_fk_User_organizer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_quiz"
    ADD CONSTRAINT "quizApp_quiz_organizer_id_4eb76c60_fk_User_organizer_id" FOREIGN KEY (organizer_id) REFERENCES public."User_organizer"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3393 (class 2606 OID 18077)
-- Name: quizApp_score quizApp_score_quizId_id_b3922cce_fk_quizApp_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_score"
    ADD CONSTRAINT "quizApp_score_quizId_id_b3922cce_fk_quizApp_quiz_id" FOREIGN KEY ("quizId_id") REFERENCES public."quizApp_quiz"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3394 (class 2606 OID 18082)
-- Name: quizApp_score quizApp_score_studentId_id_5ce92006_fk_User_student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."quizApp_score"
    ADD CONSTRAINT "quizApp_score_studentId_id_5ce92006_fk_User_student_id" FOREIGN KEY ("studentId_id") REFERENCES public."User_student"(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-04-07 20:39:34

--
-- PostgreSQL database dump complete
--

