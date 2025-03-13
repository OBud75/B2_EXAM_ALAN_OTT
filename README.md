# LINUX_B2_EXAM_ALAN_OTT

## 0.Generals

### 1. Quelle différence entre GNU et Linux ?

Linux est un noyau de système d'exploitation de type UNIX.

GNU est un système d'exploitation libre

### 2. Qui est l'inventeur de Linux ? Citez un autre programme célèbres dont il est à l'origine.

Linus Torvalds

## 1. FileSystem - /home/01FileSystem/

### 1. Créer un dossier "assets" à la racine du dossier d'exam
``` bash
mkdir assets
cd assets
```

### 2. Dans ce dossier, créer 10 fichiers "img_1.png", "img_2.png" ...
``` bash
touch img_1.png img_2.png img_3.png img_4.png img_5.png img_6.png img_7.png img_8.png img_9.png img_10.png
```

### 3. Dans ce même dossier, créer un fichier "du_texte.txt" contenant "Hello, world".
``` bash
echo "Hello, world" > du_texte.txt
```

### 4. Renommer tous les fichiers .png du dossier en "img_1.jpeg", "img_2.jpeg" ...
``` bash
for i in $(seq 1 10); do mv img_$i.png img_$i.jpeg; done
```

### 5. Créer un dossier "medias" dans le dossier "assets", déplacez y tous les fichiez .jpeg du dossier "assets".
``` bash
mkdir medias
mv -- *.jpeg medias
```

### 6. A quoi servent les formats de fichiers (.png, .txt, .jpeg) ?
``` 
.png 
 - PNG (Portable Network Graphic) est un format de fichier d'image pixellisé
 - IMAGES

.txt 
 - TXT (ou "text file”) est un format de fichier texte simple qui peut être utilisé avec n'importe quel système d'exploitation
 - TEXT

.jpeg
 - JPEG est l'acronyme de (Joint Photographic Experts Group), l'organisation internationale qui a normalisé ce format à la fin des années 1980 et au début des années 1990
 - IMAGES
```

### 7. Créer un fichier "script" (toujours dans le dossier) qui affiche "Hello world", ajoutez #!/usr/bin/bash
```
/home/01FileSystem/script01.sh
vi script01.sh
chmod +777 script01.sh
./script01.sh
```
``` bash
#!/usr/bin/bash
echo "Hello, World"
```

### 8. A quoi sert la ligne #!/usr/bin/bash ? Quelles différences avec le lancement du script via "bash script" ?
``` 
ca dit a la console quelle compilateur "bash - trouver dans /usr/bin/" utiliser pour executer le script
ils y a pas de difference, en utilisant la comand bash _ on utilise le compilateur a base de notre variable denvironement
```

## 2. Commandes - /home/02Commandes/


### Créer un dossier "commandes"
``` bash
mkdir commandes
```

### Créer un fichier "too_long" contenant 100 lignes : "Ligne 1", "Ligne 2", "Ligne 3" ...
``` bash
touch too_long
for i in $(seq 1 99); do echo "Ligne $i," >> too_long; done
echo "Ligne 100." >> too_long
```

### Affichier les 5 premières lignes.
``` bash
head -n 5 too_long
```

### Afficher les 7 dernières lignes.
``` bash
tail -n 5 too_long
```
### Afficher les 3 lignes avec les nombres les plus élevés mais en utilisant head + sort
``` bash
cat too_long | grep -n "[0-9]" | sort -n -r | head -n 3
```

### Afficher uniquement la ligne "Ligne 42".
``` bash
grep "Ligne 42" too_long
```

### Remplacer le ligne "Ligne 42" par "The Ultimate Question of Life, the Universe and Everything"
``` bash
sed -i "s/Ligne 42,/The Ultimate Question of Life, the Universe and Everything/g" too_long
```

### Créer un script "script" qui :
``` bash
vi script.sh
```

# i. Lit tous les arguments passés au script.
``` bash
#!/bin/bash
echo $@
```

# ii. Passe le premier argument à une fonction "check_argv", cette fonction doit retourner 1 si l'argument n'est pas vide et 0 s'il n'y a pas d'arguments.
``` bash
#!/bin/bash
echo $@

check_argv () {
    if [[ -z "$1" ]]; then
        echo 1;
    elif [[ "$1" -eq 0 ]]; then
        echo 0;
    fi
}
```

# iii. Récupérez la valeur retournée par la fonction et affichez la.
``` bash
#!/bin/bash
echo $@

check_argv () {
    if [[ -z "$1" ]]; then
        echo 1;
    elif [[ "$1" -eq 0 ]]; then
        echo 0;
    fi
}

check_argv
```


### En quelques mots, quelle est la différence entre un if/else et un switch.
``` 
un if/ else verifie une condition et passe a la prochaine condition un par un (grandO -O n)
un switch case fait un GOTO vers une address donc est becoup plus rapide (grandO -O 1)
```

### Dans le fichier "script", ajouter un switch qui check si le 2ieme argument passé au programme est "hello", "toto" ou autre chose.
``` bash
#!/bin/bash
# ...

case $2 in 
    "hello")
        echo "hellllooo"
        ;;
    "toto")
        echo "totooo"
        ;;
    *)
        echo default
        ;;
esac
```
``` bash
bash script.sh 4 "hello"
bash script.sh test "toto"
```


## 1. Users - /home/03Users/


### Lister les utilisateurs actuellement sur votre machine.
``` bash
awk -F':' '{ print $1}' /etc/passwd
```

### Créer un nouvel utilisateur "Toto" avec un groupe du même nom.
``` bash
sudo useradd Toto
sudo groupadd Toto
sudo usermod -a -G Toto Toto

grep editorial /etc/group
```

### Lister les groupes auquels fait parti ce nouvel utilisateur.
``` bash
getent group | grep username
getent group | grep Toto
```

### Créer un groupe "shared" avec votre utilisateur classique + Toto
``` bash
sudo groupadd shared
sudo usermod -a -G shared Toto
sudo usermod -a -G shared root

grep shared /etc/group
```

### Expliquer brièvement à quoi sert de préfixer une commande par le mot "sudo".
``` 
executer une commande avec les permission de root

permet de proteger votre utilisateur quand ils n'utilise pas sudo 
```

### Tous les utilisateurs peuvent ils utiliser ce mot clé ?
``` 
Non, seulment les utilisateur qui font parti du group sudo avec les permission sudo
```

### Comment donner à Toto le droit d'utiliser "sudo" pour une commande spécifique telle que "apt install"?
``` bash
%Toto ALL=(ALL) NOPASSWD: /usr/bin/apt-get install *
```

### Comment donner à Toto le droit d'utiliser "sudo" en permanence ?
``` bash
sudo adduser Toto sudo
```

### Pourquoi ne pas tout faire avec l'utilisateur root ?
``` 
Les permission de root l'ui authorise des commandes qui peuve etre destructive aux system qui sont irreversible 
```

### Comment faire pour qu'à chaque fois que toto démarre un shell, un message "bienvenue toto" s'affiche ?
``` bash
echo 'echo "Welcome Ramkumar"' >> bash.rc
```


## 4. Permissions - /home/04Permissions/

