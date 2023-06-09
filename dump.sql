--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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

--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    comment text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "followUserId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    hashtag text NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    description text,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    image text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (1, 19, 'Gostei da indicação', 5, '2023-06-07 20:26:30.147977');
INSERT INTO public.comments VALUES (2, 19, 'Espero que gostem do lugar', 5, '2023-06-07 20:37:04.844994');
INSERT INTO public.comments VALUES (4, 37, 'Gosto muito da epic', 1, '2023-06-09 13:02:31.675025');
INSERT INTO public.comments VALUES (5, 37, 'Pretendo baixar mais jogos', 1, '2023-06-09 13:06:08.710108');
INSERT INTO public.comments VALUES (6, 32, 'Gostei do teste', 1, '2023-06-09 13:09:44.944871');
INSERT INTO public.comments VALUES (7, 34, 'bbb 23?', 1, '2023-06-09 13:11:17.295903');
INSERT INTO public.comments VALUES (8, 34, 'bbb 23?', 1, '2023-06-09 13:11:28.471891');
INSERT INTO public.comments VALUES (9, 34, 'bbb 23?', 1, '2023-06-09 13:12:02.882851');
INSERT INTO public.comments VALUES (10, 34, 'bbb 23?', 1, '2023-06-09 13:13:18.859678');
INSERT INTO public.comments VALUES (11, 34, 'bbb 23?', 1, '2023-06-09 13:14:11.080757');
INSERT INTO public.comments VALUES (12, 37, 'Top demais', 1, '2023-06-09 14:20:23.779859');
INSERT INTO public.comments VALUES (13, 36, 'Vou testar', 1, '2023-06-09 14:21:04.332394');
INSERT INTO public.comments VALUES (16, 37, 'Ótimo', 1, '2023-06-09 14:29:17.216441');
INSERT INTO public.comments VALUES (17, 41, 'Teste', 1, '2023-06-09 14:31:03.892219');


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.followers VALUES (10, 3, 12, '2023-06-08 20:21:43.440698');
INSERT INTO public.followers VALUES (11, 3, 5, '2023-06-08 20:21:55.010217');
INSERT INTO public.followers VALUES (13, 1, 5, '2023-06-08 20:31:41.993775');
INSERT INTO public.followers VALUES (14, 1, 4, '2023-06-08 21:44:16.448199');
INSERT INTO public.followers VALUES (16, 16, 1, '2023-06-09 01:57:48.620948');
INSERT INTO public.followers VALUES (19, 16, 3, '2023-06-09 02:36:41.479135');
INSERT INTO public.followers VALUES (24, 16, 18, '2023-06-09 04:56:28.931345');
INSERT INTO public.followers VALUES (25, 21, 3, '2023-06-09 11:48:33.923291');
INSERT INTO public.followers VALUES (26, 2, 1, '2023-06-09 14:32:38.161228');
INSERT INTO public.followers VALUES (27, 2, 5, '2023-06-09 14:37:15.89929');


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hashtags VALUES (2, 'react', 2, '2023-06-01 08:36:41.526707');
INSERT INTO public.hashtags VALUES (4, 'steam', 4, '2023-06-02 18:10:14.877867');
INSERT INTO public.hashtags VALUES (6, 'sql', 5, '2023-06-02 18:17:57.841681');
INSERT INTO public.hashtags VALUES (7, 'react', 5, '2023-06-02 18:17:57.841681');
INSERT INTO public.hashtags VALUES (9, 'elephantsql', 6, '2023-06-02 18:21:03.186995');
INSERT INTO public.hashtags VALUES (10, 'sql', 6, '2023-06-02 18:21:03.186995');
INSERT INTO public.hashtags VALUES (11, 'render', 6, '2023-06-02 18:21:03.186995');
INSERT INTO public.hashtags VALUES (13, 'sql', 7, '2023-06-02 18:22:13.683038');
INSERT INTO public.hashtags VALUES (15, 'sql', 8, '2023-06-02 18:23:27.782801');
INSERT INTO public.hashtags VALUES (17, 'games', 9, '2023-06-02 18:28:31.404547');
INSERT INTO public.hashtags VALUES (18, 'epic', 9, '2023-06-02 18:28:31.404547');
INSERT INTO public.hashtags VALUES (19, 'steam', 9, '2023-06-02 18:28:31.404547');
INSERT INTO public.hashtags VALUES (25, 'epic', 12, '2023-06-02 18:42:03.10715');
INSERT INTO public.hashtags VALUES (27, 'skol', 13, '2023-06-02 18:47:51.122102');
INSERT INTO public.hashtags VALUES (33, 'sql', 11, '2023-06-05 06:41:48.436091');
INSERT INTO public.hashtags VALUES (34, 'driven', 11, '2023-06-05 06:41:48.436091');
INSERT INTO public.hashtags VALUES (38, 'javascript', 16, '2023-06-05 06:48:34.218663');
INSERT INTO public.hashtags VALUES (44, 'açaí', 19, '2023-06-05 18:43:53.300775');
INSERT INTO public.hashtags VALUES (46, 'javascript', 20, '2023-06-08 06:27:40.52904');
INSERT INTO public.hashtags VALUES (48, 'sql', 21, '2023-06-08 20:46:28.736911');
INSERT INTO public.hashtags VALUES (50, 'sql', 22, '2023-06-08 20:47:23.937435');
INSERT INTO public.hashtags VALUES (52, 'sql', 23, '2023-06-08 20:48:53.33099');
INSERT INTO public.hashtags VALUES (54, 'sql', 24, '2023-06-08 21:15:34.356909');
INSERT INTO public.hashtags VALUES (56, 'sql', 25, '2023-06-08 21:15:41.859925');
INSERT INTO public.hashtags VALUES (58, 'sql', 26, '2023-06-08 21:16:29.625861');
INSERT INTO public.hashtags VALUES (60, 'sql', 27, '2023-06-08 21:16:41.544481');
INSERT INTO public.hashtags VALUES (62, 'sql', 28, '2023-06-08 21:19:41.167744');
INSERT INTO public.hashtags VALUES (64, 'sql', 29, '2023-06-08 21:19:51.60913');
INSERT INTO public.hashtags VALUES (66, 'sql', 30, '2023-06-08 21:20:05.533532');
INSERT INTO public.hashtags VALUES (70, 'sql', 36, '2023-06-09 01:56:56.822616');
INSERT INTO public.hashtags VALUES (72, 'games', 37, '2023-06-09 03:45:07.45018');
INSERT INTO public.hashtags VALUES (73, 'epic', 37, '2023-06-09 03:45:07.45018');
INSERT INTO public.hashtags VALUES (75, 'cavalo', 39, '2023-06-09 03:49:54.251749');
INSERT INTO public.hashtags VALUES (77, 'javascript', 41, '2023-06-09 14:30:41.961042');


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (2, 1, 2, '2023-06-01 09:22:46.939413');
INSERT INTO public.likes VALUES (3, 1, 13, '2023-06-03 17:13:25.795955');
INSERT INTO public.likes VALUES (4, 1, 11, '2023-06-03 17:13:28.649725');
INSERT INTO public.likes VALUES (5, 1, 8, '2023-06-03 17:13:30.195625');
INSERT INTO public.likes VALUES (10, 5, 13, '2023-06-05 06:41:13.979835');
INSERT INTO public.likes VALUES (14, 5, 11, '2023-06-05 21:00:04.682679');
INSERT INTO public.likes VALUES (16, 3, 2, '2023-06-06 21:34:34.099403');
INSERT INTO public.likes VALUES (17, 3, 20, '2023-06-08 18:41:48.633505');
INSERT INTO public.likes VALUES (18, 16, 20, '2023-06-09 01:57:55.075292');
INSERT INTO public.likes VALUES (20, 16, 11, '2023-06-09 03:31:16.667538');
INSERT INTO public.likes VALUES (25, 16, 39, '2023-06-09 04:31:19.954788');
INSERT INTO public.likes VALUES (31, 1, 37, '2023-06-09 14:29:35.828183');
INSERT INTO public.likes VALUES (32, 2, 41, '2023-06-09 15:45:43.565494');


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (2, 2, 'https://www.npmjs.com/package/react-icons', 'Biblioteca de icons', '2023-06-01 08:29:15.730002');
INSERT INTO public.posts VALUES (4, 5, 'https://store.steampowered.com/', 'Ta na hora de jogar uns jogaimes na #steam!!', '2023-06-02 18:10:14.654269');
INSERT INTO public.posts VALUES (5, 5, 'https://stackoverflow.com/', 'Amo este site para resolver meus problemas de #sql e #react!!!!', '2023-06-02 18:17:57.61842');
INSERT INTO public.posts VALUES (6, 5, 'https://www.elephantsql.com/', 'Uso toda hora o #elephantsql para subir meus dados com #sql e odeio #render preferia que explodisse', '2023-06-02 18:21:02.965549');
INSERT INTO public.posts VALUES (7, 5, 'https://www.postgresql.org/', 'MEU DEUS DO CEU EU AMO #sql', '2023-06-02 18:22:13.364094');
INSERT INTO public.posts VALUES (8, 5, 'https://aws.amazon.com/pt/what-is/sql/#:~:text=SQL%20%C3%A9%20importante%3F-,A%20Linguagem%20de%20consulta%20estruturada%20(SQL)%20%C3%A9%20uma%20linguagem%20de,a%20diferentes%20linguagens%20de%20programa%C3%A7%C3%A3o.', 'amoo #sql definitivamente não estou spammando #sql #sql por favor nao me banammm', '2023-06-02 18:23:27.561579');
INSERT INTO public.posts VALUES (9, 5, 'https://store.epicgames.com', 'toda hora eles dão #games de graça!! pfta #epic bem melhor que a #steam', '2023-06-02 18:28:31.18184');
INSERT INTO public.posts VALUES (12, 5, 'https://store.epicgames.com/', 'mais um lembrete de que a #epic é perfeita', '2023-06-02 18:42:02.88888');
INSERT INTO public.posts VALUES (13, 5, 'https://www.skol.com.br/', 'partindo para tomar uma!!! #skol!!!', '2023-06-02 18:47:50.9061');
INSERT INTO public.posts VALUES (11, 5, 'https://tecnoblog.net/responde/o-que-e-sql/', 'pra vcs que querem manjar de #sql RECOMENDO MUITO ESTUDO E muita #driven', '2023-06-02 18:36:11.681817');
INSERT INTO public.posts VALUES (16, 5, 'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript', 'Artigo bao dimaisss sobre #javascript recomendo', '2023-06-05 06:48:14.001278');
INSERT INTO public.posts VALUES (19, 5, 'https://mundoeducacao.uol.com.br/biologia/acai.htm', 'bom demais tomar um #açaí', '2023-06-05 18:43:53.260496');
INSERT INTO public.posts VALUES (20, 1, 'https://github.com/', 'Melhor site para subir projetos #javascript', '2023-06-08 06:27:40.265078');
INSERT INTO public.posts VALUES (21, 3, 'https://tecnoblog.net/responde/o-que-e-sql/', 'post de #sql para testar paginação', '2023-06-08 20:46:28.552934');
INSERT INTO public.posts VALUES (22, 3, 'https://tecnoblog.net/responde/o-que-e-sql/', 'mais um post de #sql para testar paginação', '2023-06-08 20:47:23.748456');
INSERT INTO public.posts VALUES (23, 5, 'https://tecnoblog.net/responde/o-que-e-sql/', 'post de #sql para testar paginação', '2023-06-08 20:48:53.14646');
INSERT INTO public.posts VALUES (24, 3, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:15:34.166368');
INSERT INTO public.posts VALUES (25, 5, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:15:41.674408');
INSERT INTO public.posts VALUES (26, 5, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:16:29.433184');
INSERT INTO public.posts VALUES (27, 5, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:16:41.361944');
INSERT INTO public.posts VALUES (28, 5, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:19:40.980295');
INSERT INTO public.posts VALUES (29, 5, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:19:51.422455');
INSERT INTO public.posts VALUES (30, 5, 'https://www.youtube.com/', 'post de #sql para testar paginação', '2023-06-08 21:20:05.345712');
INSERT INTO public.posts VALUES (32, 5, 'https://www.youtube.com/', 'ay lmao', '2023-06-08 21:26:47.324836');
INSERT INTO public.posts VALUES (33, 5, 'https://www.youtube.com/', 'aaaaaaa', '2023-06-08 21:28:21.738779');
INSERT INTO public.posts VALUES (34, 5, 'https://www.youtube.com/', 'bbbbb', '2023-06-08 21:30:49.815834');
INSERT INTO public.posts VALUES (35, 16, 'https://tecnoblog.net/responde/o-que-e-sql/', 'ay papaiiii', '2023-06-09 01:53:56.600762');
INSERT INTO public.posts VALUES (36, 16, 'https://regex101.com/', 'regex pra colocar no seu #sql', '2023-06-09 01:56:56.578253');
INSERT INTO public.posts VALUES (37, 5, 'https://store.epicgames.com/', 'acho mt maneiro #games pela #epic!! oxii', '2023-06-09 03:45:07.259351');
INSERT INTO public.posts VALUES (39, 18, 'https://store.epicgames.com/', 'agora sim!! #cavalo', '2023-06-09 03:49:54.065985');
INSERT INTO public.posts VALUES (40, 18, 'https://pt.wikipedia.org/wiki/Ratinho', 'ratinhonho', '2023-06-09 04:36:18.228236');
INSERT INTO public.posts VALUES (41, 1, 'https://github.com/', 'Melhor site para subir projetos #javascript', '2023-06-09 14:30:41.656933');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'lucio', 'lucio@lucio.com.br', '$2b$10$HBMdhmJow1zGeR3kdraLruCUB3YhkgtEUQpPJf7Tt18RHDbPZ3AQe', 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ', '2023-06-01 08:25:25.442917');
INSERT INTO public.users VALUES (2, 'bruno', 'bruno@bruno.com.br', '$2b$10$C4THHtbb9RQyTtxO4P6BU.QRc2lfhjgRxT1o/gws.5nAfLeEqT9ou', 'https://s2.glbimg.com/nvjFq8VRjyrpdQqaOeywz-5DFwY=/e.glbimg.com/og/ed/f/original/2021/08/27/captura_de_tela_2021-08-27_as_11.01.15.png', '2023-06-01 08:26:56.541073');
INSERT INTO public.users VALUES (3, 'ivan', 'ivan@ivan.com', '$2b$10$L9lzcXV7RXrHEYT9w34TcuUlc7CI86s/z5bhNAGrfUHkk1MbJRHJC', 'https://dimensaosete.com.br/static/c725e19b3ebbff8236035ee16e6e1fc4/8a681/luffy-transformacoes.webp', '2023-06-01 21:26:38.039996');
INSERT INTO public.users VALUES (4, 'lucio2', 'lucio2@lucio2.com', '$2b$10$OgZtlo2UJ1iChNDOL4WeLeNHpakdf3ij9oloO3YwJVRmE8nmAol/K', 'https://www.petz.com.br/blog/wp-content/uploads/2020/07/raca-de-cachorro-muito-popular-no-brasil-3-1280x720.jpg', '2023-06-02 08:15:39.256091');
INSERT INTO public.users VALUES (5, 'pheruzik', 'fcbgomes@gmail.com', '$2b$10$.SioMX5ENCT6yA3e8RAgD.0jKznRdP9jp/MVLNdEL8cIp98.ORiFS', 'data:image/jpeg;base64,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', '2023-06-02 18:09:24.099926');
INSERT INTO public.users VALUES (6, 'test', 'test1234@gmail.com', '$2b$10$N2oywRTaBJpc7/iT361cy.n1THsKx3yVpSj8yj8AEBngMFBZ7p7ZG', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8Fy6YZ8xeyXxBp4ZgEVhD4zvYENidqLwLrlgWaL2R5w&s', '2023-06-03 14:43:34.346935');
INSERT INTO public.users VALUES (7, 'dog', 'a@a.com', '$2b$10$YsMvI7TjzNqnCxqe/9s8lOB9jrGc7RMZuZZzdY2GQZ29RdsinHFBW', 'data:image/jpeg;base64,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', '2023-06-05 15:07:23.17134');
INSERT INTO public.users VALUES (8, 'teste', 'dog@a.com', '$2b$10$u8Qgxdv98jD4C2jjW2PcNOlMYRw4YUaUU4Ba6kEmaHTgM5otk9WuK', 'https://pbs.twimg.com/media/E8X2s6rXIAUiVib.jpg', '2023-06-05 15:12:05.068489');
INSERT INTO public.users VALUES (9, 'tutor', 'tutor@driven.com', '$2b$10$XwOcFaE1u56sDgOqcuLTr.Lu/slP2Vi40qyHn00oVzKp/4azub8dC', 'https://media.istockphoto.com/id/1316420668/vector/user-icon-human-person-symbol-social-profile-icon-avatar-login-sign-web-user-symbol.jpg?s=612x612&w=0&k=20&c=AhqW2ssX8EeI2IYFm6-ASQ7rfeBWfrFFV4E87SaFhJE=', '2023-06-05 16:03:50.47959');
INSERT INTO public.users VALUES (10, 'Felipe', 'felipe@felipe.com', '$2b$10$D.JB7HqE4n6nvmJ9ngGBqewzTNUYb8GgZ.SraekfyjDTACrG611eG', 'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png', '2023-06-05 16:28:12.479727');
INSERT INTO public.users VALUES (11, 'adm', 'adm@adm.com', '$2b$10$UdAxEqovp3kNoaR576fif.4aIIt3j7l3QVkyH6Uh7Gzvlh/SbAS6m', 'https://www.meupositivo.com.br/doseujeito/wp-content/uploads/2020/02/navegacao-em-modo-anonimo.jpg', '2023-06-07 20:06:38.347513');
INSERT INTO public.users VALUES (12, 'pheteste', 'teste@teste.com', '$2b$10$KKdepEYzHJIHO/.5ki5RmO45j.P2nvfO1wdLN7uQfATZWwcUoBSDa', 'https://pt.wikipedia.org/wiki/Ficheiro:Zor%C3%A3o.png', '2023-06-07 23:39:52.507229');
INSERT INTO public.users VALUES (13, 'pheaaaaa', 'teste2@teste2.com', '$2b$10$TZ43sxOV7Uy1HOVZRMtfR.mGNBKM1tu6pJUj9ld5N6slPe9p3TT9.', 'https://pt.wikipedia.org/wiki/Ficheiro:Zor%C3%A3o.png', '2023-06-07 23:41:05.09805');
INSERT INTO public.users VALUES (14, 'bruaaa', 'teste3@teste3.com', '$2b$10$gfdv.DHKDfuC5UTrQbLZ/.MS7CsUWBSq16FrPz5liSlkix9KqDIKK', 'https://pt.wikipedia.org/wiki/Ficheiro:Zor%C3%A3o.png', '2023-06-08 00:01:00.011071');
INSERT INTO public.users VALUES (15, 'fernando', 'fcbteste@gmail.com', '$2b$10$T1qcBnHvMepjXSPdt.HSruFjVuIG28P6KzQJOSvsMQbVkuapO290G', 'data:image/jpeg;base64,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', '2023-06-08 07:12:10.587863');
INSERT INTO public.users VALUES (16, 'miranha', 'miranha@miranha.com', '$2b$10$vBAM9aIS32PwP9.NpGyv1O9KyO8LaU9ZH0sVRg43yO0P2JX//U0o2', 'https://i.pinimg.com/originals/18/a0/c2/18a0c2dd540fa234641666d0f1af17ee.jpg', '2023-06-09 01:47:28.466675');
INSERT INTO public.users VALUES (17, 'narutinho', 'narutinho@narutinho.com', '$2b$10$9UlYOSkdor4FdgICJOuA3.tGT7cBuDmYvBeQLoFWxoETE4sT1Gpn2', 'https://observatoriodocinema.uol.com.br/wp-content/uploads/2022/10/1200.jpg', '2023-06-09 02:01:44.849883');
INSERT INTO public.users VALUES (18, 'ooo magaa', 'ratinho@ratinho.com', '$2b$10$d1BAEWD5S/VV5DcOGM7oO.maPtLu2OFOPmw8IwtVMZfIdqnvoLReC', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQDEDDbQbuIILkoaPe78lIABsHNipgGNEI9JSJ9SyuUkpIkfg6m', '2023-06-09 02:10:31.067491');
INSERT INTO public.users VALUES (19, 'venom', 'venom@venom.com', '$2b$10$NobRmuRHzHjRMJDT2.MlBOGJ/a7Z3ASyRz/c/HmpVZIbGF8Qj2q/S', 'data:image/jpeg;base64,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', '2023-06-09 02:33:30.753403');
INSERT INTO public.users VALUES (21, 'teste123', 'teste@ivan.com', '$2b$10$/zrusnS6Yp4HMr.AWXhOO.UqVS0Henn0H10LVwdnpMsuV6LRJL1XS', 'https://img.assinaja.com/upl/lojas/mundosinfinitos/imagens/foto-one-piece.png', '2023-06-09 11:47:30.724834');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 17, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.followers_id_seq', 27, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 78, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 32, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 41, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pk PRIMARY KEY (id);


--
-- Name: likes likes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pk PRIMARY KEY (id);


--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: followers followers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT "followers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: hashtags hashtags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_fk0 FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: likes likes_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: likes likes_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_fk1 FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

