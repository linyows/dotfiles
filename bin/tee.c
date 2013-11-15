#include <stdio.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <locale.h>
#include <unistd.h>
#include <fcntl.h>
#include <err.h>
#include <time.h>
#include <string.h>

typedef struct _list {
        struct _list *next;
        int fd;     /* ファイル記述子 */
        char *name; /* argvから取得したファイル名 */
} LIST;
LIST *head;

void
add(fd, name)
  int fd;
  char *name;
{
  LIST *p;

  if ((p = malloc((size_t)sizeof(LIST))) == NULL)
    err(1, "malloc");
  p->fd = fd;
  p->name = name;
  p->next = head;
  head = p;
}

int
main(argc, argv)
  int argc;
  char *argv[];
{
  LIST *p;
  int n, fd, rval, wval;
  char *bp, *r;
  int append, ch, exitval;
  char *buf;
#define BSIZE (8 * 1024)

  int timestamp;
  char *line;
  time_t t;
  char datefmt[256];
  char datestr[256];
  memset(datefmt, '\0', sizeof(datefmt));
  memset(datestr, '\0', sizeof(datestr));

  /* ロカールを初期化 */
  setlocale(LC_ALL, "");

  append = 0;
  timestamp = 0;
  while ((ch = getopt(argc, argv, "ait:")) != -1)
    switch((char)ch) {
    case 'a':
      /* "-a"ならファイルへ追記する */
      append = 1;
      break;
    case 'i':
      /* "-i"ならSIGINTを無視する */
      (void)signal(SIGINT, SIG_IGN);
      break;
    case 't':
      /* "-t"ならタイムスタンプを記録する */
      timestamp = 1;
      if ( optarg != NULL && strchr(optarg,'%') ) {
          strncpy(datefmt, optarg, sizeof(datefmt) - 1);
      } else {
          strcpy(datefmt,"[%Y/%m/%d %H:%M:%S]	");
          optind -= 1;
      }
      break;
    case '?':
    default:
      (void)fprintf(stderr, "usage: tee [-ai] [-t [date_format]] [file ...]\n");
      exit(1);
    }
  argv += optind;
  argc -= optind;

  /* バッファ領域の確保 */
  if ((buf = malloc((size_t)BSIZE)) == NULL)
    err(1, "malloc");

  add(STDOUT_FILENO, "stdout");

  for (exitval = 0; *argv; ++argv)
    if ((fd = open(*argv, append ? O_WRONLY|O_CREAT|O_APPEND :
        O_WRONLY|O_CREAT|O_TRUNC, DEFFILEMODE)) < 0) {
      warn("%s", *argv);
      exitval = 1;
    } else
      add(fd, *argv);

 while ((rval = read(STDIN_FILENO, buf, BSIZE-1)) > 0)
   for (p = head; p; p = p->next) {
     n = rval;
     bp = buf;
     do {
       if(p->fd == STDOUT_FILENO || ! timestamp){
           wval = write(p->fd, bp, n);
       }else{
           line = memchr(bp, '\n', n);
           if (line == NULL) {
               wval = write(p->fd, bp, n);
           } else {
               wval = write(p->fd, bp, line - bp + 1);

               /* timestamp をログに追記 */
               t=time(NULL);
               strftime(datestr, sizeof(datestr), datefmt, localtime(&t));
               write(p->fd, datestr, strlen(datestr));
          }
       }
       if (wval == -1) {
         warn("%s", p->name);
         exitval = 1;
         break;
       }
       bp += wval;
     } while (n -= wval);
   }

 if (rval < 0) {
   warn("read");
   exitval = 1;
 }

 for (p = head; p; p = p->next) {
   if (close(p->fd) == -1) {
     warn("%s", p->name);
     exitval = 1;
   }
 }

 exit(exitval);
}
