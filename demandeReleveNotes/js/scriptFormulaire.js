new Vue({
  el: "#app",
  vuetify: new Vuetify(),
  data: () => ({
    e1: 0,
    type: "success",
    rep: false,
    isOkay: false,
    switch1: false,
    valid: true,
    valid2: true,
    menu: false,
    e1: 1,
    theMessage: "test",
    demandeur: {
      nom: "",
      prenom: "",
      dateNaissance: "",
      email: "",
      cin: "",
      telephone: "",
      adresse: "",
      identiteDemandeur: "",
      dateDemande: new Date().toISOString().substr(0, 10),
      estRecupere: 0,
    },
    releve: {
      anne: "",
      niveau: "",
      filiere: "",
      groupe: "",
      estAnneeComplete: "",
    },
    headers: [
      {
        text: "Année de formation",
        align: "center",
        value: "anne",
      },
      {
        text: "Niveau",
        align: "center",
        value: "niveau",
      },
      {
        text: "Filière",
        align: "center",
        value: "filiere",
      },
      {
        text: "Groupe",
        align: "center",
        value: "groupe",
      },
      {
        text: "Année complétée",
        align: "center",
        value: "estAnneeComplete",
      },
      { text: "Actions", value: "actions", sortable: false },
    ],
    liste_releves: [],
  }),
  watch: {
    menu(val) {
      val && setTimeout(() => (this.$refs.picker.activePicker = "YEAR"));
    },
  },
  methods: {
    isRequir: function (value) {
      return !!value || "Champ requie";
    },
    alphaSpace: function (value) {
      return /^[a-zA-Z ]*$/.test(value) ? true : "Vérifier le champ";
    },
    isEmail: function (value) {
      return (
        /.+@.+\..+/.test(value) ||
        "Veuillez respecter le format du courriel (exemple@demaine.fr)"
      );
    },
    isId: function (value) {
      return (
        /^[a-zA-Z ]{1,2}\d{5,6}$/.test(value) ||
        "Veuillez respecter le format du CIN"
      );
    },
    isPhone: function (value) {
      return (
        /^(\+212|0)([ \-_/]*)(\d[ \-_/]*){9}$/.test(value) || "Numero incorrect"
      );
    },
    isYear: function (value) {
      return /^\d{4}$/.test(value) || "Anne incorrect";
    },
    isRightYear: function (value) {
      return (
        (Number(value) >= 2008 &&
          Number(value) <=
            Number(Number(new Date().toISOString().substr(0, 4))) - 1) ||
        "l'année doit être comprise entre 2008 et " +
          Number(Number(new Date().toISOString().substr(0, 4)) - 1)
      );
    },
    cantRequestOrNot: function (value) {
      let response = true;
      if (Number(this.releve.anne) == 2008 && this.releve.niveau == "2A") {
        response = false;
      } else {
        if (
          Number(this.releve.anne) ==
            Number(Number(new Date().toISOString().substr(0, 4)) - 1) &&
          this.releve.niveau == "1A"
        ) {
          response = false;
        }
      }
      this.releve.anne = this.releve.anne;
      return response || "Année non autorisé";
    },
    save(date) {
      this.$refs.menu.save(date);
    },
    validate() {
      if (this.$refs.form1.validate()) {
        this.e1 = 2;
      }
    },
    addRow() {
      if (this.$refs.form2.validate()) {
        let row = Object.assign({}, this.releve);
        this.liste_releves.push(row);
      }
    },
    deleteItem(item) {
      const index = this.liste_releves.indexOf(item);
      confirm("Are you sure you want to delete this item?") &&
        this.liste_releves.splice(index, 1);
    },
    sendRequest() {
      let data = Object.assign({}, this.demandeur);
      data.liste_releves = this.liste_releves;
      data.liste_releves.forEach((element) => {
        if (element.estAnneeComplete == "oui") element.estAnneeComplete = 1;
        else element.estAnneeComplete = 0;
        element.anne = Number(element.anne);
      });
      axios
        .post("demandeReleveNotes/Script.php", data, {
          baseURL: "../",
        })
        .then((data) => {
          console.log(data);
          if (data.status >= 200 || data.status < 400) {
            if (data.data) {
              let toDay = new Date();
              toDay.setDate(toDay.getDate() + 7);
              this.theMessage = `
              M./Mme ${
                this.demandeur.nom
              } Votre demande de retrait du relevé de note est enregistrée avec succès.
              Vous pouvez la récupérer à l’établissement à partir du ${
                toDay.getDate() +
                "/" +
                (toDay.getMonth() + 1) +
                "/" +
                toDay.getFullYear()
              }
              `;
              this.rep = true;
              setTimeout(function () {
                window.location.href = "index.html";
              }, 10000);
            }
          } else {
            this.theMessage =
              "Erreur de connexion à la serve veuillez réessayer";
            this.type = "error";
          }
        })
        .catch((err) => {
          console.log(err);
          return null;
        });
    },
  },
});
