--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
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
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (5, 'https://www.google.com/search?q=show+da+one+direction+no+brasil&sxsrf=ALiCzsY7xkpHIhlPY5dqIfzhcDkKeG5Lnw%3A1671747928499&ei=WNmkY8yCHuGz1sQP2f-bqAo&oq=shows+da+onde+direc&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQARgBMggIABAWEB4QDzIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMgUIABCGAzIFCAAQhgM6BwgjEOoCECc6DQguEMcBENEDEOoCECc6BwguEOoCECc6BAgjECc6BQgAEJECOgsILhCABBDHARDRAzoFCAAQgAQ6BQguEIAEOggILhCABBDUAjoECAAQQzoFCC4QkQI6CAgAEIAEEMsBOgsILhCABBDUAhDLAToECC4QJzoHCAAQgAQQCjoKCAAQgAQQChDLAToECC4QQzoICC4Q1AIQkQI6CgguEMcBENEDECc6BwguENQCEEM6CgguEMcBENEDEEM6CwguEIAEEMcBEK8BOg4ILhCABBDHARDRAxDUAjoOCC4QgAQQxwEQrwEQywE6BQghEKABOggIIRAWEB4QHToHCCEQoAEQCjoECCEQFToKCCEQFhAeEA8QHUoECEEYAEoECEYYAFAAWK20AmDE6QJoD3ABeAeAAckBiAG3NJIBBjAuNTMuMZgBAKABAbABCsABAQ&sclient=gws-wiz-serp', 'Fyo3yZ', 3, 7, '2022-12-22');
INSERT INTO public.urls VALUES (3, 'https://www.google.com/search?q=como+fazer+um+bolo&sxsrf=ALiCzsY6afzQ7_XBaAACO6uQw4hxNjJ7yA%3A1671746895924&ei=T9WkY6KAOK3M1sQPxsKR4Ak&ved=0ahUKEwji44q_no78AhUtppUCHUZhBJwQ4dUDCA8&uact=5&oq=como+fazer+um+bolo&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIICAAQgAQQywEyCAgAEIAEEMsBMggIABCABBDLATIICAAQgAQQywEyCAgAEIAEEMsBMggIABCABBDLATIICAAQgAQQywEyCAgAEIAEEMsBMggIABCABBDLATIICAAQgAQQywE6CggAEEcQ1gQQsAM6BwgAELADEEM6DQgAEOQCENYEELADGAE6DwguENQCEMgDELADEEMYAjoMCC4QyAMQsAMQQxgCOgQIIxAnOgQIABBDOgcILhDUAhBDOg0ILhCHAhDUAhCABBAUOgUILhCABDoKCAAQgAQQhwIQFDoFCAAQgAQ6DQguEIAEEIcCENQCEBQ6CwguEIAEEMcBENEDOggILhCABBDUAjoHCCMQ6gIQJzoNCC4QxwEQ0QMQ6gIQJzoHCC4Q6gIQJzoMCAAQ6gIQtAIQQxgDOg8IABDqAhC0AhBDEIsDGAM6EgguENQCEOoCELQCEEMQiwMYAzoNCC4QxwEQrwEQ1AIQQzoKCC4QxwEQ0QMQQzoFCAAQkQJKBAhBGABKBAhGGAFQvAVYtE1g91BoBnABeACAAZQBiAGUFZIBBDAuMjSYAQCgAQGwAQ_IARK4AQLAAQHaAQYIARABGAnaAQYIAhABGAjaAQYIAxABGAE&sclient=gws-wiz-serp', '35HFWP', 3, 11, '2022-12-22');
INSERT INTO public.urls VALUES (2, 'https://www.google.com/search?q=natal&sxsrf=ALiCzsaXvEg_miytxnYZfdJaR57mReRkkA%3A1671746889586&source=hp&ei=SdWkY9_AId7V1sQP_f-XsAk&iflsig=AJiK0e8AAAAAY6TjWd682PYKLaSTILXUU8E1Cz5PdYLX&ved=0ahUKEwifiYa8no78AhXeqpUCHf3_BZYQ4dUDCAg&uact=5&oq=natal&gs_lcp=Cgdnd3Mtd2l6EAMyBAguEEMyCwguENQCEIAEEMsBMgQILhBDMgQILhBDMggIABCABBDLATIICAAQgAQQywEyCAguEIAEEMsBMggILhCABBDLATIICAAQgAQQywEyDgguEIAEEMcBEK8BEMsBOg0ILhDHARDRAxDqAhAnOgcIIxDqAhAnOgcILhDqAhAnOgQIIxAnOgUIABCRAjoLCC4QgAQQxwEQ0QM6BQgAEIAEOgUILhCABDoICC4QgAQQ1AI6BAgAEEM6DQguEMcBENEDENQCEEM6CAguENQCEIAEUNQaWJEfYKolaAJwAHgAgAHCAYgB0QWSAQMwLjWYAQCgAQGwAQo&sclient=gws-wiz', 'l9wykB', 1, 2, '2022-12-22');
INSERT INTO public.urls VALUES (4, 'https://www.google.com/search?q=classe+de+armadura+bardo&sxsrf=ALiCzsYWAWeq3I7b5RZBVAQ8jumk23o-YA%3A1671747204726&ei=hNakY6rwK8XM1sQP0pO8kAY&oq=classe+de+bardo&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAxgAMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMggIABAWEB4QCjIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMgYIABAWEB4yBQgAEIYDOgQIIxAnOgUIABCRAjoICC4Q1AIQkQI6CAguEIAEENQCOgUILhCABDoFCAAQgAQ6BAgAEEM6BwguENQCEEM6BAguEEM6CAgAEIAEEMsBOgcIIxDqAhAnOg0ILhDHARDRAxDqAhAnOgcILhDqAhAnOgwIABDqAhC0AhBDGAE6DwgAEOoCELQCEEMQiwMYAToSCC4Q1AIQ6gIQtAIQQxCLAxgBOg0ILhDHARCvARDUAhBDOgoILhDHARDRAxBDOgsILhDHARDRAxCRAjoLCC4QgAQQxwEQ0QM6CwguEMcBENEDEIAEOg4ILhCABBDHARCvARDUAjoOCC4QgAQQxwEQrwEQywE6CAgAEBYQHhAPOgkIABAWEB4Q8QRKBAhBGABKBAhGGAFQAFj5VGCdYmgJcAF4AIABjQGIAcYWkgEEMC4yNJgBAKABAbABD7gBAsABAdoBBggBEAEYAQ&sclient=gws-wiz-serp', '0f-b_u', 3, 6, '2022-12-22');
INSERT INTO public.urls VALUES (16, 'https://legadodamarvel.com.br/apos-ser-demitido-da-dc-dwayne-johnson-pode-ganhar-seu-papel-na-marvel/', 'LVZ9kX', 10, 0, '2022-12-22');
INSERT INTO public.urls VALUES (12, 'https://br.bolavip.com/futebol/Esta-decidido-Rivais-chegam-com-grana-alta-para-assinar-com-Michael-e-atacante-avisa-ao-Gremio-onde-vai-jogar-em-2023-20221221-0037.html', '-ECvPW', 11, 0, '2022-12-22');
INSERT INTO public.urls VALUES (17, 'https://legadodamarvel.com.br/quais-sao-os-poderes-do-hypno-hustler-vilao-do-homem-aranha-que-tera-filme/', 'y7j1VR', 10, 0, '2022-12-22');
INSERT INTO public.urls VALUES (18, 'https://metsul.com/meteorologia-dos-eua-pessoas-podem-congelar-na-rua-em-minutos/', 'bu3ZS2', 5, 0, '2022-12-22');
INSERT INTO public.urls VALUES (14, 'https://br.bolavip.com/fluminense/Fluminense-comunica-Diniz-e-volante-tricolor-assina-com-campeao-paulista-20221211-0096.html', 'z1M4UN', 11, 7, '2022-12-22');
INSERT INTO public.urls VALUES (11, 'https://br.bolavip.com/palmeiras/O-valor-surpreendeu-todo-mundo-Venda-de-Gabriel-Menino-para-o-Vasco-e-encaminhada-e-grana-total-choca-torcida-do-Palmeiras-20221221-0001.html', '_DkfBV', 11, 12, '2022-12-22');
INSERT INTO public.urls VALUES (7, 'https://www.google.com/search?q=show+de+peixes&oq=show+de+peixes&aqs=chrome..69i57.5151j0j7&sourceid=chrome&ie=UTF-8', 'F36LuC', 1, 60, '2022-12-22');
INSERT INTO public.urls VALUES (6, 'https://www.google.com/search?q=gatinhos+legais&oq=gatinhos+legais&aqs=chrome..69i57j0i15i22i30j0i390l2.4249j0j15&sourceid=chrome&ie=UTF-8', 'dJEM9z', 3, 25, '2022-12-22');
INSERT INTO public.urls VALUES (19, 'https://metsul.com/ar-frio-extremo-siberiano-congelara-meio-eua-e-trara-ciclone-bomba/', 'tghL3L', 5, 0, '2022-12-22');
INSERT INTO public.urls VALUES (10, 'https://br.bolavip.com/palmeiras/Apos-titulo-do-Paulistao-Bia-Zaneratto-faz-desabafo-forte-e-cobra-pulso-mais-firme-no-time-feminino-do-Palmeiras-20221222-0102.html', 'RmfmUR', 11, 15, '2022-12-22');
INSERT INTO public.urls VALUES (8, 'https://www.google.com/search?q=show+de+peixes&oq=show+de+peixes&aqs=chrome..69i57.5151j0j7&sourceid=chrome&ie=UTF-8', 'LMVTnD', 4, 43, '2022-12-22');
INSERT INTO public.urls VALUES (9, 'https://extra.globo.com/noticias/mundo/menina-de-4-anos-resgatada-em-maquina-de-pescar-bichos-de-pelucia-na-australia-video-25632327.html', 'hIzB7k', 9, 55, '2022-12-22');
INSERT INTO public.urls VALUES (20, 'https://metsul.com/metsul-alerta-que-chuva-excessiva-voltara-a-castigar-santa-catarina/', 'c2_Kq2', 5, 0, '2022-12-22');
INSERT INTO public.urls VALUES (13, 'https://br.bolavip.com/palmeiras/Nao-foi-so-para-gastar-dinheiro...-Scarpa-e-envolvido-em-polemica-de-R-890-milhoes-no-Nottingham-e-presidente-passa-aperto-20221220-0139.html', 'I9LvFH', 11, 33, '2022-12-22');
INSERT INTO public.urls VALUES (15, 'https://catracalivre.com.br/entretenimento/12-festivais-de-musica-para-ficar-de-olho-em-2023/', 'lifwkp', 10, 0, '2022-12-22');
INSERT INTO public.urls VALUES (21, 'https://www.americanas.com.br/hotsite/chocolates-lacta-mondelez?utm_medium=cpm&utm_source=awareness&utm_campaign=marca%3Aacom%3Bmidia%3Asearch%3Bformato%3Agocoop%3Bsubformato%3A00%3Bidcampanha%3Acoop_acom_mondelez_cpm_awareness_%20natal&epar=pm_gc_00_go_coop_acom_mondelez_cpm_awareness_natal&dclid=CjkKEQiAnZCdBhD9wbTw4-S8vagBEiQAXaFuRoY6xvPutc8g_pu9W6ZObY4z2UruiDme_1KrK2wH49Xw_wcB', 'UCfRPU', 5, 0, '2022-12-22');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Fabio', 'fabio@gmail.com', '$2b$10$IRdnZAlKCLVvSKJeGBbfz.twpieNdS1cYkt2dNyiudLOLUKrCiIr2', '2022-12-20');
INSERT INTO public.users VALUES (2, 'Ana Claudia', 'aninha@gmail.com', '$2b$10$zEvSob59w/GMNccraYPAsesQSNpI8eGxzt0qhjx/IxdBqEHzC5Fnq', '2022-12-21');
INSERT INTO public.users VALUES (3, 'lais', 'lais@gmail.com', '$2b$10$jFj6ZzqojxjYr/C.HQbx6O63UNNy.sN3Std/F9UYNbmUxGmzs7rly', '2022-12-22');
INSERT INTO public.users VALUES (4, 'Leo', 'leo@gmail.com', '$2b$10$DxyzbKUb5yLH.eeNYttKCuYj2/guqxKLA2svv2/ohUi2VDOj9wr7e', '2022-12-22');
INSERT INTO public.users VALUES (5, 'Paulo', 'paulo@gmail.com', '$2b$10$1mPVdbho0AuYIcGwMLxzEeVwHaF.n0T0aWoRP0aGHdShHhKlEbJYi', '2022-12-22');
INSERT INTO public.users VALUES (6, 'Julio', 'julio@gmail.com', '$2b$10$x.u/XF7IROwoblG4Cbnh2ezRof0dHd7MK5895afDjQrvo.wyVTEhK', '2022-12-22');
INSERT INTO public.users VALUES (7, 'Igor', 'igor@gmail.com', '$2b$10$83xGH2mvZvxHzWXjppkRue7Xev84FeyqGFA4O/zyJdzPUNMOu5pL6', '2022-12-22');
INSERT INTO public.users VALUES (8, 'luis', 'luis@gmail.com', '$2b$10$umzxGiDNopGlNSCI9OGc4em1gpSa.5evSl1ShPfo4PSikWZXOatia', '2022-12-22');
INSERT INTO public.users VALUES (9, 'Hugo', 'hugo@gmail.com', '$2b$10$t9s2iLRUL1tLXS/gD/lj/.EZbn.5ckpdl58CQXlrkwyqGobRUKhem', '2022-12-22');
INSERT INTO public.users VALUES (10, 'Natham', 'natham@gmail.com', '$2b$10$bNP0R1LJYePiiVfvdOUeOOHi40SotxhRnaZzOICWBvGcu6jCEi3H2', '2022-12-22');
INSERT INTO public.users VALUES (11, 'Tarantino', 'tarantino@gmail.com', '$2b$10$ecM5g6uSIswEPkdL1n55z.K0YoteLgMsECmc1gmwzZ70zN91AeehC', '2022-12-22');


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

