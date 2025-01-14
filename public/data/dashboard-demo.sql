PGDMP      7                |            dashboarddemo    14.10 (Homebrew)    16.0 c              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    67585    dashboarddemo    DATABASE     o   CREATE DATABASE dashboarddemo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE dashboarddemo;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                tuic    false                        3079    77661    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false    5                       0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2                       1255    68632 )   trigger_auto_accumulate_been_used_count()    FUNCTION     �   CREATE FUNCTION public.trigger_auto_accumulate_been_used_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.been_used_count = OLD.been_used_count + 1;
  RETURN NEW;
END;
$$;
 @   DROP FUNCTION public.trigger_auto_accumulate_been_used_count();
       public          tuic    false    5            	           1255    68633 %   trigger_been_used_count_accumulator()    FUNCTION     �   CREATE FUNCTION public.trigger_been_used_count_accumulator() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.been_used_count = been_used_count + 1;
  RETURN NEW;
END;
$$;
 <   DROP FUNCTION public.trigger_been_used_count_accumulator();
       public          tuic    false    5            
           1255    68634    trigger_set_backup_time()    FUNCTION     �   CREATE FUNCTION public.trigger_set_backup_time() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.backup_time = NOW();
	RETURN NEW;
END;
$$;
 0   DROP FUNCTION public.trigger_set_backup_time();
       public          tuic    false    5                       1255    68635    trigger_set_timestamp()    FUNCTION     �   CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW._mtime = NOW();
  RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.trigger_set_timestamp();
       public          tuic    false    5                       1255    68636 .   update_app_calcu_hourly_patrol_rainfall_view()    FUNCTION       CREATE FUNCTION public.update_app_calcu_hourly_patrol_rainfall_view() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
		CREATE or replace VIEW "app_calcu_hourly_patrol_rainfall_view" AS
			select  distinct on (d."station_no") d."station_no", a2."ogc_fid", d."station_name", a2."rec_time", a2."hr_acc_rain", 
				a2."this_hr", a2."last_hr", a2."_ctime" , a2."_mtime", d."wkb_geometry"
			from (
				select station_no,station_name,wkb_geometry from work_rainfall_station_location
				union
				select station_no,station_name,wkb_geometry from cwb_rainfall_station_location
				)as d
			JOIN "app_calcu_hourly_patrol_rainfall" AS a2 ON d."station_no"  = a2."station_no"
			where EXTRACT(EPOCH FROM (NOW() - a2."rec_time")) < 3600
			order by d."station_no", a2."rec_time";
	RETURN NULL;
	END;
