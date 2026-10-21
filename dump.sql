--
-- PostgreSQL database dump
--

\restrict AedEjDfUklIVmksNE1tRQT1F9icqjjsFZHhUdmtgVc0qA2JSDBPHpncIuvLdwsP

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
-- Name: orders; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying(50) NOT NULL,
    delivery_address text
);


ALTER TABLE public.orders OWNER TO app;

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
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.category (id, name, characteristic) FROM stdin;
\.


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.goods (id, name, category_id, price, brand_id, availability) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.orders (id, user_id, status, delivery_address) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public."user" (id, name, email, phone_number) FROM stdin;
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
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


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
-- Name: orders fk_order_user; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

\unrestrict AedEjDfUklIVmksNE1tRQT1F9icqjjsFZHhUdmtgVc0qA2JSDBPHpncIuvLdwsP

