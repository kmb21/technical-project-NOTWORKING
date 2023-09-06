--
-- PostgreSQL database cluster dump
--

-- Started on 2023-08-26 05:29:38 EDT

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:NVch8Rb754iQo7j7nX5gvg==$ajpXEq6KmGhPO0CCQf9IKSqm9/rDfjN5Gc32M35NwFc=:o/Ka0r2FLxqv1LGPAt8MtHwAYpB1Z5+67auTKbc0Hes=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-08-26 05:29:38 EDT

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

-- Completed on 2023-08-26 05:29:38 EDT

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-08-26 05:29:38 EDT

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16395)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255),
    description character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16394)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 215
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 224 (class 1259 OID 17620)
-- Name: game_players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_players (
    id integer NOT NULL,
    team_id integer,
    player_id integer,
    is_starter boolean,
    minutes integer,
    points integer,
    assists integer,
    offensive_rebounds integer,
    defensive_rebounds integer,
    steals integer,
    blocks integer,
    turnovers integer,
    defensive_fouls integer,
    offensive_fouls integer,
    free_throws_made integer,
    free_throws_attempted integer,
    two_pointers_made integer,
    two_pointers_attempted integer,
    three_pointers_made integer,
    three_pointers_attempted integer
);


ALTER TABLE public.game_players OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17619)
-- Name: game_players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_players_id_seq OWNER TO postgres;

--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 223
-- Name: game_players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_players_id_seq OWNED BY public.game_players.id;


--
-- TOC entry 220 (class 1259 OID 16595)
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    date date,
    team_id integer
);


ALTER TABLE public.games OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16594)
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 219
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- TOC entry 222 (class 1259 OID 16607)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    player_name character varying(226)
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16606)
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO postgres;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 221
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- TOC entry 226 (class 1259 OID 17637)
-- Name: shots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shots (
    id integer NOT NULL,
    game_player_id integer,
    is_make boolean,
    location_x double precision,
    location_y double precision
);


ALTER TABLE public.shots OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17636)
-- Name: shots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shots_id_seq OWNER TO postgres;

--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 225
-- Name: shots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shots_id_seq OWNED BY public.shots.id;


--
-- TOC entry 218 (class 1259 OID 16581)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16580)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 217
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 3465 (class 2604 OID 16398)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 17623)
-- Name: game_players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players ALTER COLUMN id SET DEFAULT nextval('public.game_players_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 16598)
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 16610)
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- TOC entry 3470 (class 2604 OID 17640)
-- Name: shots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shots ALTER COLUMN id SET DEFAULT nextval('public.shots_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 16584)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 3630 (class 0 OID 16395)
-- Dependencies: 216
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name, description) FROM stdin;
\.