$$;
 E   DROP FUNCTION public.update_app_calcu_hourly_patrol_rainfall_view();
       public          tuic    false    5            �            1259    68637     building_publand_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public." building_publand_ogc_fid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public." building_publand_ogc_fid_seq";
       public          tuic    false    5            �            1259    68638 "   SOCL_export_filter_ppl_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public."SOCL_export_filter_ppl_ogc_fid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."SOCL_export_filter_ppl_ogc_fid_seq";
       public          tuic    false    5            �            1259    68666 3   app_calcu_daily_sentiment_voice1999_109_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_daily_sentiment_voice1999_109_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.app_calcu_daily_sentiment_voice1999_109_ogc_fid_seq;
       public          tuic    false    5            �            1259    68675 1   app_calcu_hour_traffic_info_histories_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_hour_traffic_info_histories_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.app_calcu_hour_traffic_info_histories_ogc_fid_seq;
       public          tuic    false    5            �            1259    68684 *   app_calcu_hour_traffic_youbike_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_hour_traffic_youbike_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.app_calcu_hour_traffic_youbike_ogc_fid_seq;
       public          tuic    false    5            �            1259    68691 :   app_calcu_hourly_it_5g_smart_all_pole_device_log_dev13_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_hourly_it_5g_smart_all_pole_device_log_dev13_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Q   DROP SEQUENCE public.app_calcu_hourly_it_5g_smart_all_pole_device_log_dev13_seq;
       public          tuic    false    5            �            1259    68732 2   app_calcu_month_traffic_info_histories_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_month_traffic_info_histories_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.app_calcu_month_traffic_info_histories_ogc_fid_seq;
       public          tuic    false    5            �            1259    68741 -   app_calcu_monthly_socl_welfare_people_ppl_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_monthly_socl_welfare_people_ppl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.app_calcu_monthly_socl_welfare_people_ppl_seq;
       public          tuic    false    5            �            1259    68742 )   app_calcu_monthly_socl_welfare_people_ppl    TABLE     �  CREATE TABLE public.app_calcu_monthly_socl_welfare_people_ppl (
    district character varying,
    is_low_middle_income double precision,
    is_disabled double precision,
    is_disabled_allowance double precision,
    is_low_income double precision,
    _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    ogc_fid integer DEFAULT nextval('public.app_calcu_monthly_socl_welfare_people_ppl_seq'::regclass) NOT NULL
);
 =   DROP TABLE public.app_calcu_monthly_socl_welfare_people_ppl;
       public         heap    tuic    false    222    5            �            1259    68699 %   app_calcu_patrol_rainfall_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_patrol_rainfall_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.app_calcu_patrol_rainfall_ogc_fid_seq;
       public          tuic    false    5            �            1259    68750 (   app_calcu_sentiment_dispatch_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_sentiment_dispatch_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.app_calcu_sentiment_dispatch_ogc_fid_seq;
       public          tuic    false    5            �            1259    68767 '   app_calcu_traffic_todaywork_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_traffic_todaywork_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.app_calcu_traffic_todaywork_ogc_fid_seq;
       public          tuic    false    5            �            1259    68639 (   app_calcu_weekly_dispatching_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_weekly_dispatching_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.app_calcu_weekly_dispatching_ogc_fid_seq;
       public          tuic    false    5            �            1259    68784 (   app_calcu_weekly_hellotaipei_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_weekly_hellotaipei_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.app_calcu_weekly_hellotaipei_ogc_fid_seq;
       public          tuic    false    5            �            1259    68785 +   app_calcu_weekly_metro_capacity_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_weekly_metro_capacity_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.app_calcu_weekly_metro_capacity_ogc_fid_seq;
       public          tuic    false    5            �            1259    68786 6   app_calcu_weekly_metro_capacity_threshould_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcu_weekly_metro_capacity_threshould_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.app_calcu_weekly_metro_capacity_threshould_ogc_fid_seq;
       public          tuic    false    5            �            1259    68795 )   app_calcul_weekly_hellotaipei_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_calcul_weekly_hellotaipei_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.app_calcul_weekly_hellotaipei_ogc_fid_seq;
       public          tuic    false    5            �            1259    68751 &   app_traffic_lives_accident_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_traffic_lives_accident_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.app_traffic_lives_accident_ogc_fid_seq;
       public          tuic    false    5            �            1259    68760 4   app_traffic_metro_capacity_realtime_stat_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.app_traffic_metro_capacity_realtime_stat_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.app_traffic_metro_capacity_realtime_stat_ogc_fid_seq;
       public          tuic    false    5            �            1259    68820    building_age_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_age_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.building_age_ogc_fid_seq;
       public          tuic    false    5            �            1259    68828 !   building_cadastralmap_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_cadastralmap_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_cadastralmap_ogc_fid_seq;
       public          tuic    false    5            �            1259    68845    building_landuse_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_landuse_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.building_landuse_ogc_fid_seq;
       public          tuic    false    5            �            1259    68867 $   building_license_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_license_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.building_license_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68868    building_license_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_license_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.building_license_ogc_fid_seq;
       public          tuic    false    5            �            1259    68878 #   building_permit_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_permit_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.building_permit_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68869    building_permit_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_permit_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.building_permit_ogc_fid_seq;
       public          tuic    false    5            �            1259    68909 $   building_publand_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_publand_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.building_publand_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68892    building_publand_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_publand_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.building_publand_ogc_fid_seq;
       public          tuic    false    5            �            1259    68919 )   building_renewarea_10_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewarea_10_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.building_renewarea_10_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68910 !   building_renewarea_10_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewarea_10_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_renewarea_10_ogc_fid_seq;
       public          tuic    false    5            �            1259    68937 )   building_renewarea_40_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewarea_40_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.building_renewarea_40_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68928 !   building_renewarea_40_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewarea_40_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_renewarea_40_ogc_fid_seq;
       public          tuic    false    5            �            1259    68955 )   building_renewunit_12_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewunit_12_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.building_renewunit_12_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68946 !   building_renewunit_12_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewunit_12_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_renewunit_12_ogc_fid_seq;
       public          tuic    false    5            �            1259    68973 )   building_renewunit_20_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewunit_20_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.building_renewunit_20_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68964 !   building_renewunit_20_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewunit_20_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_renewunit_20_ogc_fid_seq;
       public          tuic    false    5            �            1259    68991 )   building_renewunit_30_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewunit_30_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.building_renewunit_30_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68982 !   building_renewunit_30_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_renewunit_30_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_renewunit_30_ogc_fid_seq;
       public          tuic    false    5            �            1259    69009 )   building_social_house_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_social_house_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.building_social_house_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    69000 !   building_social_house_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_social_house_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.building_social_house_ogc_fid_seq;
       public          tuic    false    5            �            1259    69018     building_unsued_land_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_unsued_land_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.building_unsued_land_ogc_fid_seq;
       public          tuic    false    5                        1259    69019    building_unsued_land    TABLE     F  CREATE TABLE public.building_unsued_land (
    thekey character varying,
    thename character varying,
    thelink character varying,
    aa48 character varying,
    aa49 character varying,
    aa10 double precision,
    aa21 double precision,
    aa22 double precision,
    kcnt character varying,
    cada_text character varying,
    aa17 double precision,
    aa16 double precision,
    aa46 character varying,
    "cadastral map_key_地籍圖key值" character varying,
    "10712土地_1_土地權屬情形" character varying,
    "10712土地_1_管理機關" character varying,
    area double precision,
    _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    ogc_fid integer DEFAULT nextval('public.building_unsued_land_ogc_fid_seq'::regclass) NOT NULL
);
 (   DROP TABLE public.building_unsued_land;
       public         heap    tuic    false    255    5                       1259    69027 (   building_unsued_land_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_unsued_land_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.building_unsued_land_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69045 -   building_unsued_nonpublic_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_unsued_nonpublic_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.building_unsued_nonpublic_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69036 %   building_unsued_nonpublic_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_unsued_nonpublic_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.building_unsued_nonpublic_ogc_fid_seq;
       public          tuic    false    5                       1259    69054    building_unsued_public    TABLE     �  CREATE TABLE public.building_unsued_public (
    full_key character varying,
    "建物管理機關" character varying,
    "行政區" character varying,
    "門牌" character varying,
    "建物標示" character varying,
    "建築完成日期" character varying,
    "閒置樓層_閒置樓層/該建物總樓層" character varying,
    "閒置面積㎡" character varying,
    "房屋現況" character varying,
    "原使用用途" character varying,
    "基地所有權人" character varying,
    "基地管理機關" character varying,
    "土地使用分區" character varying,
    "目前執行情形" character varying,
    _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 *   DROP TABLE public.building_unsued_public;
       public         heap    tuic    false    5                       1259    69061 *   building_unsued_public_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_unsued_public_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.building_unsued_public_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69070 "   building_unsued_public_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.building_unsued_public_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.building_unsued_public_ogc_fid_seq;
       public          tuic    false    5                       1259    69071 #   cvil_public_opinion_evn_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cvil_public_opinion_evn_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.cvil_public_opinion_evn_ogc_fid_seq;
       public          tuic    false    5                       1259    69080 (   cvil_public_opinion_maintype_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cvil_public_opinion_maintype_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.cvil_public_opinion_maintype_ogc_fid_seq;
       public          tuic    false    5            	           1259    69089 '   cvil_public_opinion_subtype_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cvil_public_opinion_subtype_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.cvil_public_opinion_subtype_ogc_fid_seq;
       public          tuic    false    5                       1259    69110 -   cwb_city_weather_forecast_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_city_weather_forecast_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.cwb_city_weather_forecast_history_ogc_fid_seq;
       public          tuic    false    5            
           1259    69098 %   cwb_city_weather_forecast_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_city_weather_forecast_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.cwb_city_weather_forecast_ogc_fid_seq;
       public          tuic    false    5                       1259    69122    cwb_daily_weather_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_daily_weather_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.cwb_daily_weather_ogc_fid_seq;
       public          tuic    false    5                       1259    69129    cwb_hourly_weather_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_hourly_weather_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.cwb_hourly_weather_ogc_fid_seq;
       public          tuic    false    5                       1259    69152 0   cwb_now_weather_auto_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_now_weather_auto_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.cwb_now_weather_auto_station_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69139 (   cwb_now_weather_auto_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_now_weather_auto_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.cwb_now_weather_auto_station_ogc_fid_seq;
       public          tuic    false    5                       1259    69175 2   cwb_now_weather_bureau_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_now_weather_bureau_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.cwb_now_weather_bureau_station_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69165 *   cwb_now_weather_bureau_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_now_weather_bureau_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.cwb_now_weather_bureau_station_ogc_fid_seq;
       public          tuic    false    5                       1259    69190 1   cwb_rainfall_station_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_rainfall_station_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.cwb_rainfall_station_location_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68709 )   cwb_rainfall_station_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_rainfall_station_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.cwb_rainfall_station_location_ogc_fid_seq;
       public          tuic    false    5                       1259    69223 -   cwb_town_weather_forecast_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_town_weather_forecast_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.cwb_town_weather_forecast_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69199 %   cwb_town_weather_forecast_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.cwb_town_weather_forecast_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.cwb_town_weather_forecast_ogc_fid_seq;
       public          tuic    false    5                       1259    69271 2   edu_elementary_school_district_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_elementary_school_district_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.edu_elementary_school_district_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69261 *   edu_elementary_school_district_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_elementary_school_district_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.edu_elementary_school_district_ogc_fid_seq;
       public          tuic    false    5                       1259    69291 8   edu_eleschool_dist_by_administrative_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_eleschool_dist_by_administrative_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.edu_eleschool_dist_by_administrative_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69281 0   edu_eleschool_dist_by_administrative_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_eleschool_dist_by_administrative_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.edu_eleschool_dist_by_administrative_ogc_fid_seq;
       public          tuic    false    5                       1259    69311 7   edu_jhschool_dist_by_administrative_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_jhschool_dist_by_administrative_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE public.edu_jhschool_dist_by_administrative_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69301 /   edu_jhschool_dist_by_administrative_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_jhschool_dist_by_administrative_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.edu_jhschool_dist_by_administrative_ogc_fid_seq;
       public          tuic    false    5                       1259    69331 3   edu_junior_high_school_district_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_junior_high_school_district_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.edu_junior_high_school_district_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69321 +   edu_junior_high_school_district_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_junior_high_school_district_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.edu_junior_high_school_district_ogc_fid_seq;
       public          tuic    false    5                       1259    69351    edu_school_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_school_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.edu_school_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69341    edu_school_ogc_fid_seq    SEQUENCE        CREATE SEQUENCE public.edu_school_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.edu_school_ogc_fid_seq;
       public          tuic    false    5                        1259    69371 *   edu_school_romm_status_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_school_romm_status_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.edu_school_romm_status_history_ogc_fid_seq;
       public          tuic    false    5                       1259    69361 "   edu_school_romm_status_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.edu_school_romm_status_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.edu_school_romm_status_ogc_fid_seq;
       public          tuic    false    5            "           1259    69392 #   eoc_accommodate_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.eoc_accommodate_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.eoc_accommodate_history_ogc_fid_seq;
       public          tuic    false    5            !           1259    69381    eoc_accommodate_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.eoc_accommodate_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.eoc_accommodate_ogc_fid_seq;
       public          tuic    false    5            $           1259    69413 %   eoc_disaster_case_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.eoc_disaster_case_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.eoc_disaster_case_history_ogc_fid_seq;
       public          tuic    false    5            #           1259    69403    eoc_disaster_case_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.eoc_disaster_case_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.eoc_disaster_case_ogc_fid_seq;
       public          tuic    false    5            &           1259    69433 #   eoc_leave_house_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.eoc_leave_house_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.eoc_leave_house_history_ogc_fid_seq;
       public          tuic    false    5            %           1259    69423    eoc_leave_house_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.eoc_leave_house_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.eoc_leave_house_ogc_fid_seq;
       public          tuic    false    5            '           1259    69443    ethc_building_check_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.ethc_building_check_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ethc_building_check_ogc_fid_seq;
       public          tuic    false    5            (           1259    69452    ethc_check_calcu_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.ethc_check_calcu_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ethc_check_calcu_ogc_fid_seq;
       public          tuic    false    5            *           1259    69480    ethc_check_summary_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.ethc_check_summary_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ethc_check_summary_ogc_fid_seq;
       public          tuic    false    5            )           1259    69466    ethc_fire_check_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.ethc_fire_check_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ethc_fire_check_ogc_fid_seq;
       public          tuic    false    5            ,           1259    69488 )   fire_hydrant_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.fire_hydrant_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.fire_hydrant_location_history_ogc_fid_seq;
       public          tuic    false    5            +           1259    69481 !   fire_hydrant_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.fire_hydrant_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.fire_hydrant_location_ogc_fid_seq;
       public          tuic    false    5            -           1259    69495     fire_to_hospital_ppl_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.fire_to_hospital_ppl_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.fire_to_hospital_ppl_ogc_fid_seq;
       public          tuic    false    5            /           1259    69519    heal_aed_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.heal_aed_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.heal_aed_history_ogc_fid_seq;
       public          tuic    false    5            .           1259    69509    heal_aed_ogc_fid_seq    SEQUENCE     }   CREATE SEQUENCE public.heal_aed_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.heal_aed_ogc_fid_seq;
       public          tuic    false    5            1           1259    69539    heal_clinic_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.heal_clinic_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.heal_clinic_history_ogc_fid_seq;
       public          tuic    false    5            0           1259    69529    heal_clinic_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.heal_clinic_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.heal_clinic_ogc_fid_seq;
       public          tuic    false    5            3           1259    69559 !   heal_hospital_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.heal_hospital_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.heal_hospital_history_ogc_fid_seq;
       public          tuic    false    5            2           1259    69549    heal_hospital_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.heal_hospital_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.heal_hospital_ogc_fid_seq;
       public          tuic    false    5            4           1259    69569    heal_suicide_evn_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.heal_suicide_evn_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.heal_suicide_evn_ogc_fid_seq;
       public          tuic    false    5            5           1259    69578    it_5G_smart_pole_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public."it_5G_smart_pole_ogc_fid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."it_5G_smart_pole_ogc_fid_seq";
       public          tuic    false    5            8           1259    69597 +   it_5g_smart_all_pole_device_log_history_seq    SEQUENCE     �   CREATE SEQUENCE public.it_5g_smart_all_pole_device_log_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.it_5g_smart_all_pole_device_log_history_seq;
       public          tuic    false    5            7           1259    69588 +   it_5g_smart_all_pole_device_log_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_5g_smart_all_pole_device_log_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.it_5g_smart_all_pole_device_log_ogc_fid_seq;
       public          tuic    false    5            :           1259    69615 $   it_5g_smart_all_pole_log_history_seq    SEQUENCE     �   CREATE SEQUENCE public.it_5g_smart_all_pole_log_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.it_5g_smart_all_pole_log_history_seq;
       public          tuic    false    5            9           1259    69606    it_5g_smart_all_pole_log_seq    SEQUENCE     �   CREATE SEQUENCE public.it_5g_smart_all_pole_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.it_5g_smart_all_pole_log_seq;
       public          tuic    false    5            6           1259    69579    it_5g_smart_pole_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_5g_smart_pole_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.it_5g_smart_pole_ogc_fid_seq;
       public          tuic    false    5            <           1259    69658 (   it_signal_population_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_signal_population_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.it_signal_population_history_ogc_fid_seq;
       public          tuic    false    5            ;           1259    69636     it_signal_population_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_signal_population_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.it_signal_population_ogc_fid_seq;
       public          tuic    false    5            �            1259    68652 %   it_signal_tourist_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_signal_tourist_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.it_signal_tourist_history_ogc_fid_seq;
       public          tuic    false    5            =           1259    69668    it_signal_tourist_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_signal_tourist_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.it_signal_tourist_ogc_fid_seq;
       public          tuic    false    5            ?           1259    69686 -   it_taipeiexpo_people_flow_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_taipeiexpo_people_flow_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.it_taipeiexpo_people_flow_history_ogc_fid_seq;
       public          tuic    false    5            >           1259    69677 %   it_taipeiexpo_people_flow_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_taipeiexpo_people_flow_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.it_taipeiexpo_people_flow_ogc_fid_seq;
       public          tuic    false    5            @           1259    69695    it_tpe_ticket_event_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpe_ticket_event_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.it_tpe_ticket_event_ogc_fid_seq;
       public          tuic    false    5            A           1259    69704 %   it_tpe_ticket_member_hold_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpe_ticket_member_hold_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.it_tpe_ticket_member_hold_ogc_fid_seq;
       public          tuic    false    5            B           1259    69705    it_tpe_ticket_place_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpe_ticket_place_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.it_tpe_ticket_place_ogc_fid_seq;
       public          tuic    false    5            C           1259    69714     it_tpe_ticket_ticket_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpe_ticket_ticket_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.it_tpe_ticket_ticket_ogc_fid_seq;
       public          tuic    false    5            E           1259    69732 $   it_tpefree_daily_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpefree_daily_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.it_tpefree_daily_history_ogc_fid_seq;
       public          tuic    false    5            D           1259    69723    it_tpefree_daily_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpefree_daily_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.it_tpefree_daily_ogc_fid_seq;
       public          tuic    false    5            G           1259    69750 '   it_tpefree_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpefree_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.it_tpefree_location_history_ogc_fid_seq;
       public          tuic    false    5            F           1259    69741    it_tpefree_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpefree_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.it_tpefree_location_ogc_fid_seq;
       public          tuic    false    5            I           1259    69768 '   it_tpefree_realtime_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpefree_realtime_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.it_tpefree_realtime_history_ogc_fid_seq;
       public          tuic    false    5            H           1259    69759    it_tpefree_realtime_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpefree_realtime_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.it_tpefree_realtime_ogc_fid_seq;
       public          tuic    false    5            K           1259    69786 (   it_tpmo_poc_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpmo_poc_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.it_tpmo_poc_location_history_ogc_fid_seq;
       public          tuic    false    5            J           1259    69777     it_tpmo_poc_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_tpmo_poc_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.it_tpmo_poc_location_ogc_fid_seq;
       public          tuic    false    5            L           1259    69808     it_venue_people_flow_history_seq    SEQUENCE     �   CREATE SEQUENCE public.it_venue_people_flow_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.it_venue_people_flow_history_seq;
       public          tuic    false    5            M           1259    69817     it_venue_people_flow_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.it_venue_people_flow_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.it_venue_people_flow_ogc_fid_seq;
       public          tuic    false    5            S           1259    69889 "   mrtp_carweight_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.mrtp_carweight_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mrtp_carweight_history_ogc_fid_seq;
       public          tuic    false    5            R           1259    69880    mrtp_carweight_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.mrtp_carweight_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.mrtp_carweight_ogc_fid_seq;
       public          tuic    false    5            [           1259    69975 +   patrol_artificial_slope_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_artificial_slope_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.patrol_artificial_slope_history_ogc_fid_seq;
       public          tuic    false    5            Z           1259    69966 #   patrol_artificial_slope_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_artificial_slope_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.patrol_artificial_slope_ogc_fid_seq;
       public          tuic    false    5            \           1259    69984    patrol_box_ogc_fid_seq    SEQUENCE        CREATE SEQUENCE public.patrol_box_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.patrol_box_ogc_fid_seq;
       public          tuic    false    5            ]           1259    69993    patrol_camera_hls_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_camera_hls_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.patrol_camera_hls_ogc_fid_seq;
       public          tuic    false    5            ^           1259    70002    patrol_car_theft_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_car_theft_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.patrol_car_theft_ogc_fid_seq;
       public          tuic    false    5            _           1259    70011     patrol_criminal_case_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_criminal_case_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_criminal_case_ogc_fid_seq;
       public          tuic    false    5            `           1259    70012    patrol_criminal_case    TABLE       CREATE TABLE public.patrol_criminal_case (
    "破獲件數/總計[件]" integer,
    "破獲率[%]" double precision,
    "犯罪人口率[人/十萬人]" double precision,
    "嫌疑犯[人]" integer,
    "發生件數[件]" integer,
    "破獲件數/他轄[件]" character varying,
    "破獲件數/積案[件]" character varying,
    _id character varying,
    "破獲件數/當期[件]" character varying,
    "發生率[件/十萬人]" double precision,
    "實際員警人數[人]" character varying,
    "年月別" timestamp with time zone,
    _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    ogc_fid integer DEFAULT nextval('public.patrol_criminal_case_ogc_fid_seq'::regclass) NOT NULL
);
 (   DROP TABLE public.patrol_criminal_case;
       public         heap    tuic    false    351    5            a           1259    70027 !   patrol_debris_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_debris_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.patrol_debris_history_ogc_fid_seq;
       public          tuic    false    5            b           1259    70036    patrol_debris_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_debris_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.patrol_debris_ogc_fid_seq;
       public          tuic    false    5            d           1259    70046 %   patrol_debrisarea_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_debrisarea_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.patrol_debrisarea_history_ogc_fid_seq;
       public          tuic    false    5            c           1259    70037    patrol_debrisarea_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_debrisarea_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.patrol_debrisarea_ogc_fid_seq;
       public          tuic    false    5            f           1259    70062 *   patrol_designate_place_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_designate_place_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.patrol_designate_place_history_ogc_fid_seq;
       public          tuic    false    5            e           1259    70055 "   patrol_designate_place_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_designate_place_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.patrol_designate_place_ogc_fid_seq;
       public          tuic    false    5            g           1259    70070    patrol_district_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_district_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.patrol_district_ogc_fid_seq;
       public          tuic    false    5            i           1259    70088 #   patrol_eoc_case_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_eoc_case_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.patrol_eoc_case_history_ogc_fid_seq;
       public          tuic    false    5            h           1259    70079    patrol_eoc_case_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_eoc_case_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.patrol_eoc_case_ogc_fid_seq;
       public          tuic    false    5            k           1259    70106 (   patrol_eoc_designate_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_eoc_designate_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.patrol_eoc_designate_history_ogc_fid_seq;
       public          tuic    false    5            j           1259    70097     patrol_eoc_designate_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_eoc_designate_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_eoc_designate_ogc_fid_seq;
       public          tuic    false    5            m           1259    70124 '   patrol_fire_brigade_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_fire_brigade_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.patrol_fire_brigade_history_ogc_fid_seq;
       public          tuic    false    5            l           1259    70115    patrol_fire_brigade_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_fire_brigade_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.patrol_fire_brigade_ogc_fid_seq;
       public          tuic    false    5            o           1259    70142 ,   patrol_fire_disqualified_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_fire_disqualified_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.patrol_fire_disqualified_history_ogc_fid_seq;
       public          tuic    false    5            n           1259    70133 $   patrol_fire_disqualified_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_fire_disqualified_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.patrol_fire_disqualified_ogc_fid_seq;
       public          tuic    false    5            q           1259    70160 '   patrol_fire_rescure_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_fire_rescure_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.patrol_fire_rescure_history_ogc_fid_seq;
       public          tuic    false    5            p           1259    70151    patrol_fire_rescure_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_fire_rescure_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.patrol_fire_rescure_ogc_fid_seq;
       public          tuic    false    5            r           1259    70169    patrol_flood_100_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_flood_100_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.patrol_flood_100_ogc_fid_seq;
       public          tuic    false    5            s           1259    70178    patrol_flood_130_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_flood_130_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.patrol_flood_130_ogc_fid_seq;
       public          tuic    false    5            t           1259    70187    patrol_flood_78_8_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_flood_78_8_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.patrol_flood_78_8_ogc_fid_seq;
       public          tuic    false    5            u           1259    70196 #   patrol_motorcycle_theft_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_motorcycle_theft_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.patrol_motorcycle_theft_ogc_fid_seq;
       public          tuic    false    5            w           1259    70214 )   patrol_old_settlement_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_old_settlement_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.patrol_old_settlement_history_ogc_fid_seq;
       public          tuic    false    5            v           1259    70205 !   patrol_old_settlement_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_old_settlement_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.patrol_old_settlement_ogc_fid_seq;
       public          tuic    false    5            x           1259    70223     patrol_police_region_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_police_region_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_police_region_ogc_fid_seq;
       public          tuic    false    5            z           1259    70241 )   patrol_police_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_police_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.patrol_police_station_history_ogc_fid_seq;
       public          tuic    false    5            y           1259    70232 !   patrol_police_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_police_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.patrol_police_station_ogc_fid_seq;
       public          tuic    false    5            {           1259    70250     patrol_police_station_ogc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_police_station_ogc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_police_station_ogc_id_seq;
       public          tuic    false    5            |           1259    70251 !   patrol_rain_floodgate_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_floodgate_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.patrol_rain_floodgate_ogc_fid_seq;
       public          tuic    false    5            }           1259    70252    patrol_rain_floodgate    TABLE     w  CREATE TABLE public.patrol_rain_floodgate (
    ogc_fid integer DEFAULT nextval('public.patrol_rain_floodgate_ogc_fid_seq'::regclass) NOT NULL,
    station_no character varying,
    station_name character varying,
    rec_time timestamp with time zone,
    all_pumb_lights character varying,
    pumb_num integer,
    door_num integer,
    river_basin character varying,
    warning_level character varying,
    start_pumping_level character varying,
    lng double precision,
    lat double precision,
    _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 )   DROP TABLE public.patrol_rain_floodgate;
       public         heap    tuic    false    380    5            ~           1259    70260 )   patrol_rain_floodgate_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_floodgate_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.patrol_rain_floodgate_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70278 (   patrol_rain_rainfall_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_rainfall_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.patrol_rain_rainfall_history_ogc_fid_seq;
       public          tuic    false    5                       1259    70269     patrol_rain_rainfall_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_rainfall_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_rain_rainfall_ogc_fid_seq;
       public          tuic    false    5            �           1259    70296 %   patrol_rain_sewer_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_sewer_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.patrol_rain_sewer_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70287    patrol_rain_sewer_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_sewer_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.patrol_rain_sewer_ogc_fid_seq;
       public          tuic    false    5            �           1259    70305    patrol_rain_sewer_ogc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_rain_sewer_ogc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.patrol_rain_sewer_ogc_id_seq;
       public          tuic    false    5            �           1259    70306     patrol_random_robber_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_random_robber_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_random_robber_ogc_fid_seq;
       public          tuic    false    5            �           1259    70315     patrol_random_snatch_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_random_snatch_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.patrol_random_snatch_ogc_fid_seq;
       public          tuic    false    5            �           1259    70324 '   patrol_residential_burglary_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.patrol_residential_burglary_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.patrol_residential_burglary_ogc_fid_seq;
       public          tuic    false    5            �           1259    70333 &   poli_traffic_violation_evn_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.poli_traffic_violation_evn_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.poli_traffic_violation_evn_ogc_fid_seq;
       public          tuic    false    5            �           1259    70342 /   poli_traffic_violation_mapping_code_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.poli_traffic_violation_mapping_code_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.poli_traffic_violation_mapping_code_ogc_fid_seq;
       public          tuic    false    5            �           1259    70361    record_db_mtime_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.record_db_mtime_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.record_db_mtime_ogc_fid_seq;
       public          tuic    false    5            �           1259    70376 $   sentiment_councillor_109_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.sentiment_councillor_109_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.sentiment_councillor_109_ogc_fid_seq;
       public          tuic    false    5            �           1259    70385 !   sentiment_dispatching_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.sentiment_dispatching_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.sentiment_dispatching_ogc_fid_seq;
       public          tuic    false    5            �           1259    70394 &   sentiment_hello_taipei_109_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.sentiment_hello_taipei_109_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.sentiment_hello_taipei_109_ogc_fid_seq;
       public          tuic    false    5            �           1259    70403 +   sentiment_hello_taipei_109_test_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.sentiment_hello_taipei_109_test_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.sentiment_hello_taipei_109_test_ogc_fid_seq;
       public          tuic    false    5            �           1259    70404    sentiment_hotnews_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.sentiment_hotnews_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.sentiment_hotnews_ogc_fid_seq;
       public          tuic    false    5            �           1259    70413 #   sentiment_voice1999_109_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.sentiment_voice1999_109_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.sentiment_voice1999_109_ogc_fid_seq;
       public          tuic    false    5            �           1259    70422    socl_case_study_ppl_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_case_study_ppl_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.socl_case_study_ppl_ogc_fid_seq;
       public          tuic    false    5            �           1259    70431 #   socl_dept_epidemic_info_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_dept_epidemic_info_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.socl_dept_epidemic_info_ogc_fid_seq;
       public          tuic    false    5            �           1259    70442 &   socl_domestic_violence_evn_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_domestic_violence_evn_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.socl_domestic_violence_evn_ogc_fid_seq;
       public          tuic    false    5            �           1259    70451 "   socl_export_filter_ppl_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_export_filter_ppl_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.socl_export_filter_ppl_ogc_fid_seq;
       public          tuic    false    5            �           1259    70460 +   socl_order_concern_mapping_code_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_order_concern_mapping_code_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.socl_order_concern_mapping_code_ogc_fid_seq;
       public          tuic    false    5            �           1259    70469 "   socl_order_concern_ppl_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_order_concern_ppl_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.socl_order_concern_ppl_ogc_fid_seq;
       public          tuic    false    5            �           1259    70487 $   socl_welfare_dis_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_dis_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.socl_welfare_dis_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70478    socl_welfare_dis_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_dis_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.socl_welfare_dis_ogc_fid_seq;
       public          tuic    false    5            �           1259    70505 '   socl_welfare_dislow_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_dislow_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.socl_welfare_dislow_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70496    socl_welfare_dislow_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_dislow_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.socl_welfare_dislow_ogc_fid_seq;
       public          tuic    false    5            �           1259    70523 $   socl_welfare_low_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_low_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.socl_welfare_low_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70514    socl_welfare_low_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_low_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.socl_welfare_low_ogc_fid_seq;
       public          tuic    false    5            �           1259    70541 '   socl_welfare_midlow_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_midlow_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.socl_welfare_midlow_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70532    socl_welfare_midlow_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_midlow_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.socl_welfare_midlow_ogc_fid_seq;
       public          tuic    false    5            �           1259    70550 )   socl_welfare_organization_plc_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_organization_plc_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.socl_welfare_organization_plc_ogc_fid_seq;
       public          tuic    false    5            �           1259    70551    socl_welfare_organization_plc    TABLE     �  CREATE TABLE public.socl_welfare_organization_plc (
    main_type character varying,
    sub_type character varying,
    name character varying,
    address character varying,
    lon double precision,
    lat double precision,
    _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    ogc_fid integer DEFAULT nextval('public.socl_welfare_organization_plc_ogc_fid_seq'::regclass) NOT NULL
);
 1   DROP TABLE public.socl_welfare_organization_plc;
       public         heap    tuic    false    414    5            �           1259    70559 1   socl_welfare_organization_plc_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_organization_plc_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.socl_welfare_organization_plc_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70591 #   socl_welfare_people_ppl_history_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_people_ppl_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.socl_welfare_people_ppl_history_seq;
       public          tuic    false    5            �           1259    70568 #   socl_welfare_people_ppl_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.socl_welfare_people_ppl_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.socl_welfare_people_ppl_ogc_fid_seq;
       public          tuic    false    5            �           1259    70605    tdx_bus_live_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_bus_live_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tdx_bus_live_ogc_fid_seq;
       public          tuic    false    5            �           1259    70625 !   tdx_bus_route_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_bus_route_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.tdx_bus_route_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70615    tdx_bus_route_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_bus_route_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tdx_bus_route_ogc_fid_seq;
       public          tuic    false    5            �           1259    70647 #   tdx_bus_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_bus_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tdx_bus_station_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70636    tdx_bus_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_bus_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tdx_bus_station_ogc_fid_seq;
       public          tuic    false    5            �           1259    70658    tdx_metro_line_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_metro_line_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tdx_metro_line_ogc_fid_seq;
       public          tuic    false    5            �           1259    70659    tdx_metro_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tdx_metro_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tdx_metro_station_ogc_fid_seq;
       public          tuic    false    5            N           1259    69825 4   tour_2023_lantern_festival_mapping_table_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tour_2023_lantern_festival_mapping_table_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.tour_2023_lantern_festival_mapping_table_ogc_fid_seq;
       public          tuic    false    5            Q           1259    69856 +   tour_2023_lantern_festival_zone_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tour_2023_lantern_festival_zone_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.tour_2023_lantern_festival_zone_ogc_fid_seq;
       public          tuic    false    5            �           1259    70665 3   tour_2023_latern_festival_mapping_table_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tour_2023_latern_festival_mapping_table_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.tour_2023_latern_festival_mapping_table_ogc_fid_seq;
       public          tuic    false    5            O           1259    69834 +   tour_2023_latern_festival_point_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tour_2023_latern_festival_point_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.tour_2023_latern_festival_point_ogc_fid_seq;
       public          tuic    false    5            P           1259    69843 1   tour_lantern_festival_sysmemorialhall_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tour_lantern_festival_sysmemorialhall_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.tour_lantern_festival_sysmemorialhall_ogc_fid_seq;
       public          tuic    false    5            �           1259    70666    tp_building_bim_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_building_bim_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tp_building_bim_ogc_fid_seq;
       public          tuic    false    5            �           1259    70675    tp_building_height_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_building_height_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tp_building_height_ogc_fid_seq;
       public          tuic    false    5            �           1259    70684    tp_cht_grid_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_cht_grid_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tp_cht_grid_ogc_fid_seq;
       public          tuic    false    5            �           1259    70685    tp_district_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_district_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tp_district_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70695    tp_fet_age_hr_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_fet_age_hr_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tp_fet_age_hr_ogc_fid_seq;
       public          tuic    false    5            �           1259    70704 %   tp_fet_hourly_popu_by_vil_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_fet_hourly_popu_by_vil_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.tp_fet_hourly_popu_by_vil_ogc_fid_seq;
       public          tuic    false    5            �           1259    70713    tp_fet_work_live_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_fet_work_live_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tp_fet_work_live_ogc_fid_seq;
       public          tuic    false    5            �           1259    70722    tp_road_center_line_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_road_center_line_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tp_road_center_line_ogc_fid_seq;
       public          tuic    false    5            �           1259    70736    tp_village_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tp_village_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tp_village_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70577    tp_village_ogc_fid_seq    SEQUENCE        CREATE SEQUENCE public.tp_village_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tp_village_ogc_fid_seq;
       public          tuic    false    5            �           1259    70754 %   traffic_accident_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_accident_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.traffic_accident_location_ogc_fid_seq;
       public          tuic    false    5            �           1259    70745    traffic_accident_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_accident_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.traffic_accident_ogc_fid_seq;
       public          tuic    false    5            �           1259    70780 %   traffic_bus_route_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_bus_route_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.traffic_bus_route_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70770    traffic_bus_route_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_bus_route_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.traffic_bus_route_ogc_fid_seq;
       public          tuic    false    5            �           1259    70799 '   traffic_bus_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_bus_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.traffic_bus_station_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70790    traffic_bus_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_bus_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.traffic_bus_station_ogc_fid_seq;
       public          tuic    false    5            �           1259    70808    traffic_bus_stop_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_bus_stop_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.traffic_bus_stop_ogc_fid_seq;
       public          tuic    false    5            �           1259    70822 "   traffic_info_histories_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_info_histories_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.traffic_info_histories_ogc_fid_seq;
       public          tuic    false    5            �           1259    70832 !   traffic_lives_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_lives_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.traffic_lives_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70823    traffic_lives_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_lives_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.traffic_lives_ogc_fid_seq;
       public          tuic    false    5            �           1259    70853 3   traffic_metro_capacity_realtime_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_capacity_realtime_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.traffic_metro_capacity_realtime_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70862 +   traffic_metro_capacity_realtime_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_capacity_realtime_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.traffic_metro_capacity_realtime_ogc_fid_seq;
       public          tuic    false    5            �           1259    70863 (   traffic_metro_capacity_rtime_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_capacity_rtime_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.traffic_metro_capacity_rtime_ogc_fid_seq;
       public          tuic    false    5            �           1259    70873 &   traffic_metro_line_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_line_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.traffic_metro_line_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70864    traffic_metro_line_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_line_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.traffic_metro_line_ogc_fid_seq;
       public          tuic    false    5            �           1259    70891 3   traffic_metro_realtime_position_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_realtime_position_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.traffic_metro_realtime_position_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70882 +   traffic_metro_realtime_position_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_realtime_position_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.traffic_metro_realtime_position_ogc_fid_seq;
       public          tuic    false    5            �           1259    70909 )   traffic_metro_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.traffic_metro_station_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70900 !   traffic_metro_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.traffic_metro_station_ogc_fid_seq;
       public          tuic    false    5            �           1259    70927 )   traffic_metro_unusual_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_unusual_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.traffic_metro_unusual_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70918 !   traffic_metro_unusual_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_metro_unusual_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.traffic_metro_unusual_ogc_fid_seq;
       public          tuic    false    5            �           1259    70943 &   traffic_todayworks_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_todayworks_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.traffic_todayworks_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70959 0   traffic_youbike_one_realtime_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_youbike_one_realtime_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.traffic_youbike_one_realtime_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    70968 .   traffic_youbike_realtime_histories_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_youbike_realtime_histories_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.traffic_youbike_realtime_histories_ogc_fid_seq;
       public          tuic    false    5            �           1259    70977 #   traffic_youbike_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_youbike_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.traffic_youbike_station_ogc_fid_seq;
       public          tuic    false    5            �           1259    70993 0   traffic_youbike_two_realtime_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.traffic_youbike_two_realtime_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.traffic_youbike_two_realtime_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71002 2   tran_parking_capacity_realtime_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_parking_capacity_realtime_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.tran_parking_capacity_realtime_history_ogc_fid_seq;
       public          tuic    false    5            Y           1259    69953 *   tran_parking_capacity_realtime_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_parking_capacity_realtime_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.tran_parking_capacity_realtime_ogc_fid_seq;
       public          tuic    false    5            �           1259    71010     tran_parking_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_parking_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tran_parking_history_ogc_fid_seq;
       public          tuic    false    5            X           1259    69943    tran_parking_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_parking_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tran_parking_ogc_fid_seq;
       public          tuic    false    5            �           1259    71029 '   tran_ubike_realtime_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_ubike_realtime_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.tran_ubike_realtime_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71020    tran_ubike_realtime_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_ubike_realtime_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tran_ubike_realtime_ogc_fid_seq;
       public          tuic    false    5            �           1259    71049 &   tran_ubike_station_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_ubike_station_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.tran_ubike_station_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71038    tran_ubike_station_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_ubike_station_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tran_ubike_station_ogc_fid_seq;
       public          tuic    false    5            �           1259    71060 (   tran_urban_bike_path_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_urban_bike_path_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.tran_urban_bike_path_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68796     tran_urban_bike_path_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tran_urban_bike_path_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tran_urban_bike_path_ogc_fid_seq;
       public          tuic    false    5            �           1259    71079    tw_village_center_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.tw_village_center_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tw_village_center_ogc_fid_seq;
       public          tuic    false    5            �           1259    71070    tw_village_ogc_fid_seq    SEQUENCE        CREATE SEQUENCE public.tw_village_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tw_village_ogc_fid_seq;
       public          tuic    false    5            �           1259    71138 !   work_eco_park_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_eco_park_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.work_eco_park_history_ogc_fid_seq;
       public          tuic    false    5            T           1259    69898    work_eco_park_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_eco_park_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.work_eco_park_ogc_fid_seq;
       public          tuic    false    5            �           1259    71157 +   work_floodgate_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_floodgate_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.work_floodgate_location_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71148 #   work_floodgate_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_floodgate_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.work_floodgate_location_ogc_fid_seq;
       public          tuic    false    5            �           1259    71178 $   work_garden_city_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_garden_city_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.work_garden_city_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71166    work_garden_city_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_garden_city_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.work_garden_city_ogc_fid_seq;
       public          tuic    false    5            �           1259    71190 (   work_goose_sanctuary_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_goose_sanctuary_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.work_goose_sanctuary_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71093     work_goose_sanctuary_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_goose_sanctuary_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.work_goose_sanctuary_ogc_fid_seq;
       public          tuic    false    5            �           1259    71200 '   work_nature_reserve_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_nature_reserve_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.work_nature_reserve_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71103    work_nature_reserve_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_nature_reserve_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.work_nature_reserve_ogc_fid_seq;
       public          tuic    false    5            �           1259    71210    work_park_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_park_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.work_park_history_ogc_fid_seq;
       public          tuic    false    5            U           1259    69908    work_park_ogc_fid_seq    SEQUENCE     ~   CREATE SEQUENCE public.work_park_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.work_park_ogc_fid_seq;
       public          tuic    false    5            �           1259    71229 1   work_pumping_station_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_pumping_station_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.work_pumping_station_location_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71220 )   work_pumping_station_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_pumping_station_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.work_pumping_station_location_ogc_fid_seq;
       public          tuic    false    5            �           1259    71238 2   work_rainfall_station_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_rainfall_station_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.work_rainfall_station_location_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68718 *   work_rainfall_station_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_rainfall_station_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.work_rainfall_station_location_ogc_fid_seq;
       public          tuic    false    5            �           1259    71247 ,   work_riverside_bike_path_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_riverside_bike_path_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.work_riverside_bike_path_history_ogc_fid_seq;
       public          tuic    false    5            �            1259    68806 $   work_riverside_bike_path_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_riverside_bike_path_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.work_riverside_bike_path_ogc_fid_seq;
       public          tuic    false    5            �           1259    71257 '   work_riverside_park_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_riverside_park_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.work_riverside_park_history_ogc_fid_seq;
       public          tuic    false    5            V           1259    69918    work_riverside_park_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_riverside_park_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.work_riverside_park_ogc_fid_seq;
       public          tuic    false    5            �           1259    71267 (   work_school_greening_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_school_greening_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.work_school_greening_history_ogc_fid_seq;
       public          tuic    false    5            W           1259    69928     work_school_greening_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_school_greening_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.work_school_greening_ogc_fid_seq;
       public          tuic    false    5            �           1259    71286 '   work_sewer_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_sewer_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.work_sewer_location_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71277    work_sewer_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_sewer_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.work_sewer_location_ogc_fid_seq;
       public          tuic    false    5            �           1259    71305 !   work_sidewalk_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_sidewalk_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.work_sidewalk_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71295    work_sidewalk_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_sidewalk_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.work_sidewalk_ogc_fid_seq;
       public          tuic    false    5            �           1259    71325 *   work_soil_liquefaction_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_soil_liquefaction_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.work_soil_liquefaction_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71315 "   work_soil_liquefaction_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_soil_liquefaction_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.work_soil_liquefaction_ogc_fid_seq;
       public          tuic    false    5            �           1259    71345 %   work_street_light_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_street_light_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.work_street_light_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71335    work_street_light_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_street_light_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.work_street_light_ogc_fid_seq;
       public          tuic    false    5            �           1259    71364 $   work_street_tree_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_street_tree_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.work_street_tree_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71355    work_street_tree_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_street_tree_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.work_street_tree_ogc_fid_seq;
       public          tuic    false    5            �           1259    71382 +   work_underpass_location_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_underpass_location_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.work_underpass_location_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71373 #   work_underpass_location_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_underpass_location_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.work_underpass_location_ogc_fid_seq;
       public          tuic    false    5            �           1259    71391 +   work_urban_agricultural_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_urban_agricultural_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.work_urban_agricultural_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71113 #   work_urban_agricultural_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_urban_agricultural_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.work_urban_agricultural_ogc_fid_seq;
       public          tuic    false    5            �           1259    71401 &   work_urban_reserve_history_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_urban_reserve_history_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.work_urban_reserve_history_ogc_fid_seq;
       public          tuic    false    5            �           1259    71123    work_urban_reserve_ogc_fid_seq    SEQUENCE     �   CREATE SEQUENCE public.work_urban_reserve_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.work_urban_reserve_ogc_fid_seq;
       public          tuic    false    5            �          0    68742 )   app_calcu_monthly_socl_welfare_people_ppl 
   TABLE DATA           �   COPY public.app_calcu_monthly_socl_welfare_people_ppl (district, is_low_middle_income, is_disabled, is_disabled_allowance, is_low_income, _ctime, _mtime, ogc_fid) FROM stdin;
    public          tuic    false    223   0�                0    69019    building_unsued_land 
   TABLE DATA             COPY public.building_unsued_land (thekey, thename, thelink, aa48, aa49, aa10, aa21, aa22, kcnt, cada_text, aa17, aa16, aa46, "cadastral map_key_地籍圖key值", "10712土地_1_土地權屬情形", "10712土地_1_管理機關", area, _ctime, _mtime, ogc_fid) FROM stdin;
    public          tuic    false    256   z�                0    69054    building_unsued_public 
   TABLE DATA           [  COPY public.building_unsued_public (full_key, "建物管理機關", "行政區", "門牌", "建物標示", "建築完成日期", "閒置樓層_閒置樓層/該建物總樓層", "閒置面積㎡", "房屋現況", "原使用用途", "基地所有權人", "基地管理機關", "土地使用分區", "目前執行情形", _ctime, _mtime) FROM stdin;
    public          tuic    false    260   ��      q          0    70012    patrol_criminal_case 
   TABLE DATA           Y  COPY public.patrol_criminal_case ("破獲件數/總計[件]", "破獲率[%]", "犯罪人口率[人/十萬人]", "嫌疑犯[人]", "發生件數[件]", "破獲件數/他轄[件]", "破獲件數/積案[件]", _id, "破獲件數/當期[件]", "發生率[件/十萬人]", "實際員警人數[人]", "年月別", _ctime, _mtime, ogc_fid) FROM stdin;
    public          tuic    false    352   �      �          0    70252    patrol_rain_floodgate 
   TABLE DATA           �   COPY public.patrol_rain_floodgate (ogc_fid, station_no, station_name, rec_time, all_pumb_lights, pumb_num, door_num, river_basin, warning_level, start_pumping_level, lng, lat, _ctime, _mtime) FROM stdin;
    public          tuic    false    381   o      �          0    70551    socl_welfare_organization_plc 
   TABLE DATA           ~   COPY public.socl_welfare_organization_plc (main_type, sub_type, name, address, lon, lat, _ctime, _mtime, ogc_fid) FROM stdin;
    public          tuic    false    415   k      /          0    77973    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       
   igorho2000    false    505   �i                 0    0     building_publand_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public." building_publand_ogc_fid_seq"', 1, true);
          public          tuic    false    210                       0    0 "   SOCL_export_filter_ppl_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."SOCL_export_filter_ppl_ogc_fid_seq"', 1, true);
          public          tuic    false    211                       0    0 3   app_calcu_daily_sentiment_voice1999_109_ogc_fid_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.app_calcu_daily_sentiment_voice1999_109_ogc_fid_seq', 67090, true);
          public          tuic    false    214                       0    0 1   app_calcu_hour_traffic_info_histories_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.app_calcu_hour_traffic_info_histories_ogc_fid_seq', 15701, true);
          public          tuic    false    215                       0    0 *   app_calcu_hour_traffic_youbike_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.app_calcu_hour_traffic_youbike_ogc_fid_seq', 22724, true);
          public          tuic    false    216                       0    0 :   app_calcu_hourly_it_5g_smart_all_pole_device_log_dev13_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.app_calcu_hourly_it_5g_smart_all_pole_device_log_dev13_seq', 4172815, true);
          public          tuic    false    217                       0    0 2   app_calcu_month_traffic_info_histories_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.app_calcu_month_traffic_info_histories_ogc_fid_seq', 1128, true);
          public          tuic    false    221                       0    0 -   app_calcu_monthly_socl_welfare_people_ppl_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.app_calcu_monthly_socl_welfare_people_ppl_seq', 247, true);
          public          tuic    false    222                       0    0 %   app_calcu_patrol_rainfall_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.app_calcu_patrol_rainfall_ogc_fid_seq', 612676, true);
          public          tuic    false    218                       0    0 (   app_calcu_sentiment_dispatch_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.app_calcu_sentiment_dispatch_ogc_fid_seq', 1, true);
          public          tuic    false    224                       0    0 '   app_calcu_traffic_todaywork_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.app_calcu_traffic_todaywork_ogc_fid_seq', 4690, true);
          public          tuic    false    227                       0    0 (   app_calcu_weekly_dispatching_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.app_calcu_weekly_dispatching_ogc_fid_seq', 8615, true);
          public          tuic    false    212                       0    0 (   app_calcu_weekly_hellotaipei_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.app_calcu_weekly_hellotaipei_ogc_fid_seq', 35582, true);
          public          tuic    false    228                       0    0 +   app_calcu_weekly_metro_capacity_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.app_calcu_weekly_metro_capacity_ogc_fid_seq', 1, true);
          public          tuic    false    229                       0    0 6   app_calcu_weekly_metro_capacity_threshould_ogc_fid_seq    SEQUENCE SET     j   SELECT pg_catalog.setval('public.app_calcu_weekly_metro_capacity_threshould_ogc_fid_seq', 1937419, true);
          public          tuic    false    230                       0    0 )   app_calcul_weekly_hellotaipei_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.app_calcul_weekly_hellotaipei_ogc_fid_seq', 50276, true);
          public          tuic    false    231                        0    0 &   app_traffic_lives_accident_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.app_traffic_lives_accident_ogc_fid_seq', 223, true);
          public          tuic    false    225            !           0    0 4   app_traffic_metro_capacity_realtime_stat_ogc_fid_seq    SEQUENCE SET     j   SELECT pg_catalog.setval('public.app_traffic_metro_capacity_realtime_stat_ogc_fid_seq', 391928384, true);
          public          tuic    false    226            "           0    0    building_age_ogc_fid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.building_age_ogc_fid_seq', 258569, true);
          public          tuic    false    234            #           0    0 !   building_cadastralmap_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.building_cadastralmap_ogc_fid_seq', 3438485, true);
          public          tuic    false    235            $           0    0    building_landuse_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.building_landuse_ogc_fid_seq', 1, true);
          public          tuic    false    236            %           0    0 $   building_license_history_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.building_license_history_ogc_fid_seq', 1, true);
          public          tuic    false    237            &           0    0    building_license_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.building_license_ogc_fid_seq', 1, true);
          public          tuic    false    238            '           0    0 #   building_permit_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.building_permit_history_ogc_fid_seq', 14018365, true);
          public          tuic    false    240            (           0    0    building_permit_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.building_permit_ogc_fid_seq', 869836, true);
          public          tuic    false    239            )           0    0 $   building_publand_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.building_publand_history_ogc_fid_seq', 1259841, true);
          public          tuic    false    242            *           0    0    building_publand_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.building_publand_ogc_fid_seq', 31804304, true);
          public          tuic    false    241            +           0    0 )   building_renewarea_10_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.building_renewarea_10_history_ogc_fid_seq', 136717, true);
          public          tuic    false    244            ,           0    0 !   building_renewarea_10_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.building_renewarea_10_ogc_fid_seq', 131927, true);
          public          tuic    false    243            -           0    0 )   building_renewarea_40_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.building_renewarea_40_history_ogc_fid_seq', 33825, true);
          public          tuic    false    246            .           0    0 !   building_renewarea_40_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.building_renewarea_40_ogc_fid_seq', 33105, true);
          public          tuic    false    245            /           0    0 )   building_renewunit_12_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.building_renewunit_12_history_ogc_fid_seq', 407217, true);
          public          tuic    false    248            0           0    0 !   building_renewunit_12_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.building_renewunit_12_ogc_fid_seq', 392433, true);
          public          tuic    false    247            1           0    0 )   building_renewunit_20_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.building_renewunit_20_history_ogc_fid_seq', 16936, true);
          public          tuic    false    250            2           0    0 !   building_renewunit_20_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.building_renewunit_20_ogc_fid_seq', 4088, true);
          public          tuic    false    249            3           0    0 )   building_renewunit_30_history_ogc_fid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.building_renewunit_30_history_ogc_fid_seq', 51238740, true);
          public          tuic    false    252            4           0    0 !   building_renewunit_30_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.building_renewunit_30_ogc_fid_seq', 51190290, true);
          public          tuic    false    251            5           0    0 )   building_social_house_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.building_social_house_history_ogc_fid_seq', 46646, true);
          public          tuic    false    254            6           0    0 !   building_social_house_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.building_social_house_ogc_fid_seq', 41822, true);
          public          tuic    false    253            7           0    0 (   building_unsued_land_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.building_unsued_land_history_ogc_fid_seq', 19384, true);
          public          tuic    false    257            8           0    0     building_unsued_land_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.building_unsued_land_ogc_fid_seq', 19429, true);
          public          tuic    false    255            9           0    0 -   building_unsued_nonpublic_history_ogc_fid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.building_unsued_nonpublic_history_ogc_fid_seq', 2464, true);
          public          tuic    false    259            :           0    0 %   building_unsued_nonpublic_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.building_unsued_nonpublic_ogc_fid_seq', 2452, true);
          public          tuic    false    258            ;           0    0 *   building_unsued_public_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.building_unsued_public_history_ogc_fid_seq', 20418, true);
          public          tuic    false    261            <           0    0 "   building_unsued_public_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.building_unsued_public_ogc_fid_seq', 19, true);
          public          tuic    false    262            =           0    0 #   cvil_public_opinion_evn_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.cvil_public_opinion_evn_ogc_fid_seq', 8501, true);
          public          tuic    false    263            >           0    0 (   cvil_public_opinion_maintype_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.cvil_public_opinion_maintype_ogc_fid_seq', 8, true);
          public          tuic    false    264            ?           0    0 '   cvil_public_opinion_subtype_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.cvil_public_opinion_subtype_ogc_fid_seq', 41, true);
          public          tuic    false    265            @           0    0 -   cwb_city_weather_forecast_history_ogc_fid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.cwb_city_weather_forecast_history_ogc_fid_seq', 234168, true);
          public          tuic    false    267            A           0    0 %   cwb_city_weather_forecast_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.cwb_city_weather_forecast_ogc_fid_seq', 234168, true);
          public          tuic    false    266            B           0    0    cwb_daily_weather_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.cwb_daily_weather_ogc_fid_seq', 653280, true);
          public          tuic    false    268            C           0    0    cwb_hourly_weather_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.cwb_hourly_weather_ogc_fid_seq', 15256546, true);
          public          tuic    false    269            D           0    0 0   cwb_now_weather_auto_station_history_ogc_fid_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.cwb_now_weather_auto_station_history_ogc_fid_seq', 2533563, true);
          public          tuic    false    271            E           0    0 (   cwb_now_weather_auto_station_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.cwb_now_weather_auto_station_ogc_fid_seq', 2533563, true);
          public          tuic    false    270            F           0    0 2   cwb_now_weather_bureau_station_history_ogc_fid_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public.cwb_now_weather_bureau_station_history_ogc_fid_seq', 1387607, true);
          public          tuic    false    273            G           0    0 *   cwb_now_weather_bureau_station_ogc_fid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.cwb_now_weather_bureau_station_ogc_fid_seq', 1387607, true);
          public          tuic    false    272            H           0    0 1   cwb_rainfall_station_location_history_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.cwb_rainfall_station_location_history_ogc_fid_seq', 25222, true);
          public          tuic    false    274            I           0    0 )   cwb_rainfall_station_location_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.cwb_rainfall_station_location_ogc_fid_seq', 25222, true);
          public          tuic    false    219            J           0    0 -   cwb_town_weather_forecast_history_ogc_fid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.cwb_town_weather_forecast_history_ogc_fid_seq', 258050, true);
          public          tuic    false    276            K           0    0 %   cwb_town_weather_forecast_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.cwb_town_weather_forecast_ogc_fid_seq', 241344, true);
          public          tuic    false    275            L           0    0 2   edu_elementary_school_district_history_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.edu_elementary_school_district_history_ogc_fid_seq', 1584, true);
          public          tuic    false    278            M           0    0 *   edu_elementary_school_district_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.edu_elementary_school_district_ogc_fid_seq', 1584, true);
          public          tuic    false    277            N           0    0 8   edu_eleschool_dist_by_administrative_history_ogc_fid_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('public.edu_eleschool_dist_by_administrative_history_ogc_fid_seq', 6147, true);
          public          tuic    false    280            O           0    0 0   edu_eleschool_dist_by_administrative_ogc_fid_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.edu_eleschool_dist_by_administrative_ogc_fid_seq', 6147, true);
          public          tuic    false    279            P           0    0 7   edu_jhschool_dist_by_administrative_history_ogc_fid_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.edu_jhschool_dist_by_administrative_history_ogc_fid_seq', 5380, true);
          public          tuic    false    282            Q           0    0 /   edu_jhschool_dist_by_administrative_ogc_fid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.edu_jhschool_dist_by_administrative_ogc_fid_seq', 5380, true);
          public          tuic    false    281            R           0    0 3   edu_junior_high_school_district_history_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.edu_junior_high_school_district_history_ogc_fid_seq', 891, true);
          public          tuic    false    284            S           0    0 +   edu_junior_high_school_district_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.edu_junior_high_school_district_ogc_fid_seq', 891, true);
          public          tuic    false    283            T           0    0    edu_school_history_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.edu_school_history_ogc_fid_seq', 5704, true);
          public          tuic    false    286            U           0    0    edu_school_ogc_fid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.edu_school_ogc_fid_seq', 5704, true);
          public          tuic    false    285            V           0    0 *   edu_school_romm_status_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.edu_school_romm_status_history_ogc_fid_seq', 1, true);
          public          tuic    false    288            W           0    0 "   edu_school_romm_status_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.edu_school_romm_status_ogc_fid_seq', 1, true);
          public          tuic    false    287            X           0    0 #   eoc_accommodate_history_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.eoc_accommodate_history_ogc_fid_seq', 1, true);
          public          tuic    false    290            Y           0    0    eoc_accommodate_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.eoc_accommodate_ogc_fid_seq', 1, true);
          public          tuic    false    289            Z           0    0 %   eoc_disaster_case_history_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.eoc_disaster_case_history_ogc_fid_seq', 1, true);
          public          tuic    false    292            [           0    0    eoc_disaster_case_ogc_fid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.eoc_disaster_case_ogc_fid_seq', 1, true);
          public          tuic    false    291            \           0    0 #   eoc_leave_house_history_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.eoc_leave_house_history_ogc_fid_seq', 1, true);
          public          tuic    false    294            ]           0    0    eoc_leave_house_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.eoc_leave_house_ogc_fid_seq', 1, true);
          public          tuic    false    293            ^           0    0    ethc_building_check_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.ethc_building_check_ogc_fid_seq', 25135, true);
          public          tuic    false    295            _           0    0    ethc_check_calcu_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ethc_check_calcu_ogc_fid_seq', 9685, true);
          public          tuic    false    296            `           0    0    ethc_check_summary_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.ethc_check_summary_ogc_fid_seq', 651, true);
          public          tuic    false    298            a           0    0    ethc_fire_check_ogc_fid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ethc_fire_check_ogc_fid_seq', 9385, true);
          public          tuic    false    297            b           0    0 )   fire_hydrant_location_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.fire_hydrant_location_history_ogc_fid_seq', 29966, true);
          public          tuic    false    300            c           0    0 !   fire_hydrant_location_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.fire_hydrant_location_ogc_fid_seq', 1, true);
          public          tuic    false    299            d           0    0     fire_to_hospital_ppl_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.fire_to_hospital_ppl_ogc_fid_seq', 2519111, true);
          public          tuic    false    301            e           0    0    heal_aed_history_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.heal_aed_history_ogc_fid_seq', 25751, true);
          public          tuic    false    303            f           0    0    heal_aed_ogc_fid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.heal_aed_ogc_fid_seq', 25751, true);
          public          tuic    false    302            g           0    0    heal_clinic_history_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.heal_clinic_history_ogc_fid_seq', 39851, true);
          public          tuic    false    305            h           0    0    heal_clinic_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.heal_clinic_ogc_fid_seq', 39851, true);
          public          tuic    false    304            i           0    0 !   heal_hospital_history_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.heal_hospital_history_ogc_fid_seq', 380, true);
          public          tuic    false    307            j           0    0    heal_hospital_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.heal_hospital_ogc_fid_seq', 380, true);
          public          tuic    false    306            k           0    0    heal_suicide_evn_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.heal_suicide_evn_ogc_fid_seq', 7091, true);
          public          tuic    false    308            l           0    0    it_5G_smart_pole_ogc_fid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."it_5G_smart_pole_ogc_fid_seq"', 1, true);
          public          tuic    false    309            m           0    0 +   it_5g_smart_all_pole_device_log_history_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.it_5g_smart_all_pole_device_log_history_seq', 6783542, true);
          public          tuic    false    312            n           0    0 +   it_5g_smart_all_pole_device_log_ogc_fid_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.it_5g_smart_all_pole_device_log_ogc_fid_seq', 9384108, true);
          public          tuic    false    311            o           0    0 $   it_5g_smart_all_pole_log_history_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.it_5g_smart_all_pole_log_history_seq', 644, true);
          public          tuic    false    314            p           0    0    it_5g_smart_all_pole_log_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.it_5g_smart_all_pole_log_seq', 644, true);
          public          tuic    false    313            q           0    0    it_5g_smart_pole_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.it_5g_smart_pole_ogc_fid_seq', 6893026, true);
          public          tuic    false    310            r           0    0 (   it_signal_population_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.it_signal_population_history_ogc_fid_seq', 6078536, true);
          public          tuic    false    316            s           0    0     it_signal_population_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.it_signal_population_ogc_fid_seq', 6078536, true);
          public          tuic    false    315            t           0    0 %   it_signal_tourist_history_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.it_signal_tourist_history_ogc_fid_seq', 16738, true);
          public          tuic    false    213            u           0    0    it_signal_tourist_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.it_signal_tourist_ogc_fid_seq', 16720, true);
          public          tuic    false    317            v           0    0 -   it_taipeiexpo_people_flow_history_ogc_fid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.it_taipeiexpo_people_flow_history_ogc_fid_seq', 4314, true);
          public          tuic    false    319            w           0    0 %   it_taipeiexpo_people_flow_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.it_taipeiexpo_people_flow_ogc_fid_seq', 4314, true);
          public          tuic    false    318            x           0    0    it_tpe_ticket_event_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.it_tpe_ticket_event_ogc_fid_seq', 26437, true);
          public          tuic    false    320            y           0    0 %   it_tpe_ticket_member_hold_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.it_tpe_ticket_member_hold_ogc_fid_seq', 110050, true);
          public          tuic    false    321            z           0    0    it_tpe_ticket_place_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.it_tpe_ticket_place_ogc_fid_seq', 10702, true);
          public          tuic    false    322            {           0    0     it_tpe_ticket_ticket_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.it_tpe_ticket_ticket_ogc_fid_seq', 12670, true);
          public          tuic    false    323            |           0    0 $   it_tpefree_daily_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.it_tpefree_daily_history_ogc_fid_seq', 6478334, true);
          public          tuic    false    325            }           0    0    it_tpefree_daily_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.it_tpefree_daily_ogc_fid_seq', 100814877, true);
          public          tuic    false    324            ~           0    0 '   it_tpefree_location_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.it_tpefree_location_history_ogc_fid_seq', 3802, true);
          public          tuic    false    327                       0    0    it_tpefree_location_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.it_tpefree_location_ogc_fid_seq', 4142, true);
          public          tuic    false    326            �           0    0 '   it_tpefree_realtime_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.it_tpefree_realtime_history_ogc_fid_seq', 50558539, true);
          public          tuic    false    329            �           0    0    it_tpefree_realtime_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.it_tpefree_realtime_ogc_fid_seq', 92942265, true);
          public          tuic    false    328            �           0    0 (   it_tpmo_poc_location_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.it_tpmo_poc_location_history_ogc_fid_seq', 31968, true);
          public          tuic    false    331            �           0    0     it_tpmo_poc_location_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.it_tpmo_poc_location_ogc_fid_seq', 31968, true);
          public          tuic    false    330            �           0    0     it_venue_people_flow_history_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.it_venue_people_flow_history_seq', 647366, true);
          public          tuic    false    332            �           0    0     it_venue_people_flow_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.it_venue_people_flow_ogc_fid_seq', 1, true);
          public          tuic    false    333            �           0    0 "   mrtp_carweight_history_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.mrtp_carweight_history_ogc_fid_seq', 7475523, true);
          public          tuic    false    339            �           0    0    mrtp_carweight_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mrtp_carweight_ogc_fid_seq', 7475523, true);
          public          tuic    false    338            �           0    0 +   patrol_artificial_slope_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.patrol_artificial_slope_history_ogc_fid_seq', 1, true);
          public          tuic    false    347            �           0    0 #   patrol_artificial_slope_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.patrol_artificial_slope_ogc_fid_seq', 383867, true);
          public          tuic    false    346            �           0    0    patrol_box_ogc_fid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.patrol_box_ogc_fid_seq', 18491, true);
          public          tuic    false    348            �           0    0    patrol_camera_hls_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.patrol_camera_hls_ogc_fid_seq', 1717, true);
          public          tuic    false    349            �           0    0    patrol_car_theft_ogc_fid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.patrol_car_theft_ogc_fid_seq', 518, true);
          public          tuic    false    350            �           0    0     patrol_criminal_case_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.patrol_criminal_case_ogc_fid_seq', 30376, true);
          public          tuic    false    351            �           0    0 !   patrol_debris_history_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.patrol_debris_history_ogc_fid_seq', 24204, true);
          public          tuic    false    353            �           0    0    patrol_debris_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.patrol_debris_ogc_fid_seq', 1726, true);
          public          tuic    false    354            �           0    0 %   patrol_debrisarea_history_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.patrol_debrisarea_history_ogc_fid_seq', 20521, true);
          public          tuic    false    356            �           0    0    patrol_debrisarea_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.patrol_debrisarea_ogc_fid_seq', 22384, true);
          public          tuic    false    355            �           0    0 *   patrol_designate_place_history_ogc_fid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.patrol_designate_place_history_ogc_fid_seq', 103170, true);
          public          tuic    false    358            �           0    0 "   patrol_designate_place_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.patrol_designate_place_ogc_fid_seq', 103748, true);
          public          tuic    false    357            �           0    0    patrol_district_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.patrol_district_ogc_fid_seq', 90, true);
          public          tuic    false    359            �           0    0 #   patrol_eoc_case_history_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.patrol_eoc_case_history_ogc_fid_seq', 10132, true);
          public          tuic    false    361            �           0    0    patrol_eoc_case_ogc_fid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.patrol_eoc_case_ogc_fid_seq', 9321, true);
          public          tuic    false    360            �           0    0 (   patrol_eoc_designate_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.patrol_eoc_designate_history_ogc_fid_seq', 1066, true);
          public          tuic    false    363            �           0    0     patrol_eoc_designate_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.patrol_eoc_designate_ogc_fid_seq', 1066, true);
          public          tuic    false    362            �           0    0 '   patrol_fire_brigade_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.patrol_fire_brigade_history_ogc_fid_seq', 19090, true);
          public          tuic    false    365            �           0    0    patrol_fire_brigade_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.patrol_fire_brigade_ogc_fid_seq', 19136, true);
          public          tuic    false    364            �           0    0 ,   patrol_fire_disqualified_history_ogc_fid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.patrol_fire_disqualified_history_ogc_fid_seq', 7815, true);
          public          tuic    false    367            �           0    0 $   patrol_fire_disqualified_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.patrol_fire_disqualified_ogc_fid_seq', 7778, true);
          public          tuic    false    366            �           0    0 '   patrol_fire_rescure_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.patrol_fire_rescure_history_ogc_fid_seq', 416367, true);
          public          tuic    false    369            �           0    0    patrol_fire_rescure_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.patrol_fire_rescure_ogc_fid_seq', 415225, true);
          public          tuic    false    368            �           0    0    patrol_flood_100_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.patrol_flood_100_ogc_fid_seq', 3, true);
          public          tuic    false    370            �           0    0    patrol_flood_130_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.patrol_flood_130_ogc_fid_seq', 3, true);
          public          tuic    false    371            �           0    0    patrol_flood_78_8_ogc_fid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.patrol_flood_78_8_ogc_fid_seq', 3, true);
          public          tuic    false    372            �           0    0 #   patrol_motorcycle_theft_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.patrol_motorcycle_theft_ogc_fid_seq', 702, true);
          public          tuic    false    373            �           0    0 )   patrol_old_settlement_history_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.patrol_old_settlement_history_ogc_fid_seq', 1, true);
          public          tuic    false    375            �           0    0 !   patrol_old_settlement_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.patrol_old_settlement_ogc_fid_seq', 340, true);
          public          tuic    false    374            �           0    0     patrol_police_region_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.patrol_police_region_ogc_fid_seq', 90, true);
          public          tuic    false    376            �           0    0 )   patrol_police_station_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.patrol_police_station_history_ogc_fid_seq', 15488, true);
          public          tuic    false    378            �           0    0 !   patrol_police_station_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.patrol_police_station_ogc_fid_seq', 215783, true);
          public          tuic    false    377            �           0    0     patrol_police_station_ogc_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.patrol_police_station_ogc_id_seq', 1, true);
          public          tuic    false    379            �           0    0 )   patrol_rain_floodgate_history_ogc_fid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.patrol_rain_floodgate_history_ogc_fid_seq', 3784767, true);
          public          tuic    false    382            �           0    0 !   patrol_rain_floodgate_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.patrol_rain_floodgate_ogc_fid_seq', 3776990, true);
          public          tuic    false    380            �           0    0 (   patrol_rain_rainfall_history_ogc_fid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.patrol_rain_rainfall_history_ogc_fid_seq', 15653401, true);
          public          tuic    false    384            �           0    0     patrol_rain_rainfall_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.patrol_rain_rainfall_ogc_fid_seq', 13849310, true);
          public          tuic    false    383            �           0    0 %   patrol_rain_sewer_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.patrol_rain_sewer_history_ogc_fid_seq', 8206620, true);
          public          tuic    false    386            �           0    0    patrol_rain_sewer_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.patrol_rain_sewer_ogc_fid_seq', 7905081, true);
          public          tuic    false    385            �           0    0    patrol_rain_sewer_ogc_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.patrol_rain_sewer_ogc_id_seq', 1, true);
          public          tuic    false    387            �           0    0     patrol_random_robber_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.patrol_random_robber_ogc_fid_seq', 20, true);
          public          tuic    false    388            �           0    0     patrol_random_snatch_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.patrol_random_snatch_ogc_fid_seq', 31, true);
          public          tuic    false    389            �           0    0 '   patrol_residential_burglary_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.patrol_residential_burglary_ogc_fid_seq', 3231, true);
          public          tuic    false    390            �           0    0 &   poli_traffic_violation_evn_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.poli_traffic_violation_evn_ogc_fid_seq', 1331036, true);
          public          tuic    false    391            �           0    0 /   poli_traffic_violation_mapping_code_ogc_fid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.poli_traffic_violation_mapping_code_ogc_fid_seq', 6, true);
          public          tuic    false    392            �           0    0    record_db_mtime_ogc_fid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.record_db_mtime_ogc_fid_seq', 227, true);
          public          tuic    false    393            �           0    0 $   sentiment_councillor_109_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.sentiment_councillor_109_ogc_fid_seq', 8645017, true);
          public          tuic    false    394            �           0    0 !   sentiment_dispatching_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.sentiment_dispatching_ogc_fid_seq', 2354258, true);
          public          tuic    false    395            �           0    0 &   sentiment_hello_taipei_109_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.sentiment_hello_taipei_109_ogc_fid_seq', 841010535, true);
          public          tuic    false    396            �           0    0 +   sentiment_hello_taipei_109_test_ogc_fid_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.sentiment_hello_taipei_109_test_ogc_fid_seq', 9601315, true);
          public          tuic    false    397            �           0    0    sentiment_hotnews_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.sentiment_hotnews_ogc_fid_seq', 2147485712, true);
          public          tuic    false    398            �           0    0 #   sentiment_voice1999_109_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.sentiment_voice1999_109_ogc_fid_seq', 38542042, true);
          public          tuic    false    399            �           0    0    socl_case_study_ppl_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.socl_case_study_ppl_ogc_fid_seq', 210, true);
          public          tuic    false    400            �           0    0 #   socl_dept_epidemic_info_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.socl_dept_epidemic_info_ogc_fid_seq', 15600, true);
          public          tuic    false    401            �           0    0 &   socl_domestic_violence_evn_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.socl_domestic_violence_evn_ogc_fid_seq', 28494, true);
          public          tuic    false    402            �           0    0 "   socl_export_filter_ppl_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.socl_export_filter_ppl_ogc_fid_seq', 1186, true);
          public          tuic    false    403            �           0    0 +   socl_order_concern_mapping_code_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.socl_order_concern_mapping_code_ogc_fid_seq', 42, true);
          public          tuic    false    404            �           0    0 "   socl_order_concern_ppl_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.socl_order_concern_ppl_ogc_fid_seq', 270588, true);
          public          tuic    false    405            �           0    0 $   socl_welfare_dis_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.socl_welfare_dis_history_ogc_fid_seq', 2232259, true);
          public          tuic    false    407            �           0    0    socl_welfare_dis_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.socl_welfare_dis_ogc_fid_seq', 9490987, true);
          public          tuic    false    406            �           0    0 '   socl_welfare_dislow_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.socl_welfare_dislow_history_ogc_fid_seq', 90324, true);
          public          tuic    false    409            �           0    0    socl_welfare_dislow_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.socl_welfare_dislow_ogc_fid_seq', 158138, true);
          public          tuic    false    408            �           0    0 $   socl_welfare_low_history_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.socl_welfare_low_history_ogc_fid_seq', 711436, true);
          public          tuic    false    411            �           0    0    socl_welfare_low_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.socl_welfare_low_ogc_fid_seq', 1254473, true);
          public          tuic    false    410            �           0    0 '   socl_welfare_midlow_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.socl_welfare_midlow_history_ogc_fid_seq', 248365, true);
          public          tuic    false    413            �           0    0    socl_welfare_midlow_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.socl_welfare_midlow_ogc_fid_seq', 432236, true);
          public          tuic    false    412            �           0    0 1   socl_welfare_organization_plc_history_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.socl_welfare_organization_plc_history_ogc_fid_seq', 15277, true);
          public          tuic    false    416            �           0    0 )   socl_welfare_organization_plc_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.socl_welfare_organization_plc_ogc_fid_seq', 11588, true);
          public          tuic    false    414            �           0    0 #   socl_welfare_people_ppl_history_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.socl_welfare_people_ppl_history_seq', 2906301, true);
          public          tuic    false    419            �           0    0 #   socl_welfare_people_ppl_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.socl_welfare_people_ppl_ogc_fid_seq', 3626525, true);
          public          tuic    false    417            �           0    0    tdx_bus_live_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tdx_bus_live_ogc_fid_seq', 413748703, true);
          public          tuic    false    420            �           0    0 !   tdx_bus_route_history_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.tdx_bus_route_history_ogc_fid_seq', 1, true);
          public          tuic    false    422            �           0    0    tdx_bus_route_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tdx_bus_route_ogc_fid_seq', 764, true);
          public          tuic    false    421            �           0    0 #   tdx_bus_station_history_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tdx_bus_station_history_ogc_fid_seq', 1, true);
          public          tuic    false    424            �           0    0    tdx_bus_station_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tdx_bus_station_ogc_fid_seq', 1, true);
          public          tuic    false    423            �           0    0    tdx_metro_line_ogc_fid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tdx_metro_line_ogc_fid_seq', 1, true);
          public          tuic    false    425            �           0    0    tdx_metro_station_ogc_fid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tdx_metro_station_ogc_fid_seq', 1, true);
          public          tuic    false    426            �           0    0 4   tour_2023_lantern_festival_mapping_table_ogc_fid_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.tour_2023_lantern_festival_mapping_table_ogc_fid_seq', 9873, true);
          public          tuic    false    334            �           0    0 +   tour_2023_lantern_festival_zone_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.tour_2023_lantern_festival_zone_ogc_fid_seq', 1289, true);
          public          tuic    false    337            �           0    0 3   tour_2023_latern_festival_mapping_table_ogc_fid_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.tour_2023_latern_festival_mapping_table_ogc_fid_seq', 1036, true);
          public          tuic    false    427            �           0    0 +   tour_2023_latern_festival_point_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.tour_2023_latern_festival_point_ogc_fid_seq', 463, true);
          public          tuic    false    335            �           0    0 1   tour_lantern_festival_sysmemorialhall_ogc_fid_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.tour_lantern_festival_sysmemorialhall_ogc_fid_seq', 21940, true);
          public          tuic    false    336            �           0    0    tp_building_bim_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tp_building_bim_ogc_fid_seq', 124557, true);
          public          tuic    false    428            �           0    0    tp_building_height_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tp_building_height_ogc_fid_seq', 373532, true);
          public          tuic    false    429            �           0    0    tp_cht_grid_ogc_fid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tp_cht_grid_ogc_fid_seq', 1, true);
          public          tuic    false    430            �           0    0    tp_district_history_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tp_district_history_ogc_fid_seq', 1, true);
          public          tuic    false    431            �           0    0    tp_fet_age_hr_ogc_fid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tp_fet_age_hr_ogc_fid_seq', 76311, true);
          public          tuic    false    432            �           0    0 %   tp_fet_hourly_popu_by_vil_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.tp_fet_hourly_popu_by_vil_ogc_fid_seq', 2147052, true);
          public          tuic    false    433            �           0    0    tp_fet_work_live_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tp_fet_work_live_ogc_fid_seq', 3329, true);
          public          tuic    false    434            �           0    0    tp_road_center_line_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tp_road_center_line_ogc_fid_seq', 42483, true);
          public          tuic    false    435            �           0    0    tp_village_history_ogc_fid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tp_village_history_ogc_fid_seq', 1, true);
          public          tuic    false    436            �           0    0    tp_village_ogc_fid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tp_village_ogc_fid_seq', 7752, true);
          public          tuic    false    418            �           0    0 %   traffic_accident_location_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.traffic_accident_location_ogc_fid_seq', 14617253, true);
          public          tuic    false    438            �           0    0    traffic_accident_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.traffic_accident_ogc_fid_seq', 626605, true);
          public          tuic    false    437            �           0    0 %   traffic_bus_route_history_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.traffic_bus_route_history_ogc_fid_seq', 1, true);
          public          tuic    false    440            �           0    0    traffic_bus_route_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.traffic_bus_route_ogc_fid_seq', 382, true);
          public          tuic    false    439            �           0    0 '   traffic_bus_station_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.traffic_bus_station_history_ogc_fid_seq', 281151, true);
          public          tuic    false    442            �           0    0    traffic_bus_station_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.traffic_bus_station_ogc_fid_seq', 191699, true);
          public          tuic    false    441            �           0    0    traffic_bus_stop_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.traffic_bus_stop_ogc_fid_seq', 14574913, true);
          public          tuic    false    443            �           0    0 "   traffic_info_histories_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.traffic_info_histories_ogc_fid_seq', 1, true);
          public          tuic    false    444            �           0    0 !   traffic_lives_history_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.traffic_lives_history_ogc_fid_seq', 39323006, true);
          public          tuic    false    446            �           0    0    traffic_lives_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.traffic_lives_ogc_fid_seq', 39327120, true);
          public          tuic    false    445            �           0    0 3   traffic_metro_capacity_realtime_history_ogc_fid_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.traffic_metro_capacity_realtime_history_ogc_fid_seq', 14664414, true);
          public          tuic    false    447            �           0    0 +   traffic_metro_capacity_realtime_ogc_fid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.traffic_metro_capacity_realtime_ogc_fid_seq', 15176475, true);
          public          tuic    false    448            �           0    0 (   traffic_metro_capacity_rtime_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.traffic_metro_capacity_rtime_ogc_fid_seq', 622005, true);
          public          tuic    false    449            �           0    0 &   traffic_metro_line_history_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.traffic_metro_line_history_ogc_fid_seq', 89, true);
          public          tuic    false    451            �           0    0    traffic_metro_line_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.traffic_metro_line_ogc_fid_seq', 59, true);
          public          tuic    false    450            �           0    0 3   traffic_metro_realtime_position_history_ogc_fid_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.traffic_metro_realtime_position_history_ogc_fid_seq', 57265982, true);
          public          tuic    false    453            �           0    0 +   traffic_metro_realtime_position_ogc_fid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.traffic_metro_realtime_position_ogc_fid_seq', 56605498, true);
          public          tuic    false    452            �           0    0 )   traffic_metro_station_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.traffic_metro_station_history_ogc_fid_seq', 4995, true);
          public          tuic    false    455            �           0    0 !   traffic_metro_station_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.traffic_metro_station_ogc_fid_seq', 1620, true);
          public          tuic    false    454            �           0    0 )   traffic_metro_unusual_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.traffic_metro_unusual_history_ogc_fid_seq', 21399, true);
          public          tuic    false    457            �           0    0 !   traffic_metro_unusual_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.traffic_metro_unusual_ogc_fid_seq', 40, true);
          public          tuic    false    456            �           0    0 &   traffic_todayworks_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.traffic_todayworks_history_ogc_fid_seq', 1773800, true);
          public          tuic    false    458            �           0    0 0   traffic_youbike_one_realtime_history_ogc_fid_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.traffic_youbike_one_realtime_history_ogc_fid_seq', 17226614, true);
          public          tuic    false    459            �           0    0 .   traffic_youbike_realtime_histories_ogc_fid_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.traffic_youbike_realtime_histories_ogc_fid_seq', 3422686, true);
          public          tuic    false    460            �           0    0 #   traffic_youbike_station_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.traffic_youbike_station_ogc_fid_seq', 9444, true);
          public          tuic    false    461            �           0    0 0   traffic_youbike_two_realtime_history_ogc_fid_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.traffic_youbike_two_realtime_history_ogc_fid_seq', 17768215, true);
          public          tuic    false    462            �           0    0 2   tran_parking_capacity_realtime_history_ogc_fid_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.tran_parking_capacity_realtime_history_ogc_fid_seq', 82499677, true);
          public          tuic    false    463            �           0    0 *   tran_parking_capacity_realtime_ogc_fid_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.tran_parking_capacity_realtime_ogc_fid_seq', 82499677, true);
          public          tuic    false    345                        0    0     tran_parking_history_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tran_parking_history_ogc_fid_seq', 72536, true);
          public          tuic    false    464                       0    0    tran_parking_ogc_fid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tran_parking_ogc_fid_seq', 73972, true);
          public          tuic    false    344                       0    0 '   tran_ubike_realtime_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.tran_ubike_realtime_history_ogc_fid_seq', 54669867, true);
          public          tuic    false    466                       0    0    tran_ubike_realtime_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.tran_ubike_realtime_ogc_fid_seq', 54669867, true);
          public          tuic    false    465                       0    0 &   tran_ubike_station_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tran_ubike_station_history_ogc_fid_seq', 27533, true);
          public          tuic    false    468                       0    0    tran_ubike_station_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tran_ubike_station_ogc_fid_seq', 27533, true);
          public          tuic    false    467                       0    0 (   tran_urban_bike_path_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.tran_urban_bike_path_history_ogc_fid_seq', 8516, true);
          public          tuic    false    469                       0    0     tran_urban_bike_path_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.tran_urban_bike_path_ogc_fid_seq', 8516, true);
          public          tuic    false    232                       0    0    tw_village_center_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tw_village_center_ogc_fid_seq', 7965, true);
          public          tuic    false    471            	           0    0    tw_village_ogc_fid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tw_village_ogc_fid_seq', 7965, true);
          public          tuic    false    470            
           0    0 !   work_eco_park_history_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.work_eco_park_history_ogc_fid_seq', 184, true);
          public          tuic    false    476                       0    0    work_eco_park_ogc_fid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.work_eco_park_ogc_fid_seq', 184, true);
          public          tuic    false    340                       0    0 +   work_floodgate_location_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.work_floodgate_location_history_ogc_fid_seq', 817, true);
          public          tuic    false    478                       0    0 #   work_floodgate_location_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.work_floodgate_location_ogc_fid_seq', 1, true);
          public          tuic    false    477                       0    0 $   work_garden_city_history_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.work_garden_city_history_ogc_fid_seq', 6796, true);
          public          tuic    false    480                       0    0    work_garden_city_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.work_garden_city_ogc_fid_seq', 6796, true);
          public          tuic    false    479                       0    0 (   work_goose_sanctuary_history_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.work_goose_sanctuary_history_ogc_fid_seq', 9, true);
          public          tuic    false    481                       0    0     work_goose_sanctuary_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.work_goose_sanctuary_ogc_fid_seq', 9, true);
          public          tuic    false    472                       0    0 '   work_nature_reserve_history_ogc_fid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.work_nature_reserve_history_ogc_fid_seq', 12, true);
          public          tuic    false    482                       0    0    work_nature_reserve_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.work_nature_reserve_ogc_fid_seq', 12, true);
          public          tuic    false    473                       0    0    work_park_history_ogc_fid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.work_park_history_ogc_fid_seq', 7632, true);
          public          tuic    false    483                       0    0    work_park_ogc_fid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.work_park_ogc_fid_seq', 7632, true);
          public          tuic    false    341                       0    0 1   work_pumping_station_location_history_ogc_fid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.work_pumping_station_location_history_ogc_fid_seq', 88, true);
          public          tuic    false    485                       0    0 )   work_pumping_station_location_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.work_pumping_station_location_ogc_fid_seq', 1, true);
          public          tuic    false    484                       0    0 2   work_rainfall_station_location_history_ogc_fid_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.work_rainfall_station_location_history_ogc_fid_seq', 164, true);
          public          tuic    false    486                       0    0 *   work_rainfall_station_location_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.work_rainfall_station_location_ogc_fid_seq', 164, true);
          public          tuic    false    220                       0    0 ,   work_riverside_bike_path_history_ogc_fid_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.work_riverside_bike_path_history_ogc_fid_seq', 741, true);
          public          tuic    false    487                       0    0 $   work_riverside_bike_path_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.work_riverside_bike_path_ogc_fid_seq', 749, true);
          public          tuic    false    233                       0    0 '   work_riverside_park_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.work_riverside_park_history_ogc_fid_seq', 742962, true);
          public          tuic    false    488                       0    0    work_riverside_park_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.work_riverside_park_ogc_fid_seq', 742962, true);
          public          tuic    false    342                       0    0 (   work_school_greening_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.work_school_greening_history_ogc_fid_seq', 270, true);
          public          tuic    false    489                       0    0     work_school_greening_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.work_school_greening_ogc_fid_seq', 270, true);
          public          tuic    false    343                        0    0 '   work_sewer_location_history_ogc_fid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.work_sewer_location_history_ogc_fid_seq', 1, true);
          public          tuic    false    491            !           0    0    work_sewer_location_ogc_fid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.work_sewer_location_ogc_fid_seq', 1, true);
          public          tuic    false    490            "           0    0 !   work_sidewalk_history_ogc_fid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.work_sidewalk_history_ogc_fid_seq', 122105, true);
          public          tuic    false    493            #           0    0    work_sidewalk_ogc_fid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.work_sidewalk_ogc_fid_seq', 122105, true);
          public          tuic    false    492            $           0    0 *   work_soil_liquefaction_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.work_soil_liquefaction_history_ogc_fid_seq', 1088, true);
          public          tuic    false    495            %           0    0 "   work_soil_liquefaction_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.work_soil_liquefaction_ogc_fid_seq', 1088, true);
          public          tuic    false    494            &           0    0 %   work_street_light_history_ogc_fid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.work_street_light_history_ogc_fid_seq', 34997771, true);
          public          tuic    false    497            '           0    0    work_street_light_ogc_fid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.work_street_light_ogc_fid_seq', 34997771, true);
          public          tuic    false    496            (           0    0 $   work_street_tree_history_ogc_fid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.work_street_tree_history_ogc_fid_seq', 1035349, true);
          public          tuic    false    499            )           0    0    work_street_tree_ogc_fid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.work_street_tree_ogc_fid_seq', 1075704, true);
          public          tuic    false    498            *           0    0 +   work_underpass_location_history_ogc_fid_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.work_underpass_location_history_ogc_fid_seq', 1, true);
          public          tuic    false    501            +           0    0 #   work_underpass_location_ogc_fid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.work_underpass_location_ogc_fid_seq', 1, true);
          public          tuic    false    500            ,           0    0 +   work_urban_agricultural_history_ogc_fid_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.work_urban_agricultural_history_ogc_fid_seq', 441, true);
          public          tuic    false    502            -           0    0 #   work_urban_agricultural_ogc_fid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.work_urban_agricultural_ogc_fid_seq', 441, true);
          public          tuic    false    474            .           0    0 &   work_urban_reserve_history_ogc_fid_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.work_urban_reserve_history_ogc_fid_seq', 4086, true);
          public          tuic    false    503            /           0    0    work_urban_reserve_ogc_fid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.work_urban_reserve_ogc_fid_seq', 4086, true);
          public          tuic    false    475            C           2606    76360 \   app_calcu_monthly_socl_welfare_people_ppl app_calcu_monthly_socl_welfare_people_ppl_seq_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.app_calcu_monthly_socl_welfare_people_ppl
    ADD CONSTRAINT app_calcu_monthly_socl_welfare_people_ppl_seq_pkey PRIMARY KEY (ogc_fid);
 �   ALTER TABLE ONLY public.app_calcu_monthly_socl_welfare_people_ppl DROP CONSTRAINT app_calcu_monthly_socl_welfare_people_ppl_seq_pkey;
       public            tuic    false    223            E           2606    76416 .   building_unsued_land building_unsued_land_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.building_unsued_land
    ADD CONSTRAINT building_unsued_land_pkey PRIMARY KEY (ogc_fid);
 X   ALTER TABLE ONLY public.building_unsued_land DROP CONSTRAINT building_unsued_land_pkey;
       public            tuic    false    256            G           2606    76586 .   patrol_criminal_case patrol_criminal_case_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.patrol_criminal_case
    ADD CONSTRAINT patrol_criminal_case_pkey PRIMARY KEY (ogc_fid);
 X   ALTER TABLE ONLY public.patrol_criminal_case DROP CONSTRAINT patrol_criminal_case_pkey;
       public            tuic    false    352            I           2606    76636 0   patrol_rain_floodgate patrol_rain_floodgate_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.patrol_rain_floodgate
    ADD CONSTRAINT patrol_rain_floodgate_pkey PRIMARY KEY (ogc_fid);
 Z   ALTER TABLE ONLY public.patrol_rain_floodgate DROP CONSTRAINT patrol_rain_floodgate_pkey;
       public            tuic    false    381            K           2606    76698 @   socl_welfare_organization_plc socl_welfare_organization_plc_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.socl_welfare_organization_plc
    ADD CONSTRAINT socl_welfare_organization_plc_pkey PRIMARY KEY (ogc_fid);
 j   ALTER TABLE ONLY public.socl_welfare_organization_plc DROP CONSTRAINT socl_welfare_organization_plc_pkey;
       public            tuic    false    415            N           2620    77002 ^   app_calcu_monthly_socl_welfare_people_ppl auto_app_calcu_monthly_socl_welfare_people_ppl_mtime    TRIGGER     �   CREATE TRIGGER auto_app_calcu_monthly_socl_welfare_people_ppl_mtime BEFORE INSERT OR UPDATE ON public.app_calcu_monthly_socl_welfare_people_ppl FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
 w   DROP TRIGGER auto_app_calcu_monthly_socl_welfare_people_ppl_mtime ON public.app_calcu_monthly_socl_welfare_people_ppl;
       public          tuic    false    523    223            O           2620    77031 4   building_unsued_land auto_building_unsued_land_mtime    TRIGGER     �   CREATE TRIGGER auto_building_unsued_land_mtime BEFORE INSERT OR UPDATE ON public.building_unsued_land FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
 M   DROP TRIGGER auto_building_unsued_land_mtime ON public.building_unsued_land;
       public          tuic    false    256    523            P           2620    77035 8   building_unsued_public auto_building_unsued_public_mtime    TRIGGER     �   CREATE TRIGGER auto_building_unsued_public_mtime BEFORE INSERT OR UPDATE ON public.building_unsued_public FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
 Q   DROP TRIGGER auto_building_unsued_public_mtime ON public.building_unsued_public;
       public          tuic    false    260    523            Q           2620    77068 4   patrol_criminal_case auto_patrol_criminal_case_mtime    TRIGGER     �   CREATE TRIGGER auto_patrol_criminal_case_mtime BEFORE INSERT OR UPDATE ON public.patrol_criminal_case FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
 M   DROP TRIGGER auto_patrol_criminal_case_mtime ON public.patrol_criminal_case;
       public          tuic    false    352    523            R           2620    77117 F   socl_welfare_organization_plc auto_socl_welfare_organization_plc_mtime    TRIGGER     �   CREATE TRIGGER auto_socl_welfare_organization_plc_mtime BEFORE INSERT OR UPDATE ON public.socl_welfare_organization_plc FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
 _   DROP TRIGGER auto_socl_welfare_organization_plc_mtime ON public.socl_welfare_organization_plc;
       public          tuic    false    523    415            �   :  x����NA��٧�7�����]�Ň�1F�F�$1��h���aOù=Ŷw�/����?�ղ�n�L�cV0L��"Faa��<A�`��X��|�-k�o�����M�8�s)@�h#<�nq_w�)#P!H�@3r#=�:[v��A%�*D���%t/��tMV��q5dHml���|ڳK6H\��3
