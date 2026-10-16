--
-- PostgreSQL database dump
--

\restrict y3RTLcaItUBOsaf1oraZn4v6C52eC045NBYN3H63owfOMvbS4X6vylF7QDUcuy0

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: brand; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(100)
);


ALTER TABLE public.brand OWNER TO app;

--
-- Name: category; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    characteristic text
);


ALTER TABLE public.category OWNER TO app;

--
-- Name: goods; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.goods (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category_id integer NOT NULL,
    price numeric(10,2) NOT NULL,
    brand_id integer NOT NULL,
    availability integer DEFAULT 0
);


ALTER TABLE public.goods OWNER TO app;

--
-- Name: order; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying(50) NOT NULL,
    delivery_address text
);


ALTER TABLE public."order" OWNER TO app;

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    goods_id integer NOT NULL,
    quantity integer NOT NULL,
    final_price numeric(10,2) NOT NULL
);


ALTER TABLE public.order_item OWNER TO app;

--
-- Name: user; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(50)
);


ALTER TABLE public."user" OWNER TO app;

--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.brand (id, name, country) FROM stdin;
1	Bosch	Німеччина
2	Brembo	Італія
3	Mann-Filter	Німеччина
4	KYB	Японія
5	Denso	Японія
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.category (id, name, characteristic) FROM stdin;
1	Двигун та система вихлопу	Деталі поршневої групи, ремені ГРМ, фільтри
2	Гальмівна система	Гальмівні колодки, диски, супорти та рідина
3	Підвіска та рульове управління	Амортизатори, важелі, сайлентблоки, тяги
4	Автоелектрика та освітлення	Акумулятори, генератори, свічки, лампи
\.


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.goods (id, name, category_id, price, brand_id, availability) FROM stdin;
1	Фільтр масляний W 712/75	1	380.00	3	25
2	Комплект гальмівних колодок передніх P 85 020	2	1650.00	2	14
3	Амортизатор газомасляний передній Excel-G	3	2450.00	4	8
4	Свічка запалювання Iridium Power IK20	4	420.00	5	40
5	Гальмівний диск вентильований 09.9772.11	2	2890.00	2	6
6	Акумулятор S4 008 74Ah 680A	4	4100.00	1	5
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public."order" (id, user_id, status, delivery_address) FROM stdin;
1	1	completed	м. Чернігів, Нова Пошта №5
2	2	processing	м. Київ, Нова Пошта №12
3	1	shipped	м. Чернігів, вул. Рокоссовського, 14
4	3	new	м. Ніжин, Нова Пошта №1
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.order_item (id, order_id, goods_id, quantity, final_price) FROM stdin;
1	1	1	1	380.00
2	1	2	1	1650.00
3	2	3	2	4900.00
4	3	4	4	1680.00
5	4	5	2	5780.00
6	4	6	1	4100.00
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public."user" (id, name, email, phone_number) FROM stdin;
1	Тарас Кравченко	taras.kravchenko@gmail.com	+380671112233
2	Василь Дмитренко	v.dmytrenko@ukr.net	+380504445566
3	Сергій Мельник	melnyk.auto@gmail.com	+380937778899
\.


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: goods goods_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: goods fk_goods_brand; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT fk_goods_brand FOREIGN KEY (brand_id) REFERENCES public.brand(id);


--
-- Name: goods fk_goods_category; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT fk_goods_category FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: order_item fk_order_item_goods; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_order_item_goods FOREIGN KEY (goods_id) REFERENCES public.goods(id);


--
-- Name: order_item fk_order_item_order; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: order fk_order_user; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

\unrestrict y3RTLcaItUBOsaf1oraZn4v6C52eC045NBYN3H63owfOMvbS4X6vylF7QDUcuy0