--
-- TOC entry 3638 (class 0 OID 17620)
-- Dependencies: 224
-- Data for Name: game_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_players (id, team_id, player_id, is_starter, minutes, points, assists, offensive_rebounds, defensive_rebounds, steals, blocks, turnovers, defensive_fouls, offensive_fouls, free_throws_made, free_throws_attempted, two_pointers_made, two_pointers_attempted, three_pointers_made, three_pointers_attempted) FROM stdin;
1	1	17	f	16	12	1	0	3	0	1	0	1	0	0	0	0	0	4	5
2	1	18	t	35	35	6	0	2	1	2	2	2	0	14	14	9	23	1	1
3	1	19	f	28	12	2	1	3	2	0	2	2	1	0	0	3	4	2	3
4	1	20	t	31	13	0	2	1	1	0	2	4	1	7	8	3	6	0	2
5	1	21	t	23	8	3	3	3	0	1	2	2	0	2	4	3	5	0	4
6	1	22	f	23	11	1	0	3	1	0	0	1	0	0	0	1	1	3	6
7	1	23	f	10	1	1	0	1	0	0	0	1	0	1	1	0	0	0	3
8	1	27	t	25	12	1	2	2	1	0	0	2	0	4	4	4	6	0	3
9	1	28	f	12	6	1	1	5	0	0	1	2	0	2	3	2	2	0	2
10	1	29	t	33	13	4	2	5	1	1	1	2	0	2	3	4	10	1	2
11	1	26	t	30	13	6	2	4	1	0	3	0	0	1	2	6	8	0	0
12	2	14	f	16	4	3	1	1	0	0	0	5	0	0	0	2	2	0	0
13	2	10	t	17	11	2	0	2	0	0	0	3	0	1	1	2	2	2	5
14	2	11	f	24	8	1	2	3	0	1	3	2	1	2	2	0	0	2	4
15	2	1	t	35	38	9	1	1	1	0	6	2	1	12	13	4	5	6	13
16	2	16	f	13	10	1	1	2	0	0	1	1	1	0	0	5	6	0	1
17	2	15	f	28	13	3	1	2	1	2	0	0	0	0	0	2	4	3	4
18	2	2	t	36	23	2	0	4	0	1	4	5	0	5	5	6	8	2	5
19	2	9	t	28	9	2	2	6	0	1	2	2	1	5	6	2	2	0	0
20	2	8	t	36	11	6	1	2	1	0	2	2	0	4	4	2	6	1	8
21	2	13	f	1	2	0	0	0	0	0	0	1	0	0	0	1	1	0	0
22	2	7	f	15	11	0	1	4	0	0	0	3	0	0	0	1	3	3	6
23	2	5	t	26	3	5	0	2	0	0	1	2	0	0	0	0	1	1	5
24	2	12	t	32	8	1	0	4	2	0	1	2	1	0	0	1	4	2	4
\.


--
-- TOC entry 3634 (class 0 OID 16595)
-- Dependencies: 220
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, date, team_id) FROM stdin;
1	2022-12-19	1
2	2022-12-21	1
3	2023-02-10	2
4	2023-03-26	2
\.


--
-- TOC entry 3636 (class 0 OID 16607)
-- Dependencies: 222
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, player_name) FROM stdin;
1	Michael Jordan
2	Tweety
3	Bugs Bunny
4	Daffy Duck
5	Sniffles
6	Yosemite Sam
7	Road Runner
8	Porky Pig
9	Sylvester
10	Lola Bunny
11	Wile E. Coyote
12	Bill Murray
13	Barnyard Dawg
14	Tasmanian Devil
15	Foghorn Leghorn
16	Elmer Fudd
17	Monstar 1
18	Monstar 2
19	Monstar 3
20	Monstar 4
21	Monstar 5
22	Monstar 6
23	Monstar 7
24	Monstar 8
25	Monstar 9
26	Monstar 10
27	Monstar 11
28	Monstar 12
29	Monstar 13
30	Monstar 14
31	Monstar 15
\.