6�)�������j��4�c�w��g1R 4"P����:]v��]�O�2�m�E���m��=ɱ�~o��[�k8�?OOC�Q�_���6/&e�Fz
��׿���ŏ��=Ow"n����n�!���            x�������>�SwJ[k�!�<P!`l��b1[ 	`�ơ���_��+�[����tJW��v��mݭ�H)Aj�$�'�w~��|��|���p���ɣwv���?���������P� ^��@U�� �w�G7Y�qkD�� (��"%i�j���G����*���rw�����s3R�K	�^��E)_�0	^�?��������� ����鯟��ߧGy���gl�Uٸ���{g�~��(*�&j�=�_#U�w�}�{���W�_����wKS���Bj�����T�w��~�����a�GmQ�mto�
��[3"i�By|����Fo`��7��z@ݞD�Rz����n�������4o��Q��v��}VVhz�i�g��|cH�� �4�K�)F��]t��Ww��@�^��2�3j�,F�7ׯ?�'{��f�GeQ��i��(��t��A������;p�\���S;��1�+I�����="�յs�<�DC�gO�=�Y>55o��၁\ʠ��ɝ@�~t`�SC�誠�K8^�O��U�������m�����{[��p򪯋2n:NFmR�uu��Nqjg���ܴ��^n�V�Y][[Fy�b0����ͲS����3<���>\�|V/�ǂ�nx6Ɂ�cC���l���E]�­���M�]��&?ڇ�ɅSQ�4��������Gɥ�ָp;9j��n���̔�zkF$m�u����u׌d��@�����5|��;�>yt}w�����s����/߃��y�4Z�� QM��{@I���\-�v�=��|�����{������z<u�5��k e�Cvhe<5���|��=�y��H���G?����#U�{TU�E�i9 M��[#蚊�S@�㹕��Ͼy�����FƠA.�U/�a�[`+LM������M�^�b�s3��j	n��nD�������mz��=�Ӄ^B�nh�@[�23F�a���2[������u#;ى� 2�FGNq���X��� �]�+��в�z�nK�����ɭ�w�oX@k��u��e��2嬴)1��il�Y��u}����3����7S�(\]YТ*��}x0��#ek^*ʜ�lŪ�E&��?p�&��� �'l���zϮ�Ҧ�P��mDU���Z�	|<�	9�>^r�Q�9�lf�pxX��cpm&e�&x��+x��V���(|>+�<ε4��[��=ܳM�{<Vq���# m����7?ٜ��.�:��mr
�G)���v���6#u!o�U�܌g ��,6����!ӣ�x��'����Tu�J�W�D�a�t�b��ȭL��!�6���l�@6+dS�!#+�0�܂6=��kyje���R����̾��y���(|8W
�*�������r��2#PZ8�� ���DUΕVb�(;��p(��O��O���'��sm��G���Hㅪ�B�
w������"PX��izQ��pF�e״0>�a���xVV*Vp��&��$_g��j���L�Êry�:�י��K�grw�[��2�]!�8��&��$o��}|D��\M�2」ݹ�o�A_��DQՃ�5�ҍ�����cq$��[�j�]ک�AtJ�)t"�����=}�5�����4iQV�`�^����
���pvZL.�@�V�e�;k���L�as?9
���|'pct��p��1��[���l��N�b�%���^����bl׾����8+@F��F�V��F���{�rl*`�vcn^����={���� �2x�8�$o��3c'�Te���x#Wm�]�3O�6m�׫-�ٻ?�o}�/o(\�1�ʮli��Pm�����$��݊U����<9o��R�V��;�[��^+
������ J;9��֌@i��SX���h�7b�(�N<:o�j�l�����Q�����([?Q�ͻ�aG��l�+C��V��XON9 �r�.�^��w��qc��aE_��Lf�����}I�R��ڟC�W�Y�gf�Ԙ����۩�a�ţ�&q71f����z��O<3
ת?���2��ԅ�bɬ6Fp=��h��F�M��F��d�z<*��p[y����E�`fn��mq�I�\��]L���p%P�;�)݉�P����U�ۗ� ����r6o|p�eW��<��F��4���O�|{����
*{Q[Tu�Sq+���L咘ƐH�(�*���[�j�_ч�[zm�4b`���\����������ue3T�\��Ќ�쮶F�������U��p���-��۝��V�%w�p�|\�r3;�}"w�;Y�3�?�ۯ��1�̭d�z`�����>q� �I� 3w8�;��Ê[����'����
��|�$�[�r��P�wq���������y������~ɭ��Gr%\�q�~�RQ�{���8�'���#7���%��g��~�����Nt<m�=C�f���9�qq��y��/�u	e������6�SB�\۷~"�.���\rw�yی��n��:LZn���c��׷OK�8;%��M����_�?�ǳ�Ez]��L�I)f��1�|d'@�[i��ő�&�3��e.��6�R��e�(��c��)������ݪ�I��]�4e9=���T�f�1����Q�T+,ʝ(�Z�}N���0�*�E��p>��D-���iV�N7��4k�Kl�΋Ǿ��1N3*��9@e�qew6R~�*�#��q��b*q�R��!>���<�t���8�ge�e��6f��5����2�t�R�x+VM�s��Dt�У�Ƭ/�������uiS�i��U�����~�2̭dƵMƈ�\�����V���39>�чCX��db>�ݺ�1�c�Đ�\���)yq�_�d�ڎ@q���E�Tب�j��@�v�)��aUs�z��ݧ�����9ܴF��M�S�t�]�#�5�TB�\1b�]��y�xv9��R&���E����o���~c?\�T����M�WOke�V#uqyK3���݊U���W����b��Ƒ����Ě�@�E��w�V��a�u>&n�R^��)F���KF�0V�|uvvV�YW�L�JY G}��gz4�j�.��K�>d-/W�E;"���]M�]��$�գYu+��uc;ۉ���N,���v,�����+�?�Q��zV6�P܁��?l��u�CZ���g���2�Y	������RG��>�����\����Jl��Z3"k���ա�W��(렏��.�������?"��m��~�,��I�|�ɺ��3�/�c?xd��iJ��:�9���}�?�2p'�9���1vQV)�;�nq;�E���T5�q�2.�{���^�S�1�������&�yWr_�3�_4򹠱��M�\��~��q\���pӂg}W���*Gn���&��.��g��J�VY��o���KP��eCmQս�t~�+�WfD���=X��	�`5��fz���{�us��<
W���܋��d��ƗC2��5��.�"(s�X�ʧ���e����F���v��	>�+�Ԉp+w~����]������ <}�-�6׶�����f�\�rm
��R�k�~j��d[*�D_�f�V�d�mnf��]��+)���~����_�nG�C�S1HQFo���ګ5���H�Q�no��Ev����\��F�r~�M:���1��(|�"�ڢ�+JŶ�Y�֌H�"��W&����F�e��{�*,ѡt�R_��Ǩ��<:��o��_��
}8:��M�������;�?dXQWT�ty����ǜ_m�>����X��F�Û��3vS�~
[��K������	]�Mn��}�V���=8�4n�����{m#�-�EU6�E�('�UY�V�D�@�\��M���fy�ux�k���~x`�A��q{s�����,���,�]?�c����\���v��|�M{���`����{QW*�I����]N�]�a�(�43<�1��{Q�e��|+K��=loiñ�vK������l'J����Α^��=M�7��r�*��]�5�C�É��TkQ�P���[�9�ژ�@#S�_]MeĪQ>�8�y�!�C�*��G�E
��g�򇸍�[Hz=���
A�    ����f��,�og�������G2��         �  x�՚�RIǯ�)�r��Lu�|������0���@@��Ɛ���F">L8=3W�
{�gf�-S�cY�Ō����}�����w�.^؅�1^]�Kv��1{�@᧟����}�I@���J5z]�#f(�M�~��cH^@��N�cv��t���PX��)g�?���ӴO��v��9�\�L�I\A��_�C�̮��B�kN2?�\�L,�a�"�/2�Q���7�I���$��l�:Ԍ�2T���* ǁVK�~.�ou|:dUMÃ�e�3� �x�����S�2F�P@ԟ�%�Ҟ�<���o��զ N�����϶?���ѻ��;�Q@��ߺ���\Z�)Zե�d
�)\�)\��5'��q#R�Ɯ�l���q3R�漸t
�)����j2�A�H�b�/TM�$Z�T�o���p!Y�~[�"�n�H�Dօ�-�$%늟u�R4�u�����~���>��n+PL��	�k�~�E���1	��]V��0�V׾l�욳w�򿂕=�
�栓΢u8��Ma����[�/7��Y��C�������i�nk��x��w�B���dh�DsW�ǚ܄�tS�e�'N���Զ�~��ߡX�S�V-�.�?&�!��E|�g�<�P�E����T��{r��H"�q��q?s�C:]%z�n�+�V���k�ԩ$xk�%���g_�����R�W2x� �����U��$T�*&�
���|}[����Y{0��77]7�ҽ#��E��j��5J[�j�et�`�/M�qCe��-34I�$*3_1�o���7	������ҸKx����
8L�#�k�BF�S8�a^j�D:K��0�2�lکk�Y��[.�X��ϩ��*$2Э�
B�TH�VK&��c+��9�S�T'��݋)��F/�iDq��&2��(��M��b?�<B׷����_�ӏN*��H��s��x���(d��᠗���Q�@X��^���lA�A4�Hg4CJ@��ſ�� JX���>�3v��R�m�ww�a/���Ձ�W,yw$��RMp�𛔛5�M���ݑ�Cs��	��zX�M7�3YA`x�� ���;�3(�==4U��~�Do�,���zX'����"%*��-�v��-�N�����!ǈ��X��VAx<S��|Y��,���x�g`o��CER3�wE@��
b+�Hq� 1��V�n���1���(�>�t���$>��M
.�E4���Ē�l9J��Yp�PbjC�4�0Q�u����Әk����iu���y(�h�a 	7���=�C��L���-�w�hA�a�t�7��0�}�*~25M�*�x!� ��Ϧh��S��k=������U(f*��� 8�uq!䋢,�Y�%��%.<�2I�n$}����r�նg�P��q�{^>ʲ:S�����m22 EO-,
�Q~��Fi���b�o�:����%T���Ҋ��P�n�ߨ���jM6��� ��ĳ��p1��W� h�uk&j�D"1�bT"�h�ŨF�q��8�Q�2�J�b��ސ*��D��+\g��~��h�ex`�^����~?!�&*�#���{���%��.T��2��"��!�
%g��l"e�&��w��%&Kv��h��iS1�Q%�9/C�>5'�9y8B#���и�|�wnI�sOs)������Q�Pc����P�������wQ�ϯ���K��~�iǘ�&���EF]AT�?cW��8߃��u���Q��E��
����ǯ6���E>�YXX�6� �      q   �  x���I��0E��)j߈��b�������Ζ�8v=sx��Ɉ������144�/�o�Y�!�1�Z�D8��ڗ�C��!ٗ��{��ܴɇ�����Wmg�J�yɲ�j�M����Z�a/�&� -U��1�KYyĚ�0�L���|�a�� D�Bhb�Y� ak�N�Q��)݁�>E_kA��d"�R@�4�+s�<���`3�e�C�j20���.�@E,<4a"�"Z�R��\Ic�\�q �$�D���Y�Bd�hB襎NL�Q�0�>ַH=�@��2�CHj3�l���@,�g�$�@����_��A,o2���6Ҧ�v#c�ܞ��ẫ��`jA�R�7b["OE�7�.	���m	>�ĝ�v�t�Y�zy�`=x 5�X��%A�2n�#�e3����1�q�b]�hɊ)ȋL��%�LYw��Qf@�qShwt�Tnf�$�Qgj��(���OB�2�g��E!�-��K�m�ICv>�v>h�Q��3���QQMa&.Da>鴇�Z�$���F�O�>�ģI!��1���V�f=>���Le�N���1<6EqϘ��(���$'�/����3�y=[�&�1< ���UB�	bvP���I�$���Ǚ��o$�����m��Ѣ������q��]敖#M̶��hc|��1��q���u�p��      �   �  x����n��?7O��ȫ����>�y�<L�B���'�l_@���`��g���z�纞�%��%���������U��Q��|��@�j]�u�5TS�S)�J'օ�����ʓς&N��01`�����o�g�u�k��!�@%%�	��見H	���.�{D��:D�G��b$BP����u!F����ACdu��D�Y�)�3�+���b�H	���h�S$�N�H���DF����{_ǉ�G�8F�A��]"��P"N��'���!W�JYc"p�"��(���	�@tu���<ʩ�#Y#>gM��"+[k�*���գ�5<k�����"	�a�5و�9J�K�J�r�iI
���F"�H��q�O�� ��r��8>�%��*I0��HC��ࠗ/�ʣ�姍��=�P���q����I/9|��}\�{s�Vh�Z2β�F���w/I��������
�1�K��d �ȥ궠247/� -�����[�YW�J[��z1Rng�� �2�f���5�s��r����n�L	Y�0`ż�q*"k1K7�����ϥ��H���2ᒮ�4+S�J�)�};�����<~=��0I>o�>o�mj��?��FDAID���կ_Ɖ�^���*{�x[I������A[K� ��w����"�T���A
��)�{V��i����%�����)G!qBP�������iӽ�,�FR��X{�恽�IH�����)��[�A9��T��$Ě�����Z2�v�4u;A[�coʑ9���,ml�_�D��z �����aRJ�%sAQ�,η�-%\'H`�D�d��`)=[%��j��8x�*H}���*��F�ȣ�������X��n��_7�ֿ�t饼��˚��	��C�������kʻ/��\IL%�����|����*u�g�gC�Ԧ�U�˒�T��V}�΃�B��1V�N|>��L*N{�/'<�]�Bꤰ_�)u�^�y�e�J	>�	�����gF���sqY 3�9Vqv�Q�ۃk"��_��D�jҧ(F
�69ҧ��	��]j0m��5�Kj.��}��&�t���*�O?�?^��3��|vkJjO���aaI�?�)�Vm�T�f����}�uʤ�ܠ4�ւ�� �,�D��=;���(w�$"��:uF�0���;�Y��Բ�z�]���{���������{�,�Rc~���f�S���()�l;_|�N�w6,�{�0�r�z�l�5T�&�H�㙮B6���`-Su�r��HA4���a�M�"W(�J�j5ʬ���B�����
��1Q*�r,��Ӕ;��緽�Hu�|PS��5��J��fPs�f��ࣧ��K���Z��j�WO�ca������*(5���ɘ{���AR��sM�:Fj�ʩ�S�l��s9l���@,6���Ƨ�kr��y���_��G�	i�R7�4�*f���iΝiw>�Nz���ya��?x����A��/��W�ϭ��%���/g�X���n,T���}\X���f����ם��q�j��"Ů���N��%}��8�F��7?����:<�z�k����G_�Y�q�u��;�T�#).��M�$��ۂ�#DZ��;	�;U������a���;@Qzjk�@��a1�Z�t������׸��N��E�A���~�f�6m+�����0.���k�����:�\t�<S8�R����eK���R����\��<;�&;��z�#�JFs�x��%y!A̟|�o|^��Z1X�Ԓ� ��e��������bk{�)�,;Lj¯�����	C��hb��p�4{n྽W~~^8Pq����t
Xu��}�!`,�!�ZN��Z\}�[�d���m���K�kc0lB�$��#�v��������E��h��g�bʑ@:H���g�[�����b�TT�0,(�"̠�:�+=X��ΠôLqҭ�^X�$&C>�W᪔a]�?��׍�Tͺ�:�t�"S�=����������� �[�X�1������^��α�`eav��qq~:(n�JNu��\�9�v󾺃�5�<z3�pCa�Ԗw���S�$��[�#�*n~��t�{�$�ww���GfQHN=O������� Y�zg,l$'|I@5�A46G9���]j��������n� A6�M��R��� �6��4�������G����mS&�JFS��0%��1��Z�]��<�e���گ
B2�dT��ւ�~����L�%�L���ߺ�{p��v#�L�ܹ�Z��      �      x��KoI�&����T�[u���܋� �n�`�4z7�Y4f3���o�RJ�(��(�DI�)R�H�W���ʿ�瘙?�=�ʼ]��$�7�s���Nof���K����G�+?�^��k�����y�v����e4�]<�_�F�k��x���x����� {u�8~���z!�r�>�o�{�������ݓ�h�u|����2Z8����w>��OW������_:��/��ş����h~9�8�����M�ٟt��.��/�� :?'���A���@(��8�D���K ��R�h@�� |L�D����4��w��*!A����YE?G�O�c�(�������� ��)�@�&��c�����\&4A�Bs��	uȈ��$h.�������f��wq�Z����3������]��������s�����nvn��I�c��#���9�������a�D�͎3EB���H�g՝<�����h�S�v7�� 1H������������yAz8%#���-m.���݅C��
�k���{�>ܪ���l�)!������_�dnj�0��K�\Z!��a`/-�aȄ��4wRKB��?���ܳB?*��܁�.~��;}_.�#�*�P(E1rR&"��*�Ӝ����W>ğ��J>����QU�T��fkQi�t#)	��j_P]T�o�h!��fo}�����x�؝<덿C]|~hDc����䂄$��׊�;I$�!�����mh%az$����icj8����6K
��R�g/"���2Uͥ��l��������_X?���]³��l�U�ҁU���'a��n!��B<�xO��o���)�;��o
�T>FS�9�B����/Zjw��ȧR>Z��������%��=�wc^Ya諸���<��_s�
S'Z�me��p:/7����Y�b�_�ǓkJԔ����p�Vu^�ǧG��7��[=�id£	R�@L�2�h�O����=P�<	�� W��Z���b�{=���KDD�˔��EAx^4!Q���@������ߠ3����E�o͹��=2�K
� h�gA�
��m���-�+g��ؕk��]*x�{�A����q���I�m�>�S.�0I����tvv�/_���M��X�L��R����Q��l�tjX�4塔�Ǳ���Ʒ�pZ��D��jR�}�\*��Z0�gh<�i��qz?�}���0�8���&�&���"ּ�2�a(PDh���6 ��ہ^�@�����T�h��ANH��Aa��:�bm�~��i�B_�Y̓�q���$4ǖk�����"̷<wC�f�`(�Yz��⹺�Cx?_�}����>5���_}%2�\X����'���<�؛�����.��s��Y���DU��j*t	J�ג_,d*n���5Yh������L�ܺ�Qeb�?H��C(�HE��ڀ���޻��^*��Nw����
�����.�`	�"���g-�Lt4�i�=3O;�s�na�%�����2.u`c3(P0���1��a��d2����6h����<�"�@�z�L���/���W��t�iA��'+T`B.�S�	�w�B鞾ّ#c�����ɢ��Lsi�|�F�vb�I1v�ߊ6.;�[���/���Vޗ�6�&����{^`��7�	��p	M�7h�h���b6�Zp�t��!�?��~��-����o��;p�Q�(��k��P�,�m8�?g�[����Y����Y��!kYv&1�{rq�0�έ�S8'�c҉�%3�)�PY@F8��1���i�C��6�;�-DhTPX�A�KF�+���y�ҽz=mwӲ�ċ���)l]��6-ؑ�P��������t�>��L]�?��$@�4p�1lHx1<�C&�Hh����-��}��F)#�;��΀ߖ�醗o{/Z�C<��5�
7��(�<�q�����u��-"�C��2���T���Y���.�YS���_B���O��q��ԉ�D�i{X�?�-����L��Y;ɒZ���|<��fܣ�U�J�x���9���_ "Z%��;��S%���~��2�%5�kmd��(<�R��`S��o�h�G⣋�z��I"^�h�F99U���3c�
�+� �&	x�E�&/�~�:D�� c��@�$�؇&y�:��$L)+e�����M���B�e*|��M�!��J%�I/
�R�êB�KD\�ٙ��ͦ�t����]�Q0�v�g�s{J�D � �'Z���xC˓؝<uB�4DR��K�!F��e����&�2~���}������-��-Զ~@�W��Ƶ��x;"��K���:���ғ^�Q�U> l�-p	���0Y�Xǌ���qP�kY�e��}.����K�vi����-��{����G���G^.�ԠmÂj�l�lAL�4�v��O���k��4/*/n"��̆$�)�1�l�>P�ï^n��a~5D�j2K��ɟ���0������L��O*���C��g6u�J*Dqɤ;��Q��*�*��*�m3E~6���˘R�iZ����I KR�N�lS�2���AC�������)԰s�lQ����l�� ���|ۅp�v _�HMMU����;`B��Me����~<����!������c�zXV�}!R5�D@�G�
�e��T� ��N4��~��&��XV�~@��[�R�~�H%!�U[Y��a��^��!��3��',V�>]M�>,0�*��^�o��<i���5T��t]\����
�>� ��eR�o�0�T���lЁ�զ�mYXz ���0�J��n�6��������Ӡ�yD�>
�#h�z&&�D�����������Y��l��e��#5�m��o�6(g��PK�o|�^�@�ٕ����)���Zr�R
�����.��6��7�k]#�
�J%8�sF�������6���U|�N�F�0������V2 o��V�g�mp%��\�D��As�r����fs>�+J��*���)���=y� 7�w�;fc^����qQJC�m�t�d0��u��,N�ww���>��fe�&5��?��,LPEݏ������~nސ�-;�R*`
���c�����Чs�-Ȟ���ha{1➕�� X;�;̱�[��V!�������>��q���Mh�m�,/ ~��i1�̨&B:��M�!%�&�31u�M�2��uL��rJ����$����f�6%)���3�/2�?�"�b @dp�,�p]�� �6hdb��p�_�740�D��r�Z3op���]0=�i%�x�tl�H�
Ȁ���}-BJ�[�M��/_z�����#��_玤��撅L����i�9���Gk��7��+O�-����&�'G�="������PJ���6��,ֳ��2b���P�\�:� 0���a��C��檊�Lz˰M��ć���Y}��\�f����A��T�b
pD��g�m&�s�n�q���m����4 P�pq1B�;��a��<�͖�������s�dH��,2)��ߵ6Q��/m��lז&������� ׇ�C@�r")LW��R�W�m�@p���2��N�߼DC8�v���6�a���F{N�tqN[�ػ�U}:�R��M�rAjX�
��Q@��{
V��D$^Bl(���R$�RX�@��M���h|�&�N���N�j>�X�%W�9	Z`����LHX�iC���w��׌	���8B!Vb���µ�/G�v��X*\�j7�[��u������<d!"	�R�I�6@��<�j�Ȧ{���m���Q�
Ŵ"�Gk.�wM4	Z��m��F���ym��M�|w�y}N$�Di�7�R�$�K(+\7����t�ja��S���ڝ�˃�/Ҫgg�L1���� Y�w�vcm3�	�l��4��m.n��b�X$a��Z�@��e e[�j�9]�_�Er{ϒ3�;ES�I
��z.`A�W�E3�(����B9���74������4)c1��    �٬�z}�s����/u^��]O��A�\SӜ����Ϊ}�;�7�뿻%�6��O��������w�l�LXJ2
TP��0�,ዷI/n��Y�<�o��LF'��'���!��Q>Nc��ϕq�q85�]��>_�8G2�� �ZH�'%�����W��<6�y�+{���K�ٝ���ǫ{��ڛ����i�;��&�� ����𵷚�`۵d���[����u'?vO��j���w�w?�Χ�~�`Y�ꨬVR�B������RA�[-"j�_�;O�Ư>�|ݗ�c�J��\*�O(t��vy�������O��{"[��0ɿ�B���w'�p��� Eq��k�r����O�� ٴo��[*^s5Ǧ�Ȗ��0(�<?살UFZc?���g���qt�R�YE�e#E�"#@��6V�bpn8����� OSl_��|�����)[̚c����S��A)�;�:��hA���V�܂.�}z}�u{�f��U��4s5�JBd�~�4��z�w#G�0$��j��!�JX
f��7��7^��-���n���,p�����)����t���㉁2��(-F�h(9wL��̟���إV�TW�1	�H[n`��{oWE� (�.�t+����@�b���:�6��d���:^��,�m^��<�����͠�M=|ˮ
O�J8��h�y�}���׿}U��K�n�7(�������.�lX��&��i����o�\:�\N
��\]'�T*ߜ���$L�pk%)����Bww!��	��&v������L�K��^���b��b���qR.���H9� ��Ùsw��}b���,dJ���p|{����+g��A�=�
�܁G�؊6ک��P�n:�#Ǻ@�
��ļ[�H�5�\�A�����8���~u��ٱ�c7�P���+Q�=�L?�~�[�~F�}r�"u�e6j&��\�48���v���A�4~�!��	�0(h��m�㟿��g�?������V?tǑ�������Cm�� ���M���x���i����Gˍ1R`FRJB��<�{+�
6���ocsn ��n�e��ا�����|�V7A'�ܾ�Ph�:a@gIQ��;��k*Y���������C�H���t�Ut�&^��nH��e�v��=�0,R��{�G����o���^B�(mߊ��z���>F���"�7�`�����s��t�.B�l.�>FXN�+s�H\�:l���2��ViOܹa��#�g;��gb��q͖�xO�͂ǟ�
���{_ϺW/��i�� .G�*��D���+�v *%W�~��ume�IF�It{�9���?�P0��|����w�P�Փx��!�����|�9���k\����pN�����Ü�oKu�L�r̦D���M�� ��t2��H�Qs��ww�D6N?T��"��>�WmB&�o�Wx��Ok���Q� `����Aw��m�h��n����G��0(��X�!�Xz��@ק�@[�e�ط�~c��ɾ�k�pH�Ӈ`�7q�����H���� �79�Π�P�:�rcG�
�(���+w�1����̷����l�2Kj߲ve�����<T<_����'7!��q��%	D�K�6[*((��_�%��mh�����?<A��p�����{��hI]o�(��w{����/�WD�����XZDS�j�\�N�gZ��v�gC�K_�T�>O\��}W[�L�M�65a�d�����h4��+?�wX��,�ւ��PT'a�8a���yYpk�K�lA7|�(��Z�1�����qw�`R.�CQ�B�_\A"��8��;��Z��:?,��!s�k�Q{�����,%��;�be�gB��,`T��
���P&R�(<\��6����t�eP��Ⱥ�Cc� �T�v}�B1�MXH*��h��m��ŶI����P.R~��qR�r��4�#�O!��62	�6�ȴ�����L���b��ٜP���"�`.f�l(f���ճ��)��cnJ��5:KEEJ��"��oK[AA������MOo�P�nSmK���IK�5&��2,��p���x��Y9nC1����w �9�I��N���RW�N��ڻ��T7��$�x� ̾]F��]`|s��'P��8���BE���*ȉ����63D/�q�n�6<�D�	�u�� p�� ,n&�����ӆ�O_�'WX�3�&�[��ˎv`��0ƶ|o�Plc=��n�7��y�0������Ƃ� �E2�[�����V��d�&���&�On��}�
@ؚ��K	E^v�y
�?5TAi�%��v�ݱ���q���W|���xn<����x��~圅�V�QAp<H\؇a��`w�`�O⌑mq�\0�Mb, R:�cS�(�Un�� Aэ"h�8�2�EKOӪ�>�3���=úk�j���XP��U�iY��C=?�P��F;�xI7v���^bW�K&�Q,�i�)O7LC���$l�VYi���<�yӻz[vM
���w����/I��N1�!�An�0�IoH��PRE�l�.����J{?���*\��N�n���>DW[ݕWU�Ppd��J���,h"p�^³+��;RTE��/H�+\7��hX]�MMg�2�8T��_0�OH�(�+Wou{��f���|C�%����Tg�w��������t�!pG��{�_TEy\)��h����n&AV2+�]7I,�V��^ё^}���Zs�d��|��׎"	�� .�H;-	���U4�����R3�5�:�WO�.��������ݕBKa�  r�M9E�X��n-X��[� ��F!g�Cu85ޝ�3up��Mg݂uME�`&�AL��%��&�b�ͯ6>�D7���@��st���f^32�-�����ջZ3ߴF3VM[`�q2	q���/Ϯ"�\��q���& �L��g�:���;'XS�M�G��x�U��*ר�<���ABI��9 �ю�P����v���|��?!��ϗ�X�kG��r*�焜�2-�Nsp)�]�*��jQr��>Q�샱���%Z+��|m����E�?u/?�ެ����߻��ru��xL�zw�_LD�/�����>v��؂U�& �~��� k1@��l�vg�{t�*qb�r-�/L��`��9כ�S�δ�Ko��x�2��C:��P���ו��1�-���g��+,}hݪ���P�в���m�hv7/�`#g��L��������n�"2�o:;�U�ˋ�H��5Z{Q}I�aG3d`��"�3^ʼ����8���|�ן������t|��6�v��E 2���f��Qg�2��ep�-�lQ?��a702��k���U�R��0����0UGe����Hn؀0C�LL�`�BP�He�쓰�յ)ƚHҏX�}rj��������`4�$d_s!�c�Ҙ��nR��&w��iW�v�R�#����N�$ތ�$dh`�J9��7��c����*��Æ�*1����9D�`r1l���$U��Ret��P���zy��|���d�6V�RO(4B���xy6W�#�2� Nh �H�܉��-T#���_�'+�K��!i�F˄^NI����p��Z��(wǗ����V��\(�E`BŪI!��(%�1�rJ 62ɖ.�F������GN_�x�ON�E[USm۲~���Ɓ�s�6Z�ԕ<�C�]�H�FF9�����y� �Q�&^��A,�a8�� .����[�ц~oF� �&�OT�S��K�A���oD#�ܛ|Ǣ��$��&<�L�"ma���	-��L�F�ض�ܫ��� � �JW�L��f�A#{����d�]h�xD����2?�F�����M���fأB_�D5��� td���{��i�H��E�+����'�2aRn��JZ?i(��&أ��z;b*��G�G���ʍs�.��Z�b���\��@h2"N��Z�Ԗ���JQ�R���SIKNx�8���"�q}*%�}n ���Iwi���I����!    "��x+�b���!h/��(@]�$��p1�VX��������Z�攇�u���,SB,>�+��*z���7d�&��O��'�6�b>:&|��X�-k$��<�A���.c`�%�NFѮ�M�����D[�4H��b(N̘C��@H��[F�*�[3���� /rge|�{5_�Z����3p�8ؽ�x��iاl�, �ّv�CE���M�� �����c&�a.x��� ��oU#5�� �� �H�k����&�F��.�-����e"���ω�U#.�FÀ�@��?�>�MHG����ծM+LM�˗�Ha;��ᑒ�`�q��Yr�2lH&�TZy;�dƣ�������Bo|&�:�ޝ�����	�!V���cݝ�����}$�Y�rF���H�;��1,��Ka����ӈ}41ݛ�[^[5�O����`:��ձP�ڻ��R�\޿~�wRE߻7���~g�I�_�Q�N�XGm��V��S��YDG�3�x����ۺS�v��]�&^t>�4�;��\;8P9�ؐRW�)eޥ����E�`�59�ԧ�2)9�j�(N��IO�"�A�[,~9��|�򣫯ѷS��rM��撏9#n��;�I���
 ��r(��/��n��{x����������|�H��XHXP�[����u�-��͹WF��g)�c�YTj��-,,����4�X�R�R,Bj�f�\<��i��ࡥ �?~����I/,�ݬ��c{�\ K-ӱG�dc�4q�M`o���T������%��	
�@�9�&��'H�a��D���W֬d�|������	����uI>��u�$we:< ��{��t'?� $��.���8�f�¤^*Z��7ku��,�h�9Xqϼ���9[X"[���U�&�&�������o�kL�~�W���\q�i.'�+kW� ��mWYdOLuv�W^׾� ɚ�pd"ᮧ=�B{�aQ���?/�)�y�q��ɼ ����ϟ��-�oR���G_�DY����Q���U��e�'<�ܸx���{@e푂��ee����4��3�x�ґ`0͕���W&/�$w�k����너�|'Z��B��&)�������
�t<B
yY��p)��NT,�Q@�.�{;/7Ⳬ|�#~��ΒL�F��/ƥJ�8��o�ֲ��bX�43�燪���2UQ�z3��o�Y�l����{�c�(��P�!V.���S��7 "E�DO|��LPSL�@���W����/�:[�՝�R��t�%�@ *��<��Q�=E^Y`P�j�v���H�j	�q�f���2%��j��GR^YJP���%8/h��ɦ��d�nq,8'*tO^��y��P��.�G�r��&�+��o�̙0`��v� `(��֢����+����?zQ+�[�a��ZkIC��2 ����&8~�O�}�%�`O�b��� ���Coj��[PZ{��P:/R��|�Ĵ��[`�mk���,�^���MΔ�P��c�����	�hj���=�燻M�B�v�'�p�� ������v0�3���o���h|��S��a��bŲ,	FA��M��V�T46��$���pj#x�+ݱ��O>��Hj}�tR	1eh	�t�QI���*���3آ��vz��f,u���&�XyR��L����c��@!8=l��ޒ45���Xu�zXI��S�!�� �<��V[6��g뾗�������}�+�\6���-1����'qU�����(BHȉԎ9�M�l�Lmj��g����|�ZT��B:Ʀ.Χ6���ð�`W����	����  �P���&�����;�V*$�l]Ɨ�mM�~I��8�L�j��?���+�������sTJ7}z�T�lj�]3BŢ-5*(�/ӆ����9�؜l@��P���|{]������o)���������s	�g��s��� žZ�b&�Ԫ�+YF�i���%v-�f�`��#2�8t�Y���[0,���?U�����˃
������)��v^	5�K�ӯ����O��Gh�:W�f�!`�X�~͉Nh4���&#�����_�"yQ��ý��=&�7�%-]`��9�Ű��_먦&�F���]�t�?�O�!��r�J������dy�7��o~�>����ݓ�t�Nt��[� �VR����:v�r͟y��#�L�7s�!#[z���#��:��+�#��tR�_9�$����?`&7?�(y��I�FC�g�n���"Z:b4P*a�}p�|�R��=D��@&��p�m��;<Ļ�3��C�`��c��ZJ~���\����m��$�%>q�����F�<y�:�M�n���AM�ɖ�d^��t��8��n/㣅��d�]������a�<[������bf:�|~xb&�.�ږ�#:}q�5�~_wl<���
CSy�A��A���阷opM�{����U��UĨ�0��H���a,��������56Ќ�wv�v��}����>�AEnqT�T喩"���!^9���}�cm���ycF��v���Dh�i�����e������4i���Խ9r�Tż�"'��qz��2�e�������"���.��ɍ�I���2�e��>��zNs'#�9-�X���^�?8�ҷxs�*�aev^� � ��0E@x~��?�E�ӲZ�h�9���6��$4)��0Xq��h-�lUp����w�eV˚#��ڪ��oggTA�P�4c*�Dq�B��̛Z��i/Kٞ��d|�Xͫ�$~i�V������$��d��
���H���2��~���D�'�XAL�L��t���H��4��u>{Kc-�:]�Gݨ[&����:���2��U��Ș�6�1{�����N����U���#��ܟ������b�:31�->V[~������oS��Z��e.hV҉��?f��[��DRuu�.:Xχ�(�ˢ(�R�Xl��'<�2���諹8]���*>�.�������w��YF�P��Jkڄ�ܺ!R+�?\e	���@�:!W��)d9%�oR�r�t�i�5sC&k��uV����
��g
ҎO��w���	L��_F5k8}Y��p���H�m���O�Ġ��zr�M�+�P�Ի���INIi�e���QÔM��y���2A��Ӏ�L����nm�����	ae�ԁڌ��Չ�Ҝբ�P ���)LP�S���'_!��D���Y�� z:�q���ƶl���0��^��>PGVeh^r��Y��!D���DV�f���s�Mӧ�Z=`ꔕ�\�#k>����4��)䴲j���3Kh�)��#�];��,�M�u�5������9�����/>����UK�b[J��JwP�Ԓ��38��&d�Oi��2�Yj���`��{I���癱2Ql��t�ub7��]^u�/�ۙ�����]1�Дɗ�a CJ1աw+S�6
_(*\�|~��j{=���Tk�h�e�3K���ê�ɏȢs5��ۈ�6:�V~�>��yj2�%vw�-LG[�}��?�}z�����]�be��e4q ������h��I4�c��w��ӝճ�G�>p�>/}���:gO)������%��ͽ�L4��ߏ���N�tO>ğ~��g���T��ZEIB*�G��2Cn�]JM!6����0[>w�,3�P��Y�V'��%�L�{/{P���*�(����Y-�)<�3�6���Y��v����Т��ksݓ��l��ᔙy�sW�gl|,���mݡ(d��+�
,<S����Q�C����i］��%F�}A�l�Ֆ%��#��|�3�I���I���K�c�ub����Vp�D��}ܸi�����"�x2`����,n,B���9Jք�w�<^�v�Oiɩ��}6���;���D�o�{�����g E�g)W4'�B	���[�q��{r`eJۊ��e���#?�`x��ݛ��MM����z8l��{.���χ/ސj����������-U�Ҕ�I���Z?��I��Q�����{�oG�/���?����wG�@�-PDu��G!�    Ck�`_��J���ߕ�I�+V�rX��ӕ���H{�Ⱦ����Afc���W��W�������UK_[7,�5K/��m����h�g�%##qķ��ˬ�Uwж��-�T�6���d�<�V��=J��
��9eb�?8(��V��=�Dd\'He�4� �3S>@x3ܳ2�kՒ���T�/CͪI
bp�H�5�)��(Vfw�:8Ϧ-����-�ș� �ǋh�`�L��j4�s��h��b��w/;�_{+ﳰ��f:<��tH�a��13ɤw�+��V���{Y��+V�.ܭ��0iXR���Rn@�
�Gg�181[��s<�L%'�5�<q���O��9Xx���~��U�Vl�J{�/�����fUQӳݩK,㿀�%��^{��,�!&ڍme��U�vF���dQ��ӿ+@��y�2�j�H����
^�t~n�⤁��������Uk�Qt���_��F5<
��]ь��K)� )�VTx�_�2��b�����a��Qu�K���ca�=ʁ�	S��k�[`t��>A�JDs���0<���<������ؔG�5OX���
rMIjZ���{|+3�V����n��Y{3����1��[J2���$�����7y+s�V�������4������q|��occI L�[�"
.���+3�V�A<�͟�n I4��<e�T$a;��fDbe��*'g���.��D�_������+�҈W;�jA��x�Q�lþ���?'�L�L�gA�˄���(r�z�6ܤv6N��><���֙�HO�>��C�r�$(}�����,�շ���׵KNK���B��O�*�vp�A�opU&C�z��Ͳ�k��}C<�)�Y3��3��)^=� n`*�ƪp׻�qΐw�+ӣ��	���X��ʬ]�u����_:3�I��(���(�q�w˜�U
�39�ң�/�15��{����.��Dv�v�7��|�0T�^�0la�������d?�=&)n�������e�?��M26��g]'�lF�b�׼r�� ��l�֛z�z���=�z������J���}�g�L�˰pP<�[W�tq-�f�u��؟�WK���x�KœO��3�D.lP��a/%H�-���)�Vc���\킳��;�a�,E�A�A{�)�Z��zˬ�5\Y�/݃������UߺD�U�����N�h*3g��#��pa��y�oP��\x�m��..Mb��Mңb_N��r����1ʊ�qxR�լV�a�=�z���f,'.@�G��g��~|8:�ϙ"	N�ۻՑ��5+��i�6+���Ͼ�����z�������ub0*�rՌj�WT�O��&��ۙ��tU"��O�N��KR�7������w�''ѷ��D�tS�R9ak@k�
h.x�_ԣ��䌟��4�z*�x|?���͜�!�ә����7��a����B�%�`�]NV�W@��_%��(�-���ѿ�Y�e����;�\(� #I�^<�`j��+B#8�r�gz�m<;�[��@f٣��NݬV��*�(��c���`@��ꒁJG ����lb��]��;��\z�S����H�{BH��̒h��fϔ�}������Jw|	�����K.=����g�C�b:inI�k���n��x>���j��/�_&���L���L<���8��6짣�IPj��U������`%�#��x�������x����|l�Ұ����]��>\}��D��0<�m�yJ[{�i
�Ȥ�0��������h2��Q��w�1�u��^�Zy�nף�c�u�l� pSy�{�FM}|��<^9�������(@&��(DC�5ˀ1�5��ΣJ�o�{�t׾���N����`%<?�֟����B����ğ� (��δ�!�����}1X�0bPL� �yu������J�R�pzm����ʀ{��q�ѵ�2�A�ƚ#;�پ������豮�\T��°pW\�)6���?����n@R��}߃��<.-�0,��{�t��eY����kZ<���kPNg+W�_��d�83*I+�gc0��}�3oAsxeYi��UL�bxa��b.^[-���i�o0�~Ȥ�-��0��T�oW��ua�A�D�%���^��L�`_�ˏ���hf�~��*�_�����q��p0��o�aكi��|G���c�5�j��'�шj7��>����`3���z�d�5׏1� � t=��Y㹐R
���=,�����:�����}��F_���D��n�;�E�aȓ�j�,Bޒ�b���Y��f�. eF39�����\�o��-'.�E�i*�PnV�i�=��4��p~���~W_� 0�eҤ��>̅=����2��2�,Ӑ��,�S=�y�,�EM6���<z��e��]�Sb�():"���_�`�a-�*�e�$[��$�(�����h�=c_�c{l��,�Gd�ӣ�&m�Af��~쎟c ��	��=�ۥ���G�T�O�e8���'�bKo0��u��>�	�׏;��j���R��	Af��0H�������A�"���cT���/�@��V�Gǯj�C���E�AB��̄�n���J����?<��E펈!�؇w���qk.��#��5X��Vg�$�yФ�=`&���4�T��Q��n�4��.�����ǒ���R����F���r����	�r�gb��˴���3@�SU��#h�f?�D1Z��؜�������|�A�a�����у��w�=�zODv��s�1�9#J�R&u�o�3�'Zn�L�L����P0>R�Kf�*Bo�{���a���٭�q�Y�?��; ��P�&Ĵ����"�_�*Iꔙ¨�oJ��sa6Zz�܇������P�����R�j�q�;��i��*����$�%���d��6+h��y3�pR�l� �/`��3��vo?Z��S�*CJ��L��R&k��I����l��������Ϋ�����/��0z־�{R�$q�KJ~�~���Hs�qʄ�y���ʻ������WK����f#&��(s)q�QɢTYiWȤ&�@J��%{3YrR|k+��sVF��{Ofz���p<zcטּ��gO-Ec�Q�����ͻ�|?�f�c�������:�>U5$�{�rZl��Y�l�2Q-CD�)��qR˻�M�����[���qsSS�GFN��m� Ίcc���cq�q��@jC~mON�@�m�]/��t����<������o�׏������wv��A\�L!ՏM�_H�ʴp-5D������0b��7&:Z0�ʧ{+�_�:pi�|������At�ֆ:la
��� gD'�.�H�(��G�h҄T��e|��7>;�'>����6cW�
��� ���95K)66�' .�ăԆ"�	@��ѻ���;��1�Ju�iꗘ�;���G�C	��
w�D8λ�?Hy�,^��?���t�.��-�UMG 3�&j��a�.<��2I\G��L��;�C=A��������m�I+�Cr�,Z|m��&*=�b߬m���0@�������UV����̴ƿ^����~���Q����$��'B��,���r�*3><��ڼ�l�҇P����d��CfJѐ:�!0�;�u4O!�G숝�r��Ƶv�ý�r������9?�;��TU)�w�&�:{c��6)*8������L�A�����T���xm^� o`pw�)j^�P�p7�bNNl�̕e�����&x����*2٪���9Xq��jPL�����\� ���e��6�[D/�W�~��-+叽����u��������O��̪EU�����Qv~�(f^YX�#��s�U�c��	�a��=�l��'�z3c��)`�?�x�x
8��6�9b��U�qN�ˬK�y�r���c𠣳�~�V������1Sk�)pn:@\��E������6(O=�m���.D��	��?��������u���zǬɄ�sT2�2%�����y��
R�o��
�!o���<�ާ׆v    �	�#
}'�(0��J��U?Y��Q"�����������F�O�zؒo[�00�T�*
IHư��U1,L���Ձ�s���>v�X��C(�pK�`Q�*���������X���䢣3�30vj0:�_�/��$�58�!��\��p"�&"B�;�4T�?+ͼ ^s=��v�7�o��J����,I�)o�=μ`_ug)�R�OL���n#���S������Y$ݖ�L��6���>P�g#��pt�۽Xt�J��@��7���S��������.�� i�<���4������]#�+�Dt�ՒMhSӔfQxȴ�.�D�P����A�!Hs@���Ng�u��;y�'��/�Ú����{!�R.���5�E��3�t�/{K�T��2!�f��Pi�h��2�¿
��,��K.ϰ`mf��
ϯ�����@��;�  y��*Ĺ�DF�.����Χ����q��w��2B��k��S�ּ��9�j%��@��3�s��]��6�ƽ|�o�=��=Utx�Ӄߒh�$y*+4Cf0K��J�4���Ծ�޻(¼9-�x�~��;p�o_DS�ݫ��3���6\�YE�6��>Ko�=�4��CEi@��E&��ف��w,s�Ҧ �|ѱG�o�f>`ê���|@�� ����������������m[B��>���~���G��q[��ͻ"t@�_�t�|�e�ǯ:�/��}L�uPTp�?�V��M;x
�W�P�z�����0��;D*�+)����A� m���>��I��� ?`���1vp-��I՗�dn�^�����#��vqh	�M�V�o.�	ߩB&��2�Se�i�0N6vO|��8�ǹ��W���hq���~t�8�֤���Yt��@�\��i.�(>���M��� ��!7�2U�ֲ�i�R�Df�"C%�d�o�.��6P_�����yo�S�����։O���!�3ڙ�N�{�HםzmƪHGX^����Y�1��<�̀��f��`��W�����?���?���I�P��՞��R �BV4�.lw���Xq=�+Å�&]��k��+v�P����7.P�aR�B�eJ2����;����q�?;	�sq���́�1sMe��p$�!8�N�ؠ�8���t��EFd����s���G�=D�XYBo�@t��3�	�$�"�B��}ݏ'X,m��7�_��w�a�{��;�C��΋#8�*"�ER�Rk��=qef�^�D�?u>:ޭ����~r,�ע������k#���AM� �K:E$��i��8	�֡��!��ʾ3n�U���!��;�|���<���<@O���Hȶt�l�?�Ec���T2�MJ�<�D�XM��j�X�����e���ݏ�����#��c������������{'��0��`���-}Ѥ;������5�_����XT@�w��;)C ��@e��o��'zl�p��oѻ��U�8D��2� �%#mQ+x�&q�/j)�U������v>Us�X,ć�y�0p�DҢbj�[���0t'�vvv�a��N��Et<�~�˓Λ�ы��զ-�jP:�
�E��h@$�g���h7�9M�6���?�h��*�ڀH�m ӥc��F)�#E�j|��y
-���Qa�7.�S��� ����m�_ �펔��(;���/��h��bU��8�`n�12��w�^��>"�ă��Mo�Ak~Χ)�0$���iF��k��-]�`��������� i������ x� �p��Zzgadx��z�ٻBC1�	�dR�=7�l�������rH����L�ճ�2e�p�n�Rf��h�]_t@C�K��<ֻ�G���$��0����P6����)��q�����oߧ�C�wռ;H��9��(,k_�L�E�����ըc�V��c%���6�:|��k�չ�t��]C���⏞�����`�n��5_c��Ѧ;(�M��a�C+r��Ku����������X)��KI�����&�>đ�w���}��s���8��6��[CUB����-Ō��M��8�0\Hq{��j$��r_��ypyLm���m �PN<-��t	��81�c�+ϝ�a�&oM���������=HZ�-?5Q��LRI	Oǌ1�����Cb�n���TP��JT�H�@󄡿���rY}�l'�ޚ罕kc�J���V�&��]�a���9��g�3xgǱ��w�R�J��@���@� p���k���1�6����M��|����KY�<��{�Bo��基'{��Q4��9=�ޗ��9�q���d�Μ)��&F	s��$��d�Iy\�����]��]���ڗ����.�Ku���� ��YE����I�V��h�t F@�%ܗ�'�osÆK�'�v��ߚ�"7Ygo��aY���{�/=���Au/o��5���x�����������!����5�4-}}=g/�(�t��eI�k@���4�tĂ��C[���������OB��22LF���nL	�8V�;'��m����eQ��)�JX��
���:S�&��B>ZI�5���zZ>�;�Qf�kp�������3��$��8��n��Ʃ��H#�4ZkMx���f7��lo2��iF(������k���F���\fŰz@9	��mI���h,�i�o�	�4�X}�����a�	Yh�R�����/$�����(�\�ӞgS��c����3ro�#���(�68ȩ��U�� �O��`��#�t�4Ά��(�T�:�cY����Q��-�-h �a�)�T�폀: �M�Pl�v�C�z���������ʵq������$����{/���z�v��/������{�a_â�|K_��6,���T���m�ב�D9;�e��"���	Ԍ��Q�P�m��cV�V��D�4���)���P*�6��p`|��H��C��Jr����.���"9��㉯��2��)x��HK&��H�"��L�w$bᴏ��C�*Mb��&��9K�Sԟ)٨���l۶�x�'Mv��M�m�!J�w����ȶ7f��@�b�ԛ��KFB��q�=Ż��Ѷ�*P��p�OP�Fu�(�C��l��ɻ��T�j�6����]R꧸�Ԟ��6��2=p���f�M��>�[rJG�� ���𜏀�P:鐅��\�tY�o���nP�Q8�tf&l�$��U�rF���dD����ƯJw�.:X/�m��4�Y ������,�ޒ��t�f��fjnd�xaޔ��Z><��Ps�gX$m�+��c� �F�c�-Y�)+�������*&"ݽ�8��L�Ѡ���]"�}fŦm�Og�RKd	щO���޲���{�Z��{��7x>������1K��7���^�#5��2A�JE���
��;V�����Mι�]�9DƬ"Kp�{���i�
�R{?��h�����;�צ�����f����RN�q7���~�ޝu^� �lےA$L�����$d��zF��޶���f�a�-ܱ�;�+É��ǚe�j�h��T�eT��9"\Sdݭ���������q2�Oau���Q@6gf��YGS�L�n�l��=&9	�Lf�s�|������jlC��t��9*0[��D��t2k9� r�O��{�M�\�o�o�;�̚����,�Pۻ�P�h,�	�s*̛����.���'��&�`�p�������FdS&4Ld�&���r1�M��lOE(�k�e���M�&�h 6��F+Y�,����uq��(�� s��%Q��|m��i�����(v������d��W*!�5��������M.�v��R����iɘ`����f������9Ȫirg5h�p̛�E$W�j����hcR���t�`�1�h�Nt�_SM+�̛P�̬w�Mg�P�lH��l	��ykX6"���Y4�>DL�&��I���)M*�H�w�\�[���3
�o�]��   �~$31��
��� �� '3�H@������?��F���l'��9�&�����%��"X��A�L�7�]���ʄ�9;� ����ƶ
���}�۫��ِ��x�9¿�KWV�Xl ���$%^���3��:TO=��������y���r�L
�x��t��
t*�}x�������D`�����v���
4.�sP���i�ҕ�QW>"t4��S'e��'�E3_�쓭},5�(�$s.
��f��g��a.nav��iބ���$5.)�"�%Jb��Uq
��G���ⳓa���L�,���]F��w����AH{}:D��&���X�|�@�	�q�PJE�+V�h�O|�q8��N�FKOS�Kg}B�L�z���t Q%�e�_�.]o�Cw��ܺ`*�b4�<	��d�=�J�р����b�7�U��%P"T�4炏Ӭ��yq�JB[Ɂ�[Z� *��!��A,>0ӛ�M���z��b̎�unG�cBn<k��?"F��2��a�=�z����󄇟s��Ϊ��,l��"V|zd���Xs��L�p��M�j��ջ��l;����(��<�T
'�I��V�So�"F��Z:��'u�~Yk,��;S�x�4�	^�s�$	GP�!FZ,�sk͢I�D�+��t��z�:�"��4$���~�(�P��wgU�up4�O�@��(k�4i)�������\.0��U�ጆI�T�w�Q�(B3��������D�t*d��@08�N݄"��=b4 ƨ���u}��o
ǘ-�.B4�/tH�����7Ĉ�1KG�����k19܋O�[�n�2�<!Aݘ]FQ�zo�j�\w6Nmw栨p��������,��aѤ <u�������-���B�/R��e&��jx��
9�4��;�ZՒ�ʊS2BT�8$1����ؑ�-%����̘K*����#���M�#K:1JoKm���"��d
n�0"��E;�Q�e�6��'7D\�U��q�0	YL�%��7a���A,��O����QMYF��/�^��NYEx�+O�m�	0�vx`#�]ֻ�ibɼ	#�[��� �nE�F˥F�T@\s�����9��?�/�`nɘz�G`!*:���<�v=&��o̐#� 6�`Ne�ِ�X���[��6��`�4��6˒��bI��n��@t�Fm���!2�~���-�;���K���޽�B��b��Q���7r.v�W�D���V2;d�����i��FkP��̎	h$�s���YPXj�������n�_(�P��B5�ӝYG�X�8���UE�8mB��>N����El.���k�r�b��1%���N	!I��&M��Ԉ5��͹η����L�y+�݅hm�6E;B�j�]f@�&T��4�0�Ѽ	��9������T�%p.�����7Q#+7F1�'�5m�I�����3Ƕݏ��?f҆�iW�C�<��SjD�S`	�J�2�~�1>3�L4�J8�ʕ��$��yԈ*����d���]İ%:&�/ulj�Z��!��/ �?��G�x��1��7�	��膂Α���P)��:Eﻮ�<��i��J?펿�.^WE�o�a����zO�\V4gⳀv�*7Ӝ�o�X���3��ro�ۗg���>����HkdR�f��9~E%�C�X� �q��Ѷf��]ǹ�c{v�?t^���2� �0X}�c�3^�w�f�.g����jͼ�W��ܒu�I�j�X�%���Q����Ě���t����O����0��9�vT��C��*��E�g�1E�S0�ZΦ}A�PobQ�E�LnSޜ�]�=��n~����^��'W�6M��Z�f7��}�������Too�n/}�O_a��ʫ��ϥ?��?W_��H�Xy�28��w��5�W�S!q�	���䄖�������.�p�����4�����G��E3��-�bl6ޜ�˂���t����ԟ�Q=�c��Z��W�ㅳ���Sg�Kg��%�3v��hj�L���?����?��?�� �1E�      /      x������ � �     