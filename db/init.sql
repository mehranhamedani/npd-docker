--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.4

-- Started on 2019-12-17 13:44:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 199 (class 1259 OID 57146)
-- Name: customer_customerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."customer_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public."customer_customerID_seq" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 57102)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    "customerID" integer DEFAULT nextval('public."customer_customerID_seq"'::regclass) NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 57148)
-- Name: customerOrder_customerOrderID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."customerOrder_customerOrderID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public."customerOrder_customerOrderID_seq" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 57108)
-- Name: customerOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."customerOrder" (
    "customerOrderID" integer DEFAULT nextval('public."customerOrder_customerOrderID_seq"'::regclass) NOT NULL,
    "customerID" integer NOT NULL,
    "refID" text NOT NULL,
    "statusID" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public."customerOrder" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 57182)
-- Name: customerOrderDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."customerOrderDetail" (
    "customerOrderDetailID" integer DEFAULT nextval('public."customerOrder_customerOrderID_seq"'::regclass) NOT NULL,
    "customerOrderID" integer NOT NULL,
    "foodID" integer NOT NULL,
    "foodSizeTypeID" integer NOT NULL,
    count integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public."customerOrderDetail" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 57180)
-- Name: customerOrderDetail_customerOrderDetailID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."customerOrderDetail_customerOrderDetailID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."customerOrderDetail_customerOrderDetailID_seq" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 57150)
-- Name: food_foodID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."food_foodID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public."food_foodID_seq" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 57117)
-- Name: food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food (
    "foodID" integer DEFAULT nextval('public."food_foodID_seq"'::regclass) NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "foodTypeID" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.food OWNER TO postgres;

--
-- TOC entry 2710 (class 2606 OID 57189)
-- Name: customerOrderDetail customerOrderDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."customerOrderDetail"
    ADD CONSTRAINT "customerOrderDetail_pkey" PRIMARY KEY ("customerOrderDetailID");


--
-- TOC entry 2706 (class 2606 OID 57126)
-- Name: customerOrder customerOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."customerOrder"
    ADD CONSTRAINT "customerOrder_pkey" PRIMARY KEY ("customerOrderID");


--
-- TOC entry 2704 (class 2606 OID 57128)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY ("customerID");


--
-- TOC entry 2708 (class 2606 OID 57130)
-- Name: food food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY ("foodID");


--
-- TOC entry 2712 (class 2606 OID 57190)
-- Name: customerOrderDetail fk_customerOrderDetail_customerOrder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."customerOrderDetail"
    ADD CONSTRAINT "fk_customerOrderDetail_customerOrder" FOREIGN KEY ("customerOrderID") REFERENCES public."customerOrder"("customerOrderID");


--
-- TOC entry 2713 (class 2606 OID 57195)
-- Name: customerOrderDetail fk_customerOrderDetail_food; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."customerOrderDetail"
    ADD CONSTRAINT "fk_customerOrderDetail_food" FOREIGN KEY ("foodID") REFERENCES public.food("foodID");


--
-- TOC entry 2711 (class 2606 OID 57141)
-- Name: customerOrder fk_customerOrder_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."customerOrder"
    ADD CONSTRAINT "fk_customerOrder_customer" FOREIGN KEY ("customerID") REFERENCES public.customer("customerID");


-- Completed on 2019-12-17 13:44:58

--
-- PostgreSQL database dump complete
--
															 
INSERT INTO public.food ("foodID", name, description, "foodTypeID") VALUES (1, 'Salami', 'pizza dough,Italian salami,Parmesan cheese,mozzarella cheese,sweet peppers,red onion,cup grape tomatoes,marinara sauce', 1);
INSERT INTO public.food ("foodID", name, description, "foodTypeID") VALUES (2, 'Marinara', 'plain marinara sauce and seasoned with oregano and garlic', 1);
INSERT INTO public.food ("foodID", name, description, "foodTypeID") VALUES (3, 'Margherita', 'tomatoes, sliced mozzarella, basil, and extra virgin olive oil', 1);