--
-- TOC entry 3640 (class 0 OID 17637)
-- Dependencies: 226
-- Data for Name: shots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shots (id, game_player_id, is_make, location_x, location_y) FROM stdin;
1	17	t	0.2	25.1
2	17	t	-7.7	26.1
3	17	f	15.8	24.5
4	17	t	-7.8	23.5
5	17	t	16.3	23.8
6	18	f	-0.2	-0.9
7	18	f	-0.6	0.5
8	18	t	-14.3	0.4
9	18	f	-5.9	13.8
10	18	f	-10	11.7
11	18	t	-7	13.8
12	18	t	-6.2	5.9
13	18	f	0.9	2
14	18	f	-2	1.1
15	18	t	0.7	12.7
16	18	t	-18.1	18
17	18	f	-1.3	0.8
18	18	f	-6.6	2
19	18	t	1.2	10.3
20	18	t	-1	13.6
21	18	t	0.1	2.2
22	18	f	0.2	0.8
23	18	f	-6.2	13
24	18	f	-14.1	10.3
25	18	f	-6.5	13.8
26	18	t	0.1	2.4
27	18	t	1	-0.3
28	18	f	8.7	14
29	18	f	7.1	4
30	19	f	-14.3	25.3
31	19	t	0	0
32	19	t	0.4	4.7
33	19	t	13.5	22.5
34	19	f	0.6	0.4
35	19	t	6.9	13.5
36	19	t	23.2	0.8
37	20	f	1.8	24.6
38	20	t	-1	0.2
39	20	t	0.7	-0.7
40	20	f	-2.7	1.1
41	20	t	0.6	5.4
42	20	f	23.5	9.7
43	20	f	3.4	0.9
44	20	f	0	-0.9
45	21	t	-1.6	0.7
46	21	f	13.5	25
47	21	t	0.1	1.2
48	21	f	0	0
49	21	f	-23	-1
50	21	f	-23.3	4.6
51	21	f	4	1.8
52	21	f	-11.9	22
53	22	f	-18.3	20
54	22	t	-22.8	-1.2
55	22	f	14.5	21
56	22	f	-14.1	21
57	22	t	-20.5	17
58	22	t	-0.7	0.3
59	22	t	1.6	24.6
60	23	f	-22.8	-1.7
61	23	f	22.7	3.3
62	23	f	16.7	24.3
63	27	t	0	1.9
64	27	t	1.5	0.9
65	27	f	-22.9	-1.6
66	27	t	-1.6	0.8
67	27	f	-1.3	3.3
68	27	f	-22.5	12
69	27	f	23.3	1.4
70	27	t	1.5	-0.7
71	27	f	-7	0.9
72	28	f	-22.5	3.2
73	28	f	18.5	19.2
74	28	t	1.5	-0.3
75	28	t	-0.6	2.5
76	29	t	0.5	1.4
77	29	f	-0.9	0.9
78	29	f	-6.7	14.7
79	29	f	-1.6	5.6
80	29	f	8.1	20.9
81	29	t	1	1.9
82	29	f	-18.9	16.6
83	29	f	-1.6	0.8
84	29	t	7.7	23.8
85	22	f	-17	22
86	22	f	2.2	1.5
87	22	f	-17	22.4
88	22	t	-8.1	26
89	22	t	-8.5	25.5
90	23	t	21	13.1
91	26	f	-2.8	11.9
92	26	t	-6.1	4.3
93	26	t	-0.6	6.2
94	26	f	3.6	5
95	26	t	1	6
96	26	t	-6.9	1.3
97	26	t	-1.3	0.9
98	26	t	-2.1	0.7
99	27	f	4.5	0.8
100	27	f	4.5	11
101	27	f	-6	0.3
102	27	f	-3.2	0.2
103	29	f	-23.9	0.9
104	29	t	-1.3	2
105	29	t	-2.3	1.5
106	29	f	-4.2	2.4
107	29	t	-3.8	5.8
108	29	t	-19.5	17.6
109	29	t	3.6	3.3
110	29	f	16.1	20.3
111	17	f	-17.6	0.1
112	17	t	5.6	25.8
113	17	f	23.7	-0.4
114	17	f	-18.4	12
115	17	t	-22.5	-3.3
116	18	f	4.8	27.1
117	18	t	-1.8	2.6
118	18	f	3.9	9.3
119	18	f	-5.5	4.3
120	18	f	3.4	7.1
121	18	f	5.8	7.5
122	18	f	3.4	2
123	18	t	0.1	6.1
124	18	f	2.7	3.6
125	18	t	-3.7	16.8
126	18	f	-4.3	1.1
127	18	f	2	3.1
128	18	t	7.5	12.3
129	18	t	1.8	0.9
130	18	t	15.3	0.5
131	18	f	6	26.1
132	18	t	2.7	2.4
133	18	f	14.5	25.9
134	18	t	-2.8	1
135	19	t	-2.5	12.5
136	19	t	2	1.1
137	19	f	-4.7	11.3
138	19	f	22.5	12.3
139	19	f	0.6	7.3
140	20	t	1.8	0.6
141	20	f	19.9	15.9
142	20	f	-16.5	22.5
143	20	f	-5.1	4.5
144	20	t	-22.9	2.5
145	20	f	20.6	14
146	20	f	-1.5	2.4
147	20	t	0	1.8
148	20	t	14.2	23.3
149	20	f	9.3	28.2
150	20	t	-4	2.9
151	21	f	2.9	14.3
152	21	f	23.4	-1.6
153	21	f	4.7	2.9
154	21	f	22.4	-0.4
155	21	f	-2	1.2
156	21	t	3.1	3.3
157	28	t	-0.9	0.3
158	28	f	15.4	21
159	14	t	2.1	0.7
160	14	t	-0.1	1
161	10	f	21.6	11.1
162	10	f	-22.8	1.5
163	10	t	-6.6	2
164	10	t	16.3	20.3
165	10	t	-21.1	16.7
166	10	f	22.4	5.1
167	10	t	-1.1	-0.5
168	11	f	11.2	24.7
169	11	t	12	24.6
170	11	f	14.3	22.6
171	11	t	16.3	21
172	1	t	11.8	14.3
173	1	t	-0.1	29.3
174	1	f	16.1	22.4
175	1	t	10.5	25.2
176	1	f	2.5	1.9
177	1	f	-9.3	25.4
178	1	t	-0.5	-0.2
179	1	t	-0.7	0.2
180	1	f	14.3	27.5
181	1	t	7.8	25.6
182	1	t	-5.8	26.1
183	1	f	-14.6	24.4
184	1	t	-18.1	23.6
185	1	f	-11.3	26
186	1	f	23.3	1.2
187	1	t	-14.8	22.7
188	1	f	14.7	23.9
189	1	t	0	0.4
190	16	t	0.7	0.3
191	16	t	-8.8	13.5
192	16	t	-9.9	-1
193	16	t	0.2	-0.2
194	16	f	-23.3	-0.7
195	16	f	-0.7	0.3
196	16	t	0.2	-0.7
197	15	f	1.2	1.4
198	15	t	-0.7	1
199	15	t	-18.3	17.3
200	15	t	23.8	2.5
201	15	t	-17.5	19.4
202	15	t	-0.2	0.3
203	15	f	-15.4	2.6
204	15	f	-17.2	19.9
205	2	t	11.6	3.3
206	2	f	22.4	4.2
207	2	f	17.6	17.5
208	2	t	21.4	1.4
209	2	t	20.8	16.6
210	2	t	0.9	0.6
211	2	f	1	-0.1
212	2	f	-23.3	2.4
213	2	t	-22.7	6.2
214	2	t	0.1	-1.7
215	2	t	0.5	12.9
216	2	f	-13.1	4.6
217	9	t	5.9	3
218	9	t	1	0.9
219	8	f	18.6	21.2
220	8	f	-23	-0.1
221	8	f	-22.7	11.4
222	8	f	11.9	24.1
223	8	t	1.1	29.7
224	8	f	6.2	6.3
225	8	t	0.2	1.5
226	8	f	2	1.2
227	8	f	-15.8	23.3
228	8	f	-2	6.4
229	8	f	-15.7	22.7
230	8	f	-0.1	9.4
231	8	f	18.4	16.7
232	8	t	-1.1	0.8
233	13	t	1.3	0.5
234	14	f	21	13.4
235	14	t	-2.1	0.3
236	14	t	7.1	0.4
237	14	t	0.2	4.6
238	16	f	22.3	0.6
239	16	f	1.2	0.8
240	11	f	-2.3	1.9
241	11	f	-0.5	1.5
242	11	f	19.5	44
243	11	t	12.9	24
244	11	f	16.9	22.4
245	11	f	11	18.2
246	11	f	3.9	16.9
247	11	t	7.7	14.7
248	11	f	-7.8	19.6
249	11	t	-17.4	22.9
250	11	f	-16.7	18.9
251	11	t	-20.6	14.4
252	11	t	2	-0.1
253	11	t	0	3.6
254	11	t	1.2	1.7
255	11	f	-3.7	1.3
256	11	t	-0.6	0.9
257	11	t	0.1	0.4
258	11	t	-0.7	5.9
259	11	f	-2.3	5
260	13	t	12.5	23.6
261	13	t	-10.8	25.1
262	13	f	-1.3	0.7
263	13	t	-1.2	-0.6
264	13	t	1.7	0.2
265	13	f	2.7	6.3
266	13	f	5.4	2.8
267	13	f	-23.4	1.5
268	13	f	-23	0.5
269	7	f	12.1	26.1
270	7	t	-6.9	20.4
271	7	t	-18.8	18.3
272	7	t	-17.5	19
273	7	t	23.3	-0.1
274	7	f	22.4	1.9
275	7	f	23.2	3.4
276	7	f	-1.3	0.5
277	7	f	3.6	2.4
278	5	f	-3.8	25.8
279	5	f	9.7	23.4
280	5	f	16.9	20.4
281	5	f	1	21
282	5	f	-17.2	19.7
283	5	t	-17.2	19.2
284	9	f	1.8	0.3
285	9	t	-0.4	1.9
286	9	f	-1.6	1.5
287	9	f	-1.3	1.2
288	9	t	1.6	1.2
289	10	f	-7.2	10.5
290	10	f	10.2	1.1
291	10	f	-7.4	3.4
292	15	t	16.5	23.9
293	15	f	12.9	9.4
294	15	t	-3.6	14.3
295	15	t	0.5	21.5
296	15	t	-23.5	9.5
297	15	f	-22.6	7.9
298	15	t	-22.7	12.4
299	15	f	-21.9	13
300	15	t	1.7	0
301	15	t	0.6	1.5
302	15	f	1.1	0.5
303	15	t	5	4.1
304	15	t	-6.1	3.4
305	12	f	18.3	15.8
306	12	t	16.5	22.9
307	12	t	-16.8	19
308	12	f	22.8	2.5
309	12	t	1.6	0.6
310	12	f	-1.6	1.2
311	12	f	-1.8	0.4
312	12	f	6.9	0.6
\.


