PGDMP                      |            ligas    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    ligas    DATABASE     x   CREATE DATABASE ligas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE ligas;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16409    equipo    TABLE     �   CREATE TABLE public.equipo (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    dt character varying(255) NOT NULL,
    liga_id integer NOT NULL
);
    DROP TABLE public.equipo;
       public         heap    postgres    false    4            �            1259    16408    equipo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.equipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.equipo_id_seq;
       public          postgres    false    218    4            �           0    0    equipo_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.equipo_id_seq OWNED BY public.equipo.id;
          public          postgres    false    217            �            1259    16423    jugador    TABLE     }  CREATE TABLE public.jugador (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    edad integer NOT NULL,
    posicion character varying(255) NOT NULL,
    nacionalidad character varying(255) NOT NULL,
    titularidad character varying(255) NOT NULL,
    camiseta integer NOT NULL,
    capitan character varying(255) NOT NULL,
    equipo_id integer NOT NULL
);
    DROP TABLE public.jugador;
       public         heap    postgres    false    4            �            1259    16422    jugador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jugador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.jugador_id_seq;
       public          postgres    false    220    4            �           0    0    jugador_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.jugador_id_seq OWNED BY public.jugador.id;
          public          postgres    false    219            �            1259    16400    liga    TABLE     �   CREATE TABLE public.liga (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    pais_origen character varying(255) NOT NULL
);
    DROP TABLE public.liga;
       public         heap    postgres    false    4            �            1259    16399    liga_id_seq    SEQUENCE     �   CREATE SEQUENCE public.liga_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.liga_id_seq;
       public          postgres    false    4    216            �           0    0    liga_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.liga_id_seq OWNED BY public.liga.id;
          public          postgres    false    215            %           2604    16412 	   equipo id    DEFAULT     f   ALTER TABLE ONLY public.equipo ALTER COLUMN id SET DEFAULT nextval('public.equipo_id_seq'::regclass);
 8   ALTER TABLE public.equipo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            &           2604    16426 
   jugador id    DEFAULT     h   ALTER TABLE ONLY public.jugador ALTER COLUMN id SET DEFAULT nextval('public.jugador_id_seq'::regclass);
 9   ALTER TABLE public.jugador ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            $           2604    16403    liga id    DEFAULT     b   ALTER TABLE ONLY public.liga ALTER COLUMN id SET DEFAULT nextval('public.liga_id_seq'::regclass);
 6   ALTER TABLE public.liga ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16409    equipo 
   TABLE DATA           9   COPY public.equipo (id, nombre, dt, liga_id) FROM stdin;
    public          postgres    false    218   _       �          0    16423    jugador 
   TABLE DATA           v   COPY public.jugador (id, nombre, edad, posicion, nacionalidad, titularidad, camiseta, capitan, equipo_id) FROM stdin;
    public          postgres    false    220   �        �          0    16400    liga 
   TABLE DATA           7   COPY public.liga (id, nombre, pais_origen) FROM stdin;
    public          postgres    false    216   5A       �           0    0    equipo_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.equipo_id_seq', 6, true);
          public          postgres    false    217            �           0    0    jugador_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.jugador_id_seq', 82, true);
          public          postgres    false    219            �           0    0    liga_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.liga_id_seq', 5, true);
          public          postgres    false    215            *           2606    16416    equipo equipo_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT equipo_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.equipo DROP CONSTRAINT equipo_pkey;
       public            postgres    false    218            ,           2606    16430    jugador jugador_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.jugador
    ADD CONSTRAINT jugador_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.jugador DROP CONSTRAINT jugador_pkey;
       public            postgres    false    220            (           2606    16407    liga liga_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.liga
    ADD CONSTRAINT liga_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.liga DROP CONSTRAINT liga_pkey;
       public            postgres    false    216            -           2606    16417    equipo equipo_liga_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT equipo_liga_id_fkey FOREIGN KEY (liga_id) REFERENCES public.liga(id);
 D   ALTER TABLE ONLY public.equipo DROP CONSTRAINT equipo_liga_id_fkey;
       public          postgres    false    4648    216    218            .           2606    16431    jugador jugador_equipo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jugador
    ADD CONSTRAINT jugador_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES public.equipo(id);
 H   ALTER TABLE ONLY public.jugador DROP CONSTRAINT jugador_equipo_id_fkey;
       public          postgres    false    4650    220    218            �     x�M��n�@E��W��+���4�Ʃa�EQtCK��dD
3#��]e�Uv����1�;��yyG�AqwH�
�~;<���0����8�!��1�yG��<&�%�4�E-�y��L�\Kt�����jrs�r^��)�HEI�$Vd�%�J�w�٘��d����[�� (�\a���9���
�7ܱ�6`�eU�0.N`M����,0xus�xJl�)̓���]0��6ܒ
rfH��w�~�
�PL꾢�����N$%�[�>`�F捘%1�YNO���]�6)�G������D|�d��Q�Bf'p�m�T=��f��O^�.kS��H���H��C�txa�yf�lݥ-6&X4�����&�d��
�l}�~b�=��e�S����6fM�d�X�X7����(�I�3_Z�p����w}y(���
�L����E�F$��>�4���
}K0�|k���C>¬��|&���p���,�¥ǖ�ұ6'RN��VZQ�`3��ְ�
��fF���,�H��a��w�nfŏEQ��w      �      x��]IoIv>�~E�|j�r�<�E�EJɦ��DU�����΅R�m<��o����@4�v>4_�����"��5�V7:���-�["do�B���|�Ӥ��,�ްC�%�Y��TG�'�H���7"��7��Q�:Y�ؼ�[���	ꊥlU�]�f-�1�.b�W,f!3Ù�|)�mE����av����$��L�V�5:�Z�o��D�W<-�{a�L��'�L������B-��T�I�݂B��Y��U��4�-6�и��؎Z-0�N�%7/�yS5l���7i����t[[|Q �?�}��s"c���|��e�O��,υ����Y���(-�>�c8��)�ݱ����B-�8N<���OI%qS�ng-�x[~�r����\��NЛq+z5����q���x�' ���S�;i�|���n�b!Xst`��YA�['��7�di�/5��p�q�43mN���O����i�A����U��0�o�	�١ָN�<���@�3
	k�_mGlDP	�S���6NX�̼-??�b:��a��/\�*˝�a!��[)Y#�t�����0�R�/NR������(��d�2�΃v���ƅ��@Ri^�?=�b�I��w��٢�=
!L� ��,] �<h��E�i����2q�K���+��f�5ۂV����CԾ�D�2^�,����%���)`+���;�w�Y������%��c�n�,50/�J��i�u�r���`~ꇛ3��d��_�VVw�o|-S�&�q�X��yS2[ý��(˫sy�s�G���� D�ޱ���F�:(HвP;t��'!˂��>�� ߕ�R���3L���-�4كg(?��X��H��߆�PXf�0(���T�F� �L�]}d��K��R����Ñ��m� =��E,�N���Z�\7 �o\�9O�P
�.�À{1q��y�{3�Pa��G(�ʱ?c8 �l��I�9y��3T�G���tY<<��������J�k��%�pvMF�+p����g��u`��G�
-��L��1@W2٣z=�F���f%,վd.C���E $Pa�nQb/��8��r;P�+Ub~!��,�Ǘr����؝����4t#���M3��-8a3:<q`_*��b�
g�l�Ȍ�}i֮�w	���z�(��XѴf���]�*-:l�Ʃ�	���v"��k��j�g��E��u�{�+�/�� ��ve����"����G�%N�f'66�5�`U&���#�v-���.��b�)���[�`lW���Y�9F8�R�X��=ݜ�= �]�?nm�)F?�
;�S�zY��$�����B��q+����~/q��C �q��2(�_�P��lr#�}��}�2����V�E�gl���,a\��T#��!���Q��O@���w�=�	Ȩ��g��箍���l2H����V�kj��ŉ\b���܈��"t�|!(u�T���gqF��C��tg���)��p�/2`����L��!�o$�d�
�aWI���F����-W��Y6�������ӂ�<���/:t@�cI�ÜA�"S�.�YE!�۲�k8��Q|��#��H��9���@�'��Z߲U,�V�X_����Q""2�w�ߠ���y�*��<d�T ��N� 
�9M+;m���`CYZ� ͓'�K,�S)=0Fl`�?�����b��crL��"�i�����Y���쑕?2]���(�R�G�i�!ڍA��(]	�
.$��8�DD�"�d#���&0���0�p��m~ fQ��E~©V��o����B�#X�R��m�ɺ�N�@|�P�
�?�(Cč��m�¶�H���"�9�"ub@��L�.ߚW($���Xf�`��|��=_ɧ�3�NfV<>B0$A\���:}�nǔ:K��Y��?�?x��h��%��e�/����wEq��x;/?� |�W�w�"g
�{'^�gd��:����tµ(`T�g�S��Z�23�I��#.v�󘉏hPH��ߧ�B$�������	k��!�Jyj&̫B�p��R�G��`ϳ�|�r%��&��L8���,�ҡDE�+�Ue����	_�7@ky����,>��^t����9J��(��y%L�.��FI���g���T�9M�Dj�<�q�ŵ��>wg�	��V��2��B_�ap�`C�p�J��<��-$�|�J���'��	�1ްTl!�M����4��.��45O��l�\WA}��T<'v�'"A�F��Tͮg����q�@��~$����,���w,~��rĵ��N_��!���������q�q'�-D��_�?�L���f�lr�ެ�1w-m�M�I�ճ,�Voj$
���l��'�
�[�l�9a"�=`kħ�Q�QE��|�/����"r�����@&�B ��n��J#b�Y,�xgB�O��9��{B�#�K�	_��1�H�Ll��	�.���%�"����%i� �3p��ϱY�SS�[��d
.@��!P��V�i7����|·�T�$.;U�v4c��KD@@��
��Mw��v�GOܡs�p�`ʁ{�-�d�&������ˮ Lyʆf����ܽl���Q�D���>#H���}`(�G�:�j�U������)�z�E�Kd������O��|���f�y�k�X�<��d�'0k�0�`7� /���Zl�y�f,~�褺�M=5F���4��9���%'u�C��w`E�p.e���S�X�4`�Y�Q�Q�"e�rT���<㛄�6��ď� �q^�(V�Df
�_c�q	�Ʒ q;R\Z-<@TX��3PM\��:��������d��蓦��fC Ό�p�K��L$C��ǜ��j��,���f����8���l+��.s���ua�9�WN���
ڄ�@8��N��o
�^LH¼��Oʟҥ��a�����wb���F�-���X�ڀ�9�p,��ҳX�	�J�Dݤ�G� P������?�HV͚m��ʋޥ6�D�U���g��5NShWK}[�\���Z�L"?�������/`6q�kd�������'4I4�Ú�k�ە��6 �+��&i�ʪ6�Xx׶i��Uq��D��VVF|ϲl���bn=��`wRl� ;�p���.��ٳ�b�?b-� &�����Z����Y�(ڼ�7�=�,D�p�x6����<�5a>�yd��Yj�l�f�&n���6$��D`z���l͟�=��E6�G(�g��O`��ؖc��L'2"��1\���x������<{�NaZ�u,����]��C��<ky<
��o�B��"c뱬�H��i�֬V2�H�5�V)�e�Ƃ}_@t|��]��]�[���X��Ŭ��d|E7	��թڦ��ϫ��V�0�k�f�'�Gb���kH�@�8k��K����r(�7�v[�����F�	��ZR_r�8-v�H����hsUp+��6�U��8�7@����E�˒�n�ф�m�[s��4TLS�r��b���2
k߱����<�=T�J��ư<G^p���$�Rݓ�OA�X5_�%O��2�ZX�I��K��gE�'E��"�0� fה�⧑�EϜt]���W8����g_��jspF1�R-q1X�Mqw��t�2��8��"Xg��� ×<Y�F�_"d,,Y�<� ���g萰�k�cK0;봟��2�F�b���$�X�8�Zc�X�b� q����%["��o_��9"�7o��&�}P�U5��W��P:͌����L��V8!m=
��@�3
$"��^�K����ܵ�#8�,`m�m�T��M����"�f!�ܼ\�b��o��k!�;A�x��y�x�.
:�,�2�nc�|! ��s���M���R��~-�碧�"]�F�$;6����s%����g�I/e�{��p�TUZ9_�d�bp��h�o�!|Ka��,��Xd���4Á5x`�E'��`�\���a��淽�S�A�Й3��I9� Ž��ܷ�N�ȍF�5�    �L��3��rқGs[�d��\K"��P��0����:�4����,`l��t^	E�x�h�i$8jюq�yG��&��Q��x��վ��>�����K�J�JÈ��R5�U�ɾ���ŨF襦������hKV�,l$<��$�۷� M��؉���� }�-}7��n-㌢ �z��&�ٮ>K���܋��J�%��vf����7\�lT��&Gqv�Dz�1fK��ɚm�,��L�p�%�v�$���K�J褮e����Ư Dãg��HEos��/|�O�R�	R�>�LX�7N
�g�!���%a�\4	If�fb+6��곔� �U~�O�2j�z�V��?'���X�$��E=�`��ҼPC���ZW a�9�c�\]9�L���C�m����&���&���0���\�oAT_���,dM	��������+}`%6Ո.�. z��	����d��X��(�y	���Av�ت�xU����� ��T�z�Ù� ���n:'3Ǩ�g��'ڋ])�:X�=��M�]"�Q��?�l���hX���Q��� ��q5�T-:x��V@dq�����%J7�?a'�g,ݛ7�����O?�BO.�D7�4O�X$���J<�M-��@v�
��ܣ
W�CVY�4t:.�fmW�)&߷��ؖ�cU�(8�7�z@����o7��Zoi�mwC�1��X9��$��e�	N�֩"ն%��l[E�"�;�'�����yq�$��a��nff)��^b�r<�u��0���H�y-�*�7���(�1�A5�o�g�ar�?`H������FDm:�C,�5�'2�ßϳ[�!߸�0���S3���"��a)�ɕ��S\��aox��Q��3(C[T�	o�c��,�s�̙����6�9���m B�*�����ci�~
��L�ܲ],S�R�1d���NB�I�!1`���{����k���)^,�� ��Wlm����Bu��dm>��Q���[��-��/{+V���~.�H,K/������C�|X�X�7�����e`�I��J�r�\| F]�:�S�X�]��9�Š�@�/gB�V��58Fu@�!�t(�.�ި��"Q��c���ë�r��.���t=W8Ռ�D:Q[խr�x1B>��b�@��ОQ�g��ޤ�4\��z�ү=�?��)���ꛅX�Boo���˚ 2h��.%h��Pw��Ѣ�|��~S�EƟ���}���q��Bؖ��"5/U�Yh4�#@P�*�qͶ��A|I�zH��
9"�B���D}��`[%,�Q1����Bϒ��@�<.���*�]��vA@�(5�Xc�/�,k��H�2��q z����!C�x!Vy���0�E�Qu�u7�B���Tz��l����/$�Ie���Ƶ�HȰi\[bK�x���0��j+�#�~�?�~��Mai/��Q���X��`����]]�9fY���=n�"�B����<N�Z� 6��\m��V���)W/+�-�fh
?�X���zA�06��j���S0Z�-�;t7����^(�j{���b-��M�-m��q���+��?RbA�r��ʥȠ��rW�(�{s�TRpX_�Ɨ2�bL��k��ܳ1����b��2�oշ�\%a�����,��k���m�^�q�^Y�AY�,��Ct���1P�˿9��S�=��P�k(=%�K`��U�;����v���T���W��>v͸.�3΁F��_@���\�;+i����y{��-�}���FMb����ɲ}Q��� ��?��XT�c�*����LJ}���rޜ�1-���S5'0oV�fc��a�[}�g*;Cg�YFE��[��!F��d��"m 6 ��oY�����_�b�=�3��d���5�+��(}��!�5N�c�:w��o�_~��K
z�'�{��	���C��&�Ӛ�8lпG�~��?H=���x 00γ-�L�1�e���$�ة���x�oT��o�{�]ϧ���P��D.�.ӱŞ��?C���敋�N�~��X-Y���j��9Jh_<z�C��Ur�&.������]җ ���b���7�O�2��qQ~��?�	�R���*� >�=�i�L����KY�od�Q;�.jE��^���8�K��.c�=�xޥ�;6���ޑ�B�)-���6�b�LOJH��̸Ҝ��A'�����$v��\�[����%^����Q�L�K� @�3<��k��^ߍt�V�w�#W���ã0��F�X�d`O*~�SL�^mC�W�%�}����r5�A Ľyo��%�K�]�xCq	��j_�)5�J�0�+����5��@��#�{�R'���(2jJ��`��<���� �Ό[���(?�r�f�=���Q
o�E�$��y!�W��Z{��W����Wt�����|js�� ׁ���=��s�oFʀ$��*Q�b��v0�-N�@���S(����Q8�"�CU؆+-P��*��Y�2�n�4o����T��f^2l2�wh4e�?�"ci�Z#q�űUZOy��Px�.��'Hݙj��ź��`�k�r����Q���@�F�#իx>��]IMwB�Ϙ������U}���_�P�k��M�(N\�SXpi[��`�<? ,Z!۵)�G����}�1V��aw�PDZu0�lm�)��"V{��-8lX4>T$���)��H5��y��@˿C6ɝ��T5��d�b=	8���j��Q74���)���k�X(U�p�^H�G?��s���=W�#�[l���9��1�}O-��n?~�L����SݒN`�WN<
��^�i�?�PX�D��,��kP-��Rlh|����]`�Q���������`v�)��y{7D�����+J�Fz��!{���&W=S(��,n�ƾw��cK6+P�Iw֗��U@�W]�6^�~�J�̓�ߒ�XJ��6O����m�"���A�9�_�� 0��d#��X�Y���ޅ؎�Q� �@��FUn@�G:��߆P`؈3!��t������`cT�h�۹{���/O$��G��
]��ڒ��wOu;���춎�0^�֯����{ּ ��i�I{�@���������}�`i��xaˣz���l�XG�BE�iP�tj��RB���u{��uU��<�����5��^�|��F����W~�dc߂�v�*pW��{�=C���*>0�{xze�@��C��s}Q�o��l)��O?cS ��:�)+�}�!H��P�����Ā����r��|]dl�h���w�IW����E�7�D]����v���S�]�=�����S�R����CZ+F����
H���聻XU�Bo�� ��l��A��;=����6��O�r�C-�v �#Bّ��W�2W�9DP�V�O�����!o֘w�(UYɡD��A�LUw��AH�X����l�G�W �1N+�����URp@�n��ԥ���QYu��.u����Z�ly�É(���}_�Q���9S��
��G�b�<�n���b��'t��>ϓ�y���'�A����OL0��W5
u�v�1Ѧ����c��bUA��!�|,��a�q��_�t���mΨ;j20�E��w��z�~���0�^��gfST؊�[�bӮ��N(2nU#���m�3L�7�U+Ԇl*�k5!��<��Lp�.>��m�C1�|�N`N�3�c�8_���Sד�
��u�����2�LA>vy�?�U�޲T� ��<�u/5��]����x}�\! ��R�?���a���*h�b�%!ƪ`-+�I1��Pu�/1Mrju�����#���K�(��q��A�f��<ǣPϸYc��?�P~%���WcB�B",���r��zLFc�0D��� 
��;�]�ڛ�8x$ԢK��š�QY�,������D5uۚ��׶�J�h��:�0Q�cgT���z���T��Myƫ��\�*[�i�,S�OA>ݣ�C=�	�'_�
($�8-�J�H?K�T����	u�Í��ͺ�ĥ̾/D~��t�"! -�{:� �   �c�&0�f �Gw7j���D�����s������(�J`�s�&�����=���%
�G˺]�Fۊ��i��m6.U/��i��]8i9�ac9#h�$��𓡡&�b1��߲��̊a�� iM.�|�w��ŋ��Ƞ�      �   y   x�-�=
1�z�s������ł��'~����$��v/&��+�Z&O�9��kA���|��f"�t/ЍL�_�c{byC�2ΰ�H/�XRFgt'g��;�C�r4��@�[/+U�J�*�     