--
-- TOC entry 3632 (class 0 OID 16581)
-- Dependencies: 218
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name) FROM stdin;
1	Tune Squad
2	Monstars
\.


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 215
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 223
-- Name: game_players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_players_id_seq', 24, true);


--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 219
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 1, false);


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 221
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_player_id_seq', 1, false);


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 225
-- Name: shots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shots_id_seq', 312, true);


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 217
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 1, false);


--
-- TOC entry 3472 (class 2606 OID 16402)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3480 (class 2606 OID 17625)
-- Name: game_players game_players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players
    ADD CONSTRAINT game_players_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 16600)
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- TOC entry 3478 (class 2606 OID 16612)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- TOC entry 3482 (class 2606 OID 17642)
-- Name: shots shots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shots
    ADD CONSTRAINT shots_pkey PRIMARY KEY (id);


--
-- TOC entry 3474 (class 2606 OID 16588)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 3484 (class 2606 OID 17631)
-- Name: game_players game_players_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players
    ADD CONSTRAINT game_players_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 3485 (class 2606 OID 17626)
-- Name: game_players game_players_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players
    ADD CONSTRAINT game_players_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.games(id);


--
-- TOC entry 3483 (class 2606 OID 16601)
-- Name: games games_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- TOC entry 3486 (class 2606 OID 17643)
-- Name: shots shots_game_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shots
    ADD CONSTRAINT shots_game_player_id_fkey FOREIGN KEY (game_player_id) REFERENCES public.players(player_id);


-- Completed on 2023-08-26 05:29:38 EDT

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-08-26 05:29:38 EDT

--
-- PostgreSQL database cluster dump complete
--

